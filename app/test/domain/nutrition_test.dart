import 'package:flutter_test/flutter_test.dart';
import 'package:nutrition_app/core/domain/dish_calculator.dart';
import 'package:nutrition_app/core/domain/nutrients.dart';

void main() {
  const chicken = Nutrients(kcal: 165, protein: 31, fat: 3.6, carbs: 0);
  const rice = Nutrients(
    kcal: 360,
    protein: 7,
    fat: 0.6,
    carbs: 79,
    extra: {'fiber': 1.3},
  );

  group('Nutrients', () {
    test('portion scales per-100 values by grams', () {
      final p = chicken.portion(200);
      expect(p.kcal, 330);
      expect(p.protein, 62);
      expect(p.fat, closeTo(7.2, 1e-9));
    });

    test('sum merges optional nutrients', () {
      final s = Nutrients.sum([chicken.portion(100), rice.portion(50)]);
      expect(s.kcal, 165 + 180);
      expect(s.extra['fiber'], closeTo(0.65, 1e-9));
    });
  });

  group('calculateDish', () {
    test('uses raw weight when cooked weight is unknown', () {
      final d = calculateDish(const [
        DishIngredient(per100: chicken, grams: 200),
        DishIngredient(per100: rice, grams: 100),
      ]);
      expect(d.contributions[0].kcal, 330);
      expect(d.contributions[1].kcal, 360);
      expect(d.total.kcal, 690);
      expect(d.weightG, 300);
      expect(d.per100.kcal, closeTo(230, 1e-9));
    });

    test('uses cooked weight for per-100 values', () {
      final d = calculateDish(const [
        DishIngredient(per100: rice, grams: 100),
      ], cookedWeightG: 300);
      expect(d.total.kcal, 360);
      expect(d.per100.kcal, closeTo(120, 1e-9));
      expect(d.per100.carbs, closeTo(79 / 3, 1e-9));
    });

    test('empty dish is zero, not NaN', () {
      final d = calculateDish(const []);
      expect(d.per100, Nutrients.zero);
    });
  });
}
