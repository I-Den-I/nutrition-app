import 'package:drift/drift.dart';
import 'package:meta/meta.dart';

import '../../../core/db/app_database.dart';
import '../../../core/db/watch.dart';
import '../../../core/domain/dish_calculator.dart';
import '../../products/data/products_repository.dart';

@immutable
class DishIngredientView {
  const DishIngredientView(this.item, this.product);

  final DishItem item;
  final ProductDetails product;
}

@immutable
class DishDetails {
  const DishDetails({
    required this.dish,
    required this.ingredients,
    required this.breakdown,
    required this.mealGroupIds,
  });

  final Dish dish;
  final List<DishIngredientView> ingredients;
  final DishBreakdown breakdown;
  final Set<String> mealGroupIds;
}

@immutable
class DishItemDraft {
  const DishItemDraft({required this.productId, required this.grams});

  final String productId;
  final double grams;
}

@immutable
class DishDraft {
  const DishDraft({
    this.id,
    required this.name,
    this.description,
    this.cookedWeightG,
    this.items = const [],
    this.mealGroupIds = const {},
  });

  final String? id;
  final String name;
  final String? description;
  final double? cookedWeightG;
  final List<DishItemDraft> items;
  final Set<String> mealGroupIds;
}

class DishesRepository {
  DishesRepository(this._db, this._products);

  final AppDatabase _db;
  final ProductsRepository _products;

  List<TableInfo> get _tables => [
    _db.dishes,
    _db.dishItems,
    _db.dishMealGroups,
    _db.products,
    _db.productNutrients,
  ];

  /// All dishes with their calculation, sorted by name.
  Stream<List<DishDetails>> watchAll({String query = ''}) {
    final q = query.trim().toLowerCase();
    return watchTables(_db, _tables, () async {
      final dishes =
          await (_db.select(_db.dishes)
                ..where((d) => d.deletedAt.isNull())
                ..orderBy([
                  (d) => OrderingTerm.asc(d.name.collate(Collate.noCase)),
                ]))
              .get();
      final filtered = q.isEmpty
          ? dishes
          : dishes.where((d) => d.name.toLowerCase().contains(q));
      return [for (final d in filtered) await _details(d)];
    });
  }

  Stream<DishDetails?> watch(String id) =>
      watchTables(_db, _tables, () => get(id));

  /// Includes soft-deleted dishes (old diary entries may reference them).
  Future<DishDetails?> get(String id) async {
    final dish = await (_db.select(
      _db.dishes,
    )..where((d) => d.id.equals(id))).getSingleOrNull();
    return dish == null ? null : _details(dish);
  }

  Future<DishDetails> _details(Dish dish) async {
    final items =
        await (_db.select(_db.dishItems)
              ..where((i) => i.dishId.equals(dish.id) & i.deletedAt.isNull())
              ..orderBy([(i) => OrderingTerm.asc(i.sortOrder)]))
            .get();
    final ingredients = <DishIngredientView>[];
    for (final item in items) {
      final product = await _products.get(item.productId);
      if (product != null) ingredients.add(DishIngredientView(item, product));
    }
    final groups = await (_db.select(
      _db.dishMealGroups,
    )..where((g) => g.dishId.equals(dish.id) & g.deletedAt.isNull())).get();
    return DishDetails(
      dish: dish,
      ingredients: ingredients,
      breakdown: calculateDish([
        for (final i in ingredients)
          DishIngredient(per100: i.product.per100, grams: i.item.grams),
      ], cookedWeightG: dish.cookedWeightG),
      mealGroupIds: {for (final g in groups) g.mealGroupId},
    );
  }

  /// Creates or updates a dish. Ingredients and meal groups are replaced
  /// (old rows soft-deleted) so sync sees every change.
  Future<String> save(DishDraft d) => _db.transaction(() async {
    final now = DateTime.now();
    final description = (d.description?.trim().isEmpty ?? true)
        ? null
        : d.description!.trim();
    final companion = DishesCompanion(
      name: Value(d.name.trim()),
      description: Value(description),
      cookedWeightG: Value(
        d.cookedWeightG != null && d.cookedWeightG! > 0
            ? d.cookedWeightG
            : null,
      ),
      updatedAt: Value(now),
    );

    final id = d.id ?? newId();
    final updated = await (_db.update(
      _db.dishes,
    )..where((x) => x.id.equals(id))).write(companion);
    if (updated == 0) {
      await _db.into(_db.dishes).insert(companion.copyWith(id: Value(id)));
    } else {
      final gone = DishItemsCompanion(
        deletedAt: Value(now),
        updatedAt: Value(now),
      );
      await (_db.update(
        _db.dishItems,
      )..where((i) => i.dishId.equals(id) & i.deletedAt.isNull())).write(gone);
    }

    for (final (i, item) in d.items.indexed) {
      await _db
          .into(_db.dishItems)
          .insert(
            DishItemsCompanion.insert(
              dishId: id,
              productId: item.productId,
              grams: item.grams,
              sortOrder: Value(i),
            ),
          );
    }

    // Meal groups: keep existing links, add new ones, soft-delete removed.
    final links = await (_db.select(
      _db.dishMealGroups,
    )..where((g) => g.dishId.equals(id))).get();
    final linked = {for (final l in links) l.mealGroupId: l};
    for (final groupId in d.mealGroupIds) {
      final l = linked[groupId];
      if (l == null) {
        await _db
            .into(_db.dishMealGroups)
            .insert(
              DishMealGroupsCompanion.insert(dishId: id, mealGroupId: groupId),
            );
      } else if (l.deletedAt != null) {
        await (_db.update(
          _db.dishMealGroups,
        )..where((x) => x.id.equals(l.id))).write(
          DishMealGroupsCompanion(
            deletedAt: const Value(null),
            updatedAt: Value(now),
          ),
        );
      }
    }
    for (final l in links) {
      if (!d.mealGroupIds.contains(l.mealGroupId) && l.deletedAt == null) {
        await (_db.update(
          _db.dishMealGroups,
        )..where((x) => x.id.equals(l.id))).write(
          DishMealGroupsCompanion(deletedAt: Value(now), updatedAt: Value(now)),
        );
      }
    }
    return id;
  });

  Future<void> delete(String id) {
    final now = DateTime.now();
    return (_db.update(_db.dishes)..where((d) => d.id.equals(id))).write(
      DishesCompanion(deletedAt: Value(now), updatedAt: Value(now)),
    );
  }
}
