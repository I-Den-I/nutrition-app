import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutrition_app/core/db/app_database.dart';
import 'package:nutrition_app/features/diary/data/diary_repository.dart';
import 'package:nutrition_app/features/diary/data/meal_groups_repository.dart';
import 'package:nutrition_app/features/dishes/data/dishes_repository.dart';
import 'package:nutrition_app/features/products/data/products_repository.dart';
import 'package:nutrition_app/features/profile/data/profile_repository.dart';

void main() {
  late AppDatabase db;
  late ProductsRepository products;
  late DishesRepository dishes;
  late DiaryRepository diary;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    products = ProductsRepository(db);
    dishes = DishesRepository(db, products);
    diary = DiaryRepository(db, products, dishes);
  });
  tearDown(() => db.close());

  Future<String> rice() => products.save(
    const ProductDraft(
      name: 'Rice',
      kcal: 360,
      protein: 7,
      fat: 0.6,
      carbs: 79,
      extra: {'fiber': 1.3},
    ),
  );

  group('products', () {
    test('save, update optional nutrients, search, soft delete', () async {
      final id = await rice();
      expect((await products.get(id))!.extra, {'fiber': 1.3});

      await products.save(
        ProductDraft(
          id: id,
          name: 'Рис білий',
          kcal: 350,
          protein: 7,
          fat: 0.6,
          carbs: 78,
          extra: const {'sugar': 0.1},
        ),
      );
      final updated = await products.get(id);
      expect(updated!.product.kcal, 350);
      expect(updated.extra, {'sugar': 0.1});

      // Cyrillic search is case-insensitive.
      expect(await products.watchAll(query: 'РИС').first, hasLength(1));

      await products.delete(id);
      expect(await products.watchAll().first, isEmpty);
      expect(await products.get(id), isNotNull); // still readable
    });
  });

  group('dishes', () {
    test('breakdown uses cooked weight; editing replaces items', () async {
      final riceId = await rice();
      final id = await dishes.save(
        DishDraft(
          name: 'Boiled rice',
          cookedWeightG: 300,
          items: [DishItemDraft(productId: riceId, grams: 100)],
        ),
      );
      var d = await dishes.get(id);
      expect(d!.breakdown.total.kcal, 360);
      expect(d.breakdown.per100.kcal, closeTo(120, 1e-9));

      await dishes.save(
        DishDraft(
          id: id,
          name: 'Boiled rice',
          items: [DishItemDraft(productId: riceId, grams: 200)],
        ),
      );
      d = await dishes.get(id);
      expect(d!.ingredients, hasLength(1));
      expect(d.breakdown.total.kcal, 720);
      expect(d.breakdown.weightG, 200); // no cooked weight → raw
    });
  });

  group('diary', () {
    test('snapshot survives product edits; update rescales it', () async {
      final riceId = await rice();
      await diary.add(day: '2026-11-22', productId: riceId, grams: 50);

      await products.save(
        ProductDraft(
          id: riceId,
          name: 'Rice',
          kcal: 1,
          protein: 0,
          fat: 0,
          carbs: 0,
        ),
      );

      var day = await diary.watchDay('2026-11-22').first;
      expect(day.single.name, 'Rice');
      expect(day.single.nutrients.kcal, 180);
      expect(day.single.nutrients.extra['fiber'], closeTo(0.65, 1e-9));

      await diary.update(day.single.entry, grams: 100, mealGroupId: null);
      day = await diary.watchDay('2026-11-22').first;
      expect(day.single.nutrients.kcal, 360);

      await diary.delete(day.single.entry.id);
      expect(await diary.watchDay('2026-11-22').first, isEmpty);
    });

    test('logs a dish by its per-100 g values', () async {
      final riceId = await rice();
      final dishId = await dishes.save(
        DishDraft(
          name: 'Boiled rice',
          cookedWeightG: 300,
          items: [DishItemDraft(productId: riceId, grams: 100)],
        ),
      );
      await diary.add(day: '2026-11-22', dishId: dishId, grams: 150);
      final day = await diary.watchDay('2026-11-22').first;
      expect(day.single.isDish, isTrue);
      expect(day.single.nutrients.kcal, closeTo(180, 1e-9));
    });
  });

  group('profile', () {
    test('auto goals are calculated from body data', () async {
      final profile = ProfileRepository(db);
      expect((await profile.load()).hasGoals, isFalse);

      await profile.saveBody(
        sex: Sex.male,
        birthDate: DateTime(1990, 1, 1),
        heightCm: 180,
        weightKg: 80,
        activity: ActivityLevel.moderate,
        goal: WeightGoal.maintain,
      );
      await profile.refreshAutoGoals();
      final data = await profile.load();
      expect(data.weightKg, 80);
      expect(data.hasGoals, isTrue);
      expect(data.goals.protein, 128);
    });
  });

  group('meal groups', () {
    test(
      'custom groups can be added and deleted, built-in ones cannot',
      () async {
        final groups = MealGroupsRepository(db);
        await groups.addCustom('Pre-workout');
        var all = await groups.watchAll().first;
        expect(all.last.customName, 'Pre-workout');

        await groups.delete(all.first.id); // breakfast: ignored
        await groups.delete(all.last.id);
        all = await groups.watchAll().first;
        expect(all.map((g) => g.systemKey), systemMealGroups);
      },
    );
  });
}
