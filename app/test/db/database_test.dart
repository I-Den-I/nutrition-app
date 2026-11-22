import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutrition_app/core/db/app_database.dart';

void main() {
  late AppDatabase db;

  setUp(() => db = AppDatabase(NativeDatabase.memory()));
  tearDown(() => db.close());

  test('seeds meal groups, nutrients, profile and goals', () async {
    final groups = await db.select(db.mealGroups).get();
    expect(groups.map((g) => g.systemKey), systemMealGroups);

    final nutrients = await db.select(db.nutrientDefinitions).get();
    expect(nutrients.map((n) => n.code), contains('fiber'));

    expect(await db.select(db.profiles).get(), hasLength(1));
    expect(await db.select(db.goals).get(), hasLength(1));
  });

  test('product gets a client-side UUID and sync timestamps', () async {
    final p = await db
        .into(db.products)
        .insertReturning(
          ProductsCompanion.insert(
            name: 'Chicken breast',
            kcal: 165,
            protein: 31,
            fat: 3.6,
            carbs: 0,
          ),
        );
    expect(p.id, hasLength(36));
    expect(p.visibility, ContentVisibility.private);
    expect(p.deletedAt, isNull);
  });

  test('diary entry must reference exactly one of product or dish', () async {
    expect(
      () => db
          .into(db.diaryEntries)
          .insert(
            DiaryEntriesCompanion.insert(
              day: '2026-11-22',
              grams: 100,
              snapshotKcal: 0,
              snapshotProtein: 0,
              snapshotFat: 0,
              snapshotCarbs: 0,
            ),
          ),
      throwsA(isA<SqliteException>()),
    );
  });
}
