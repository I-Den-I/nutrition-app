import 'package:meta/meta.dart';

import '../db/enums.dart';

/// Body data needed to estimate daily needs.
@immutable
class BodyData {
  const BodyData({
    required this.sex,
    required this.ageYears,
    required this.heightCm,
    required this.weightKg,
    required this.activity,
    required this.goal,
  });

  final Sex sex;
  final int ageYears;
  final double heightCm;
  final double weightKg;
  final ActivityLevel activity;
  final WeightGoal goal;
}

@immutable
class MacroGoals {
  const MacroGoals({
    required this.kcal,
    required this.protein,
    required this.fat,
    required this.carbs,
  });

  final double kcal;
  final double protein;
  final double fat;
  final double carbs;
}

/// Basal metabolic rate, Mifflin-St Jeor equation (kcal/day).
double bmr(BodyData b) {
  final base = 10 * b.weightKg + 6.25 * b.heightCm - 5 * b.ageYears;
  return b.sex == Sex.male ? base + 5 : base - 161;
}

const activityFactors = {
  ActivityLevel.sedentary: 1.2,
  ActivityLevel.light: 1.375,
  ActivityLevel.moderate: 1.55,
  ActivityLevel.high: 1.725,
  ActivityLevel.veryHigh: 1.9,
};

/// Calorie adjustment relative to maintenance.
const goalFactors = {
  WeightGoal.lose: 0.85,
  WeightGoal.maintain: 1.0,
  WeightGoal.gain: 1.10,
};

/// Protein in g per kg of body weight.
const proteinPerKg = {
  WeightGoal.lose: 2.0,
  WeightGoal.maintain: 1.6,
  WeightGoal.gain: 1.8,
};

const fatPerKg = 0.9;

/// Daily goals: BMR × activity × goal factor; protein and fat by body
/// weight, carbs fill the remaining calories. Rounded to whole numbers.
MacroGoals calculateGoals(BodyData b) {
  final kcal = bmr(b) * activityFactors[b.activity]! * goalFactors[b.goal]!;
  final protein = proteinPerKg[b.goal]! * b.weightKg;
  final fat = fatPerKg * b.weightKg;
  final carbs = (kcal - protein * 4 - fat * 9) / 4;
  return MacroGoals(
    kcal: kcal.roundToDouble(),
    protein: protein.roundToDouble(),
    fat: fat.roundToDouble(),
    carbs: carbs < 0 ? 0 : carbs.roundToDouble(),
  );
}

/// Calories implied by macros (Atwater factors 4/9/4).
double kcalFromMacros({
  required double protein,
  required double fat,
  required double carbs,
}) => protein * 4 + fat * 9 + carbs * 4;

/// Full years between [birthDate] and [today].
int ageOn(DateTime birthDate, DateTime today) {
  var age = today.year - birthDate.year;
  final hadBirthday =
      today.month > birthDate.month ||
      (today.month == birthDate.month && today.day >= birthDate.day);
  if (!hadBirthday) age--;
  return age;
}
