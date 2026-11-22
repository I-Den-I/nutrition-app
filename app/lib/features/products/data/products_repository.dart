import 'package:drift/drift.dart';
import 'package:meta/meta.dart';

import '../../../core/db/app_database.dart';
import '../../../core/db/watch.dart';
import '../../../core/domain/nutrients.dart';

/// Product with its optional nutrients.
@immutable
class ProductDetails {
  const ProductDetails(this.product, this.extra);

  final Product product;

  /// Optional nutrients per 100 g/ml, by code.
  final Map<String, double> extra;

  Nutrients get per100 => Nutrients(
    kcal: product.kcal,
    protein: product.protein,
    fat: product.fat,
    carbs: product.carbs,
    extra: extra,
  );
}

/// What the product form saves. A new product may come with a
/// pre-generated [id] (so photos can be attached before saving).
@immutable
class ProductDraft {
  const ProductDraft({
    this.id,
    required this.name,
    this.description,
    this.basis = Basis.g,
    required this.kcal,
    required this.protein,
    required this.fat,
    required this.carbs,
    this.extra = const {},
  });

  final String? id;
  final String name;
  final String? description;
  final Basis basis;
  final double kcal;
  final double protein;
  final double fat;
  final double carbs;
  final Map<String, double> extra;
}

class ProductsRepository {
  ProductsRepository(this._db);

  final AppDatabase _db;

  /// All products, sorted by name, filtered by a case-insensitive [query]
  /// (done in Dart: SQLite's LIKE only folds ASCII, not Cyrillic).
  Stream<List<Product>> watchAll({String query = ''}) {
    final q = query.trim().toLowerCase();
    return (_db.select(_db.products)
          ..where((p) => p.deletedAt.isNull())
          ..orderBy([(p) => OrderingTerm.asc(p.name.collate(Collate.noCase))]))
        .watch()
        .map(
          (all) => q.isEmpty
              ? all
              : all.where((p) => p.name.toLowerCase().contains(q)).toList(),
        );
  }

  Stream<ProductDetails?> watch(String id) =>
      watchTables(_db, [_db.products, _db.productNutrients], () => get(id));

  /// Includes soft-deleted products, so old diary entries and dishes
  /// can still show them.
  Future<ProductDetails?> get(String id) async {
    final p = await (_db.select(
      _db.products,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    if (p == null) return null;
    return ProductDetails(p, await _extraFor(id));
  }

  Future<Map<String, double>> _extraFor(String productId) async {
    final rows =
        await (_db.select(_db.productNutrients)..where(
              (n) => n.productId.equals(productId) & n.deletedAt.isNull(),
            ))
            .get();
    return {for (final r in rows) r.nutrientCode: r.amountPer100};
  }

  /// Creates or updates a product with its optional nutrients.
  Future<String> save(ProductDraft d) => _db.transaction(() async {
    final now = DateTime.now();
    final description = (d.description?.trim().isEmpty ?? true)
        ? null
        : d.description!.trim();
    final companion = ProductsCompanion(
      name: Value(d.name.trim()),
      description: Value(description),
      basis: Value(d.basis),
      kcal: Value(d.kcal),
      protein: Value(d.protein),
      fat: Value(d.fat),
      carbs: Value(d.carbs),
      updatedAt: Value(now),
    );

    final id = d.id ?? newId();
    final updated = await (_db.update(
      _db.products,
    )..where((p) => p.id.equals(id))).write(companion);
    if (updated == 0) {
      await _db.into(_db.products).insert(companion.copyWith(id: Value(id)));
    }

    // Optional nutrients: update/insert present codes, soft-delete the rest.
    final existing = await (_db.select(
      _db.productNutrients,
    )..where((n) => n.productId.equals(id))).get();
    final byCode = {for (final e in existing) e.nutrientCode: e};

    for (final MapEntry(key: code, value: amount) in d.extra.entries) {
      final row = byCode[code];
      if (row == null) {
        await _db
            .into(_db.productNutrients)
            .insert(
              ProductNutrientsCompanion.insert(
                productId: id,
                nutrientCode: code,
                amountPer100: amount,
              ),
            );
      } else {
        await (_db.update(
          _db.productNutrients,
        )..where((n) => n.id.equals(row.id))).write(
          ProductNutrientsCompanion(
            amountPer100: Value(amount),
            deletedAt: const Value(null),
            updatedAt: Value(now),
          ),
        );
      }
    }
    for (final row in existing) {
      if (!d.extra.containsKey(row.nutrientCode) && row.deletedAt == null) {
        await (_db.update(
          _db.productNutrients,
        )..where((n) => n.id.equals(row.id))).write(
          ProductNutrientsCompanion(
            deletedAt: Value(now),
            updatedAt: Value(now),
          ),
        );
      }
    }
    return id;
  });

  Future<void> delete(String id) {
    final now = DateTime.now();
    return (_db.update(_db.products)..where((p) => p.id.equals(id))).write(
      ProductsCompanion(deletedAt: Value(now), updatedAt: Value(now)),
    );
  }
}
