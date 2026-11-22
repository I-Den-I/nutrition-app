// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Nutrition';

  @override
  String get navDiary => 'Diary';

  @override
  String get navProducts => 'Products';

  @override
  String get navDishes => 'Dishes';

  @override
  String get navSettings => 'Settings';

  @override
  String get actionContinue => 'Continue';

  @override
  String get actionSave => 'Save';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get actionDelete => 'Delete';

  @override
  String get actionEdit => 'Edit';

  @override
  String get actionAdd => 'Add';

  @override
  String get actionSkip => 'Skip';

  @override
  String get actionDone => 'Done';

  @override
  String get actionFinish => 'Finish';

  @override
  String get search => 'Search';

  @override
  String get fieldRequired => 'Required';

  @override
  String get fieldInvalidNumber => 'Enter a number';

  @override
  String get unsavedChangesTitle => 'Discard changes?';

  @override
  String get actionDiscard => 'Discard';

  @override
  String get onboardingChooseLanguage => 'Choose your language';

  @override
  String get onboardingLanguageHint => 'You can change it later in settings.';

  @override
  String get profileTitle => 'About you';

  @override
  String get profileHint =>
      'Used to estimate your daily calories and macros. You can skip this and set goals manually.';

  @override
  String get sex => 'Sex';

  @override
  String get sexMale => 'Male';

  @override
  String get sexFemale => 'Female';

  @override
  String get birthDate => 'Date of birth';

  @override
  String get heightCm => 'Height, cm';

  @override
  String get weightKg => 'Weight, kg';

  @override
  String get activity => 'Activity';

  @override
  String get activitySedentary => 'Sedentary';

  @override
  String get activitySedentaryHint => 'Little or no exercise';

  @override
  String get activityLight => 'Light';

  @override
  String get activityLightHint => 'Exercise 1–3 times a week';

  @override
  String get activityModerate => 'Moderate';

  @override
  String get activityModerateHint => 'Exercise 3–5 times a week';

  @override
  String get activityHigh => 'High';

  @override
  String get activityHighHint => 'Exercise 6–7 times a week';

  @override
  String get activityVeryHigh => 'Very high';

  @override
  String get activityVeryHighHint => 'Physical job or training twice a day';

  @override
  String get weightGoal => 'Goal';

  @override
  String get goalLose => 'Lose';

  @override
  String get goalMaintain => 'Maintain';

  @override
  String get goalGain => 'Gain';

  @override
  String get goalsTitle => 'Daily goals';

  @override
  String get goalsAutoHint =>
      'Calculated from your profile. Change any value to set it manually.';

  @override
  String get goalsManualHint => 'Set manually.';

  @override
  String get goalsRecalculate => 'Recalculate from profile';

  @override
  String kcalFromMacros(String value) {
    return 'From macros: $value kcal';
  }

  @override
  String get emptyProducts => 'No products yet';

  @override
  String get emptyDishes => 'No dishes yet';

  @override
  String get emptyDiary => 'Nothing logged on this day';

  @override
  String get nothingFound => 'Nothing found';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get tomorrow => 'Tomorrow';

  @override
  String get dayTotal => 'Day total';

  @override
  String ofGoal(String goal) {
    return 'of $goal';
  }

  @override
  String kcalLeft(String value) {
    return '$value kcal left';
  }

  @override
  String kcalOver(String value) {
    return '$value kcal over';
  }

  @override
  String get noMealGroup => 'Other';

  @override
  String get addToDiary => 'Add to diary';

  @override
  String addedToDiary(String name) {
    return 'Added: $name';
  }

  @override
  String get editEntry => 'Edit entry';

  @override
  String get grams => 'Grams';

  @override
  String get mealGroup => 'Meal';

  @override
  String get nutrientKcal => 'kcal';

  @override
  String get nutrientProtein => 'Protein';

  @override
  String get nutrientFat => 'Fat';

  @override
  String get nutrientCarbs => 'Carbs';

  @override
  String get nutrientFiber => 'Fiber';

  @override
  String get nutrientSugar => 'Sugar';

  @override
  String get nutrientSatFat => 'Saturated fat';

  @override
  String get nutrientSalt => 'Salt';

  @override
  String get nutrientWater => 'Water';

  @override
  String get nutrientCalories => 'Calories';

  @override
  String get unitGram => 'g';

  @override
  String get unitCm => 'cm';

  @override
  String get unitKg => 'kg';

  @override
  String get unitMl => 'ml';

  @override
  String get mealBreakfast => 'Breakfast';

  @override
  String get mealLunch => 'Lunch';

  @override
  String get mealDinner => 'Dinner';

  @override
  String get mealSnack => 'Snack';

  @override
  String get productNew => 'New product';

  @override
  String get productEdit => 'Edit product';

  @override
  String get fieldName => 'Name';

  @override
  String get fieldDescription => 'Description';

  @override
  String get basis => 'Measured in';

  @override
  String get basisG => 'Grams';

  @override
  String get basisMl => 'Millilitres';

  @override
  String get per100g => 'Per 100 g';

  @override
  String get per100ml => 'Per 100 ml';

  @override
  String get kcalAutoHint => 'Leave empty to calculate from macros';

  @override
  String get photos => 'Photos';

  @override
  String get addPhoto => 'Add photo';

  @override
  String get photoGallery => 'Choose from gallery';

  @override
  String get photoCamera => 'Take a photo';

  @override
  String get deleteProductTitle => 'Delete this product?';

  @override
  String get deleteProductBody =>
      'It disappears from the list. Diary entries and dishes that use it are kept.';

  @override
  String get dishNew => 'New dish';

  @override
  String get dishEdit => 'Edit dish';

  @override
  String get ingredients => 'Ingredients';

  @override
  String get addIngredient => 'Add ingredient';

  @override
  String get ingredientsRequired => 'Add at least one ingredient';

  @override
  String get cookedWeight => 'Cooked weight, g';

  @override
  String get cookedWeightHint =>
      'Weigh the finished dish to account for water lost or absorbed while cooking. Empty = sum of ingredients.';

  @override
  String get wholeDish => 'Whole dish';

  @override
  String get dishSuitsFor => 'Suits';

  @override
  String get deleteDishTitle => 'Delete this dish?';

  @override
  String get deleteDishBody =>
      'It disappears from the list. Diary entries that use it are kept.';

  @override
  String get chooseProduct => 'Choose a product';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get settingsMode => 'Mode';

  @override
  String get modeLocal => 'Local — data stays on this device';

  @override
  String get modeCloud => 'Cloud';

  @override
  String get settingsNutrients => 'Extra nutrients';

  @override
  String get settingsNutrientsHint =>
      'Calories, protein, fat and carbs are always tracked. Pick what else to show.';

  @override
  String get settingsProfile => 'Profile';

  @override
  String get settingsGoals => 'Daily goals';

  @override
  String get settingsMealGroups => 'Meal groups';

  @override
  String get mealGroupAdd => 'Add group';

  @override
  String get mealGroupName => 'Group name';

  @override
  String get notSet => 'Not set';

  @override
  String get settingsFont => 'Font';

  @override
  String get fontSystem => 'System font';

  @override
  String get fontCustom => 'Your fonts';

  @override
  String get fontAdd => 'Add font';

  @override
  String get fontAddHint => 'TTF or OTF file, up to 5 MB';

  @override
  String fontAdded(String name) {
    return 'Font added: $name';
  }

  @override
  String get fontTooLarge => 'The file is too large (max 5 MB)';

  @override
  String get fontNotAFont => 'This file is not a valid font';

  @override
  String get fontUnsupported =>
      'Font collections and WOFF files are not supported, use TTF or OTF';

  @override
  String fontDeleteTitle(String name) {
    return 'Delete font $name?';
  }

  @override
  String get fontPreview => 'Today 1 240 kcal · Protein 96 g';
}
