import 'package:flutter_test/flutter_test.dart';
import 'package:nutrition_app/core/db/enums.dart';
import 'package:nutrition_app/core/domain/formatting.dart';
import 'package:nutrition_app/core/domain/goals_calculator.dart';

void main() {
  const man = BodyData(
    sex: Sex.male,
    ageYears: 30,
    heightCm: 180,
    weightKg: 80,
    activity: ActivityLevel.moderate,
    goal: WeightGoal.maintain,
  );

  test('BMR follows Mifflin-St Jeor', () {
    // 10*80 + 6.25*180 - 5*30 + 5 = 1780
    expect(bmr(man), 1780);
    final woman = BodyData(
      sex: Sex.female,
      ageYears: man.ageYears,
      heightCm: man.heightCm,
      weightKg: man.weightKg,
      activity: man.activity,
      goal: man.goal,
    );
    expect(bmr(woman), 1780 - 166);
  });

  test('goals: calories, protein and fat by weight, carbs fill the rest', () {
    final g = calculateGoals(man);
    expect(g.kcal, (1780 * 1.55).roundToDouble()); // 2759
    expect(g.protein, 128);
    expect(g.fat, 72);
    expect(g.carbs, ((2759 - 128 * 4 - 72 * 9) / 4).roundToDouble());
  });

  test('losing weight lowers calories', () {
    final lose = calculateGoals(
      BodyData(
        sex: man.sex,
        ageYears: man.ageYears,
        heightCm: man.heightCm,
        weightKg: man.weightKg,
        activity: man.activity,
        goal: WeightGoal.lose,
      ),
    );
    expect(lose.kcal, lessThan(calculateGoals(man).kcal));
  });

  test('age counts full years', () {
    expect(ageOn(DateTime(1996, 11, 23), DateTime(2026, 11, 22)), 29);
    expect(ageOn(DateTime(1996, 11, 22), DateTime(2026, 11, 22)), 30);
  });

  test('parseDecimal accepts comma and dot', () {
    expect(parseDecimal('12,5'), 12.5);
    expect(parseDecimal(' 7.25 '), 7.25);
    expect(parseDecimal(''), isNull);
    expect(parseDecimal('abc'), isNull);
  });

  test('dayKey round-trips', () {
    final d = DateTime(2026, 3, 7);
    expect(dayKey(d), '2026-03-07');
    expect(parseDayKey('2026-03-07'), d);
  });
}
