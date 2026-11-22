import '../db/app_database.dart';
import '../l10n/l10n.dart';

/// Translated names for database codes and enums.
extension Labels on AppLocalizations {
  String nutrientName(String code) => switch (code) {
    'fiber' => nutrientFiber,
    'sugar' => nutrientSugar,
    'sat_fat' => nutrientSatFat,
    'salt' => nutrientSalt,
    'water' => nutrientWater,
    _ => code,
  };

  String nutrientUnit(String code) => code == 'water' ? unitMl : unitGram;

  String groupLabel(MealGroup g) => switch (g.systemKey) {
    'breakfast' => mealBreakfast,
    'lunch' => mealLunch,
    'dinner' => mealDinner,
    'snack' => mealSnack,
    _ => g.customName ?? '',
  };

  String sexName(Sex s) => switch (s) {
    Sex.male => sexMale,
    Sex.female => sexFemale,
  };

  String activityName(ActivityLevel a) => switch (a) {
    ActivityLevel.sedentary => activitySedentary,
    ActivityLevel.light => activityLight,
    ActivityLevel.moderate => activityModerate,
    ActivityLevel.high => activityHigh,
    ActivityLevel.veryHigh => activityVeryHigh,
  };

  String activityHint(ActivityLevel a) => switch (a) {
    ActivityLevel.sedentary => activitySedentaryHint,
    ActivityLevel.light => activityLightHint,
    ActivityLevel.moderate => activityModerateHint,
    ActivityLevel.high => activityHighHint,
    ActivityLevel.veryHigh => activityVeryHighHint,
  };

  String goalName(WeightGoal g) => switch (g) {
    WeightGoal.lose => goalLose,
    WeightGoal.maintain => goalMaintain,
    WeightGoal.gain => goalGain,
  };

  String basisUnit(Basis b) => b == Basis.ml ? unitMl : unitGram;

  String per100(Basis b) => b == Basis.ml ? per100ml : per100g;
}
