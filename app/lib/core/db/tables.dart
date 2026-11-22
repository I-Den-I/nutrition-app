import 'package:drift/drift.dart';

import 'enums.dart';
import 'ids.dart';

/// Columns every syncable table has. See docs/ARCHITECTURE.md §6.
///
/// - `id` is a UUID v7 generated on the client, so rows created offline on
///   different devices never collide.
/// - `deletedAt` is a soft delete: sync needs to know a row was removed.
mixin SyncColumns on Table {
  TextColumn get id => text().clientDefault(newId)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

// ───────────────────────── Products ─────────────────────────

class Products extends Table with SyncColumns {
  TextColumn get ownerId => text().nullable()();
  TextColumn get visibility => textEnum<ContentVisibility>().withDefault(
    Constant(ContentVisibility.private.name),
  )();
  TextColumn get status => textEnum<ModerationStatus>().withDefault(
    Constant(ModerationStatus.active.name),
  )();

  TextColumn get name => text().withLength(min: 1, max: 200)();
  TextColumn get description => text().nullable()();
  TextColumn get brand => text().nullable()();
  TextColumn get barcode => text().nullable()();
  TextColumn get basis =>
      textEnum<Basis>().withDefault(Constant(Basis.g.name))();

  // Core nutrients per 100 g/ml — always present.
  RealColumn get kcal => real()();
  RealColumn get protein => real()();
  RealColumn get fat => real()();
  RealColumn get carbs => real()();
}

/// Catalog of optional nutrients (fiber, sugar, …). Seeded from code.
class NutrientDefinitions extends Table {
  TextColumn get code => text()();
  TextColumn get unit => text()(); // g | mg | µg | ml
  IntColumn get sortOrder => integer()();

  @override
  Set<Column<Object>> get primaryKey => {code};
}

/// Optional nutrients of a product, per 100 g/ml.
class ProductNutrients extends Table with SyncColumns {
  TextColumn get productId => text().references(Products, #id)();
  TextColumn get nutrientCode =>
      text().references(NutrientDefinitions, #code)();
  RealColumn get amountPer100 => real()();

  @override
  List<Set<Column<Object>>> get uniqueKeys => [
    {productId, nutrientCode},
  ];
}

/// Named servings: "1 pc = 60 g", "1 tbsp = 15 g".
class ProductServings extends Table with SyncColumns {
  TextColumn get productId => text().references(Products, #id)();
  TextColumn get label => text()();
  RealColumn get grams => real()();
}

// ───────────────────────── Dishes ─────────────────────────

@DataClassName('Dish')
class Dishes extends Table with SyncColumns {
  TextColumn get ownerId => text().nullable()();
  TextColumn get visibility => textEnum<ContentVisibility>().withDefault(
    Constant(ContentVisibility.private.name),
  )();
  TextColumn get name => text().withLength(min: 1, max: 200)();
  TextColumn get description => text().nullable()(); // markdown

  /// Weight of the finished dish. Null → sum of raw ingredient weights.
  RealColumn get cookedWeightG => real().nullable()();
}

class DishItems extends Table with SyncColumns {
  TextColumn get dishId => text().references(Dishes, #id)();
  TextColumn get productId => text().references(Products, #id)();
  RealColumn get grams => real()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
}

/// Which meal groups a dish fits (future: suggestions per group).
class DishMealGroups extends Table with SyncColumns {
  TextColumn get dishId => text().references(Dishes, #id)();
  TextColumn get mealGroupId => text().references(MealGroups, #id)();

  @override
  List<Set<Column<Object>>> get uniqueKeys => [
    {dishId, mealGroupId},
  ];
}

// ───────────────────────── Media ─────────────────────────

class Media extends Table with SyncColumns {
  TextColumn get ownerType => textEnum<MediaOwner>()();
  TextColumn get ownerId => text()();
  TextColumn get kind => textEnum<MediaKind>()();
  TextColumn get localPath => text().nullable()();
  TextColumn get remoteUrl => text().nullable()();
  TextColumn get thumbPath => text().nullable()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  IntColumn get width => integer().nullable()();
  IntColumn get height => integer().nullable()();
  RealColumn get durationS => real().nullable()();
}

/// Photo bytes on platforms without a writable file system (web).
/// Native platforms keep files on disk; see `MediaStorage`.
/// Device-local cache, never synced.
class MediaBlobs extends Table {
  TextColumn get key => text()();
  BlobColumn get bytes => blob()();

  @override
  Set<Column<Object>> get primaryKey => {key};
}

/// Fonts the user added on this device. Device-local, never synced:
/// the font file itself lives in `MediaStorage` under [storageKey].
class CustomFonts extends Table {
  TextColumn get id => text().clientDefault(newId)();
  TextColumn get name => text().withLength(min: 1, max: 80)();
  TextColumn get storageKey => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

// ───────────────────────── Diary ─────────────────────────

/// Built-in groups have a [systemKey] (translated in the UI);
/// user-made groups have a [customName].
class MealGroups extends Table with SyncColumns {
  TextColumn get systemKey => text().nullable()();
  TextColumn get customName => text().nullable()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  BoolColumn get isHidden => boolean().withDefault(const Constant(false))();
}

@TableIndex(name: 'diary_entries_day', columns: {#day})
class DiaryEntries extends Table with SyncColumns {
  /// Local calendar day as `yyyy-MM-dd` — independent of time zones.
  TextColumn get day => text().withLength(min: 10, max: 10)();
  TextColumn get mealGroupId => text().nullable().references(MealGroups, #id)();
  TextColumn get productId => text().nullable().references(Products, #id)();
  TextColumn get dishId => text().nullable().references(Dishes, #id)();
  RealColumn get grams => real()();

  // Snapshot of the eaten portion at logging time, so later edits of the
  // product/dish don't rewrite history.
  RealColumn get snapshotKcal => real()();
  RealColumn get snapshotProtein => real()();
  RealColumn get snapshotFat => real()();
  RealColumn get snapshotCarbs => real()();
  TextColumn get snapshotExtra => text().nullable()(); // JSON {code: amount}

  @override
  List<String> get customConstraints => [
    'CHECK ((product_id IS NULL) <> (dish_id IS NULL))',
  ];
}

// ───────────────────────── Profile & goals ─────────────────────────

/// Single-row table with the user's body data.
/// UI preferences (language, theme) live in device settings instead.
class Profiles extends Table with SyncColumns {
  TextColumn get sex => textEnum<Sex>().nullable()();
  DateTimeColumn get birthDate => dateTime().nullable()();
  RealColumn get heightCm => real().nullable()();
  TextColumn get activityLevel => textEnum<ActivityLevel>().nullable()();
  TextColumn get weightGoal => textEnum<WeightGoal>().nullable()();

  /// JSON list of optional nutrient codes shown in the UI, e.g. ["fiber"].
  TextColumn get trackedNutrients =>
      text().withDefault(const Constant('["fiber"]'))();
}

@DataClassName('WeightEntry')
class WeightLog extends Table with SyncColumns {
  TextColumn get day => text().withLength(min: 10, max: 10)();
  RealColumn get weightKg => real()();
}

class Goals extends Table with SyncColumns {
  TextColumn get mode =>
      textEnum<GoalMode>().withDefault(Constant(GoalMode.auto.name))();
  RealColumn get kcal => real().nullable()();
  RealColumn get protein => real().nullable()();
  RealColumn get fat => real().nullable()();
  RealColumn get carbs => real().nullable()();
  TextColumn get extra => text().nullable()(); // JSON {code: amount}
}
