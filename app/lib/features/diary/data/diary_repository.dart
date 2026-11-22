import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:meta/meta.dart';

import '../../../core/db/app_database.dart';
import '../../../core/db/watch.dart';
import '../../../core/domain/nutrients.dart';
import '../../dishes/data/dishes_repository.dart';
import '../../products/data/products_repository.dart';

@immutable
class DiaryEntryView {
  const DiaryEntryView({
    required this.entry,
    required this.name,
    required this.nutrients,
    this.basis = Basis.g,
  });

  final DiaryEntry entry;

  /// Current name of the product or dish.
  final String name;

  /// The eaten portion, from the snapshot taken when it was logged.
  final Nutrients nutrients;

  /// Unit of [DiaryEntry.grams]: millilitres for liquids, grams otherwise.
  final Basis basis;

  bool get isDish => entry.dishId != null;
}

class DiaryRepository {
  DiaryRepository(this._db, this._products, this._dishes);

  final AppDatabase _db;
  final ProductsRepository _products;
  final DishesRepository _dishes;

  Stream<List<DiaryEntryView>> watchDay(String day) =>
      watchTables(_db, [_db.diaryEntries, _db.products, _db.dishes], () async {
        final rows =
            await (_db.select(_db.diaryEntries)
                  ..where((e) => e.day.equals(day) & e.deletedAt.isNull())
                  ..orderBy([(e) => OrderingTerm.asc(e.createdAt)]))
                .get();
        final names = await _names(rows);
        final productIds = rows.map((e) => e.productId).nonNulls.toSet();
        final liquids = {
          for (final p in await (_db.select(
            _db.products,
          )..where((p) => p.id.isIn(productIds))).get())
            if (p.basis == Basis.ml) p.id,
        };
        return [
          for (final e in rows)
            DiaryEntryView(
              entry: e,
              name: names[e.productId ?? e.dishId] ?? '',
              basis: liquids.contains(e.productId) ? Basis.ml : Basis.g,
              nutrients: _snapshot(e),
            ),
        ];
      });

  Future<Map<String, String>> _names(List<DiaryEntry> rows) async {
    final productIds = rows.map((e) => e.productId).nonNulls.toSet();
    final dishIds = rows.map((e) => e.dishId).nonNulls.toSet();
    final products = await (_db.select(
      _db.products,
    )..where((p) => p.id.isIn(productIds))).get();
    final dishes = await (_db.select(
      _db.dishes,
    )..where((d) => d.id.isIn(dishIds))).get();
    return {
      for (final p in products) p.id: p.name,
      for (final d in dishes) d.id: d.name,
    };
  }

  static Nutrients _snapshot(DiaryEntry e) => Nutrients(
    kcal: e.snapshotKcal,
    protein: e.snapshotProtein,
    fat: e.snapshotFat,
    carbs: e.snapshotCarbs,
    extra: e.snapshotExtra == null
        ? const {}
        : (jsonDecode(e.snapshotExtra!) as Map<String, dynamic>).map(
            (k, v) => MapEntry(k, (v as num).toDouble()),
          ),
  );

  /// Values per 100 g of a product or dish, as they are right now.
  Future<Nutrients?> per100({String? productId, String? dishId}) async {
    if (productId != null) return (await _products.get(productId))?.per100;
    if (dishId != null) return (await _dishes.get(dishId))?.breakdown.per100;
    return null;
  }

  /// Logs a portion. Exactly one of [productId] / [dishId] must be set.
  Future<void> add({
    required String day,
    String? productId,
    String? dishId,
    required double grams,
    String? mealGroupId,
  }) async {
    assert((productId == null) != (dishId == null));
    final base = await per100(productId: productId, dishId: dishId);
    if (base == null) throw StateError('Product or dish not found');
    final portion = base.portion(grams);
    await _db
        .into(_db.diaryEntries)
        .insert(
          DiaryEntriesCompanion.insert(
            day: day,
            productId: Value(productId),
            dishId: Value(dishId),
            mealGroupId: Value(mealGroupId),
            grams: grams,
            snapshotKcal: portion.kcal,
            snapshotProtein: portion.protein,
            snapshotFat: portion.fat,
            snapshotCarbs: portion.carbs,
            snapshotExtra: Value(
              portion.extra.isEmpty ? null : jsonEncode(portion.extra),
            ),
          ),
        );
  }

  /// Changes grams and/or meal group. The snapshot is rescaled rather than
  /// recalculated, so later product edits still don't affect this entry.
  Future<void> update(
    DiaryEntry e, {
    required double grams,
    required String? mealGroupId,
  }) {
    final scaled = _snapshot(e).scale(e.grams > 0 ? grams / e.grams : 0);
    return (_db.update(
      _db.diaryEntries,
    )..where((x) => x.id.equals(e.id))).write(
      DiaryEntriesCompanion(
        grams: Value(grams),
        mealGroupId: Value(mealGroupId),
        snapshotKcal: Value(scaled.kcal),
        snapshotProtein: Value(scaled.protein),
        snapshotFat: Value(scaled.fat),
        snapshotCarbs: Value(scaled.carbs),
        snapshotExtra: Value(
          scaled.extra.isEmpty ? null : jsonEncode(scaled.extra),
        ),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> delete(String id) {
    final now = DateTime.now();
    return (_db.update(_db.diaryEntries)..where((e) => e.id.equals(id))).write(
      DiaryEntriesCompanion(deletedAt: Value(now), updatedAt: Value(now)),
    );
  }
}
