import 'package:drift/drift.dart';

import '../../../core/db/app_database.dart';

class MealGroupsRepository {
  MealGroupsRepository(this._db);

  final AppDatabase _db;

  /// All non-deleted groups (hidden ones included), in display order.
  Stream<List<MealGroup>> watchAll() =>
      (_db.select(_db.mealGroups)
            ..where((g) => g.deletedAt.isNull())
            ..orderBy([(g) => OrderingTerm.asc(g.sortOrder)]))
          .watch();

  Future<void> addCustom(String name) async {
    final last =
        await (_db.selectOnly(_db.mealGroups)
              ..addColumns([_db.mealGroups.sortOrder.max()]))
            .map((r) => r.read(_db.mealGroups.sortOrder.max()))
            .getSingle();
    await _db
        .into(_db.mealGroups)
        .insert(
          MealGroupsCompanion.insert(
            customName: Value(name.trim()),
            sortOrder: Value((last ?? 0) + 1),
          ),
        );
  }

  Future<void> rename(String id, String name) =>
      (_db.update(_db.mealGroups)..where((g) => g.id.equals(id))).write(
        MealGroupsCompanion(
          customName: Value(name.trim()),
          updatedAt: Value(DateTime.now()),
        ),
      );

  Future<void> setHidden(String id, {required bool hidden}) =>
      (_db.update(_db.mealGroups)..where((g) => g.id.equals(id))).write(
        MealGroupsCompanion(
          isHidden: Value(hidden),
          updatedAt: Value(DateTime.now()),
        ),
      );

  /// Only custom groups can be deleted; built-in ones can be hidden.
  Future<void> delete(String id) {
    final now = DateTime.now();
    return (_db.update(
      _db.mealGroups,
    )..where((g) => g.id.equals(id) & g.systemKey.isNull())).write(
      MealGroupsCompanion(deletedAt: Value(now), updatedAt: Value(now)),
    );
  }
}
