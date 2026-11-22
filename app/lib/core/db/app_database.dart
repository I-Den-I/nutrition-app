import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'enums.dart';
import 'ids.dart';
import 'memory_connection.dart';
import 'tables.dart';

export 'enums.dart';
export 'ids.dart';

part 'app_database.g.dart';

/// Optional nutrients known to the app. Order = display order.
const optionalNutrients = <(String code, String unit)>[
  ('fiber', 'g'),
  ('sugar', 'g'),
  ('sat_fat', 'g'),
  ('salt', 'g'),
  ('water', 'ml'),
];

/// Built-in meal groups (names are translated in the UI by key).
const systemMealGroups = ['breakfast', 'lunch', 'dinner', 'snack'];

@DriftDatabase(
  tables: [
    Products,
    NutrientDefinitions,
    ProductNutrients,
    ProductServings,
    Dishes,
    DishItems,
    DishMealGroups,
    Media,
    MediaBlobs,
    MealGroups,
    DiaryEntries,
    Profiles,
    WeightLog,
    Goals,
  ],
)
class AppDatabase extends _$AppDatabase {
  /// Use a custom executor (e.g. in-memory) — handy for tests.
  AppDatabase(super.e);

  /// The real on-device database for every platform, or a throw-away
  /// in-memory one with `--dart-define=IN_MEMORY_DB=true`.
  AppDatabase.defaults()
    : super(
        const bool.fromEnvironment('IN_MEMORY_DB')
            ? inMemoryExecutor()
            : driftDatabase(
                name: 'nutrition',
                web: DriftWebOptions(
                  sqlite3Wasm: Uri.parse('sqlite3.wasm'),
                  driftWorker: Uri.parse('drift_worker.js'),
                ),
              ),
      );

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await _seed();
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(mediaBlobs);
        await m.createIndex(diaryEntriesDay);
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
      // Keep the nutrient catalog in sync with code on every launch.
      await _seedNutrients();
    },
  );

  Future<void> _seed() async {
    await batch((b) {
      for (final (i, key) in systemMealGroups.indexed) {
        b.insert(
          mealGroups,
          MealGroupsCompanion.insert(
            systemKey: Value(key),
            sortOrder: Value(i),
          ),
        );
      }
      b.insert(profiles, ProfilesCompanion.insert());
      b.insert(goals, GoalsCompanion.insert());
    });
  }

  Future<void> _seedNutrients() async {
    await batch((b) {
      for (final (i, (code, unit)) in optionalNutrients.indexed) {
        b.insert(
          nutrientDefinitions,
          NutrientDefinitionsCompanion.insert(
            code: code,
            unit: unit,
            sortOrder: i,
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }
}
