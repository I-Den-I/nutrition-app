import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('ru'),
    Locale('uk'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get appTitle;

  /// No description provided for @navDiary.
  ///
  /// In en, this message translates to:
  /// **'Diary'**
  String get navDiary;

  /// No description provided for @navProducts.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get navProducts;

  /// No description provided for @navDishes.
  ///
  /// In en, this message translates to:
  /// **'Dishes'**
  String get navDishes;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @actionContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get actionContinue;

  /// No description provided for @actionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionSave;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @actionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get actionDelete;

  /// No description provided for @actionEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get actionEdit;

  /// No description provided for @actionAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get actionAdd;

  /// No description provided for @actionSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get actionSkip;

  /// No description provided for @actionDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get actionDone;

  /// No description provided for @actionFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get actionFinish;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get fieldRequired;

  /// No description provided for @fieldInvalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a number'**
  String get fieldInvalidNumber;

  /// No description provided for @unsavedChangesTitle.
  ///
  /// In en, this message translates to:
  /// **'Discard changes?'**
  String get unsavedChangesTitle;

  /// No description provided for @actionDiscard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get actionDiscard;

  /// No description provided for @onboardingChooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get onboardingChooseLanguage;

  /// No description provided for @onboardingLanguageHint.
  ///
  /// In en, this message translates to:
  /// **'You can change it later in settings.'**
  String get onboardingLanguageHint;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'About you'**
  String get profileTitle;

  /// No description provided for @profileHint.
  ///
  /// In en, this message translates to:
  /// **'Used to estimate your daily calories and macros. You can skip this and set goals manually.'**
  String get profileHint;

  /// No description provided for @sex.
  ///
  /// In en, this message translates to:
  /// **'Sex'**
  String get sex;

  /// No description provided for @sexMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get sexMale;

  /// No description provided for @sexFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get sexFemale;

  /// No description provided for @birthDate.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get birthDate;

  /// No description provided for @heightCm.
  ///
  /// In en, this message translates to:
  /// **'Height, cm'**
  String get heightCm;

  /// No description provided for @weightKg.
  ///
  /// In en, this message translates to:
  /// **'Weight, kg'**
  String get weightKg;

  /// No description provided for @activity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activity;

  /// No description provided for @activitySedentary.
  ///
  /// In en, this message translates to:
  /// **'Sedentary'**
  String get activitySedentary;

  /// No description provided for @activitySedentaryHint.
  ///
  /// In en, this message translates to:
  /// **'Little or no exercise'**
  String get activitySedentaryHint;

  /// No description provided for @activityLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get activityLight;

  /// No description provided for @activityLightHint.
  ///
  /// In en, this message translates to:
  /// **'Exercise 1–3 times a week'**
  String get activityLightHint;

  /// No description provided for @activityModerate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get activityModerate;

  /// No description provided for @activityModerateHint.
  ///
  /// In en, this message translates to:
  /// **'Exercise 3–5 times a week'**
  String get activityModerateHint;

  /// No description provided for @activityHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get activityHigh;

  /// No description provided for @activityHighHint.
  ///
  /// In en, this message translates to:
  /// **'Exercise 6–7 times a week'**
  String get activityHighHint;

  /// No description provided for @activityVeryHigh.
  ///
  /// In en, this message translates to:
  /// **'Very high'**
  String get activityVeryHigh;

  /// No description provided for @activityVeryHighHint.
  ///
  /// In en, this message translates to:
  /// **'Physical job or training twice a day'**
  String get activityVeryHighHint;

  /// No description provided for @weightGoal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get weightGoal;

  /// No description provided for @goalLose.
  ///
  /// In en, this message translates to:
  /// **'Lose'**
  String get goalLose;

  /// No description provided for @goalMaintain.
  ///
  /// In en, this message translates to:
  /// **'Maintain'**
  String get goalMaintain;

  /// No description provided for @goalGain.
  ///
  /// In en, this message translates to:
  /// **'Gain'**
  String get goalGain;

  /// No description provided for @goalsTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily goals'**
  String get goalsTitle;

  /// No description provided for @goalsAutoHint.
  ///
  /// In en, this message translates to:
  /// **'Calculated from your profile. Change any value to set it manually.'**
  String get goalsAutoHint;

  /// No description provided for @goalsManualHint.
  ///
  /// In en, this message translates to:
  /// **'Set manually.'**
  String get goalsManualHint;

  /// No description provided for @goalsRecalculate.
  ///
  /// In en, this message translates to:
  /// **'Recalculate from profile'**
  String get goalsRecalculate;

  /// No description provided for @kcalFromMacros.
  ///
  /// In en, this message translates to:
  /// **'From macros: {value} kcal'**
  String kcalFromMacros(String value);

  /// No description provided for @emptyProducts.
  ///
  /// In en, this message translates to:
  /// **'No products yet'**
  String get emptyProducts;

  /// No description provided for @emptyDishes.
  ///
  /// In en, this message translates to:
  /// **'No dishes yet'**
  String get emptyDishes;

  /// No description provided for @emptyDiary.
  ///
  /// In en, this message translates to:
  /// **'Nothing logged on this day'**
  String get emptyDiary;

  /// No description provided for @nothingFound.
  ///
  /// In en, this message translates to:
  /// **'Nothing found'**
  String get nothingFound;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @tomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get tomorrow;

  /// No description provided for @dayTotal.
  ///
  /// In en, this message translates to:
  /// **'Day total'**
  String get dayTotal;

  /// No description provided for @ofGoal.
  ///
  /// In en, this message translates to:
  /// **'of {goal}'**
  String ofGoal(String goal);

  /// No description provided for @kcalLeft.
  ///
  /// In en, this message translates to:
  /// **'{value} kcal left'**
  String kcalLeft(String value);

  /// No description provided for @kcalOver.
  ///
  /// In en, this message translates to:
  /// **'{value} kcal over'**
  String kcalOver(String value);

  /// No description provided for @noMealGroup.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get noMealGroup;

  /// No description provided for @addToDiary.
  ///
  /// In en, this message translates to:
  /// **'Add to diary'**
  String get addToDiary;

  /// No description provided for @addedToDiary.
  ///
  /// In en, this message translates to:
  /// **'Added: {name}'**
  String addedToDiary(String name);

  /// No description provided for @editEntry.
  ///
  /// In en, this message translates to:
  /// **'Edit entry'**
  String get editEntry;

  /// No description provided for @grams.
  ///
  /// In en, this message translates to:
  /// **'Grams'**
  String get grams;

  /// No description provided for @mealGroup.
  ///
  /// In en, this message translates to:
  /// **'Meal'**
  String get mealGroup;

  /// No description provided for @nutrientKcal.
  ///
  /// In en, this message translates to:
  /// **'kcal'**
  String get nutrientKcal;

  /// No description provided for @nutrientProtein.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get nutrientProtein;

  /// No description provided for @nutrientFat.
  ///
  /// In en, this message translates to:
  /// **'Fat'**
  String get nutrientFat;

  /// No description provided for @nutrientCarbs.
  ///
  /// In en, this message translates to:
  /// **'Carbs'**
  String get nutrientCarbs;

  /// No description provided for @nutrientFiber.
  ///
  /// In en, this message translates to:
  /// **'Fiber'**
  String get nutrientFiber;

  /// No description provided for @nutrientSugar.
  ///
  /// In en, this message translates to:
  /// **'Sugar'**
  String get nutrientSugar;

  /// No description provided for @nutrientSatFat.
  ///
  /// In en, this message translates to:
  /// **'Saturated fat'**
  String get nutrientSatFat;

  /// No description provided for @nutrientSalt.
  ///
  /// In en, this message translates to:
  /// **'Salt'**
  String get nutrientSalt;

  /// No description provided for @nutrientWater.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get nutrientWater;

  /// No description provided for @nutrientCalories.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get nutrientCalories;

  /// No description provided for @unitGram.
  ///
  /// In en, this message translates to:
  /// **'g'**
  String get unitGram;

  /// No description provided for @unitCm.
  ///
  /// In en, this message translates to:
  /// **'cm'**
  String get unitCm;

  /// No description provided for @unitKg.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get unitKg;

  /// No description provided for @unitMl.
  ///
  /// In en, this message translates to:
  /// **'ml'**
  String get unitMl;

  /// No description provided for @mealBreakfast.
  ///
  /// In en, this message translates to:
  /// **'Breakfast'**
  String get mealBreakfast;

  /// No description provided for @mealLunch.
  ///
  /// In en, this message translates to:
  /// **'Lunch'**
  String get mealLunch;

  /// No description provided for @mealDinner.
  ///
  /// In en, this message translates to:
  /// **'Dinner'**
  String get mealDinner;

  /// No description provided for @mealSnack.
  ///
  /// In en, this message translates to:
  /// **'Snack'**
  String get mealSnack;

  /// No description provided for @productNew.
  ///
  /// In en, this message translates to:
  /// **'New product'**
  String get productNew;

  /// No description provided for @productEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit product'**
  String get productEdit;

  /// No description provided for @fieldName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get fieldName;

  /// No description provided for @fieldDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get fieldDescription;

  /// No description provided for @basis.
  ///
  /// In en, this message translates to:
  /// **'Measured in'**
  String get basis;

  /// No description provided for @basisG.
  ///
  /// In en, this message translates to:
  /// **'Grams'**
  String get basisG;

  /// No description provided for @basisMl.
  ///
  /// In en, this message translates to:
  /// **'Millilitres'**
  String get basisMl;

  /// No description provided for @per100g.
  ///
  /// In en, this message translates to:
  /// **'Per 100 g'**
  String get per100g;

  /// No description provided for @per100ml.
  ///
  /// In en, this message translates to:
  /// **'Per 100 ml'**
  String get per100ml;

  /// No description provided for @kcalAutoHint.
  ///
  /// In en, this message translates to:
  /// **'Leave empty to calculate from macros'**
  String get kcalAutoHint;

  /// No description provided for @photos.
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get photos;

  /// No description provided for @addPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add photo'**
  String get addPhoto;

  /// No description provided for @photoGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from gallery'**
  String get photoGallery;

  /// No description provided for @photoCamera.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get photoCamera;

  /// No description provided for @deleteProductTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this product?'**
  String get deleteProductTitle;

  /// No description provided for @deleteProductBody.
  ///
  /// In en, this message translates to:
  /// **'It disappears from the list. Diary entries and dishes that use it are kept.'**
  String get deleteProductBody;

  /// No description provided for @dishNew.
  ///
  /// In en, this message translates to:
  /// **'New dish'**
  String get dishNew;

  /// No description provided for @dishEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit dish'**
  String get dishEdit;

  /// No description provided for @ingredients.
  ///
  /// In en, this message translates to:
  /// **'Ingredients'**
  String get ingredients;

  /// No description provided for @addIngredient.
  ///
  /// In en, this message translates to:
  /// **'Add ingredient'**
  String get addIngredient;

  /// No description provided for @ingredientsRequired.
  ///
  /// In en, this message translates to:
  /// **'Add at least one ingredient'**
  String get ingredientsRequired;

  /// No description provided for @cookedWeight.
  ///
  /// In en, this message translates to:
  /// **'Cooked weight, g'**
  String get cookedWeight;

  /// No description provided for @cookedWeightHint.
  ///
  /// In en, this message translates to:
  /// **'Weigh the finished dish to account for water lost or absorbed while cooking. Empty = sum of ingredients.'**
  String get cookedWeightHint;

  /// No description provided for @wholeDish.
  ///
  /// In en, this message translates to:
  /// **'Whole dish'**
  String get wholeDish;

  /// No description provided for @dishSuitsFor.
  ///
  /// In en, this message translates to:
  /// **'Suits'**
  String get dishSuitsFor;

  /// No description provided for @deleteDishTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this dish?'**
  String get deleteDishTitle;

  /// No description provided for @deleteDishBody.
  ///
  /// In en, this message translates to:
  /// **'It disappears from the list. Diary entries that use it are kept.'**
  String get deleteDishBody;

  /// No description provided for @chooseProduct.
  ///
  /// In en, this message translates to:
  /// **'Choose a product'**
  String get chooseProduct;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @settingsMode.
  ///
  /// In en, this message translates to:
  /// **'Mode'**
  String get settingsMode;

  /// No description provided for @modeLocal.
  ///
  /// In en, this message translates to:
  /// **'Local — data stays on this device'**
  String get modeLocal;

  /// No description provided for @modeCloud.
  ///
  /// In en, this message translates to:
  /// **'Cloud'**
  String get modeCloud;

  /// No description provided for @settingsNutrients.
  ///
  /// In en, this message translates to:
  /// **'Extra nutrients'**
  String get settingsNutrients;

  /// No description provided for @settingsNutrientsHint.
  ///
  /// In en, this message translates to:
  /// **'Calories, protein, fat and carbs are always tracked. Pick what else to show.'**
  String get settingsNutrientsHint;

  /// No description provided for @settingsProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get settingsProfile;

  /// No description provided for @settingsGoals.
  ///
  /// In en, this message translates to:
  /// **'Daily goals'**
  String get settingsGoals;

  /// No description provided for @settingsMealGroups.
  ///
  /// In en, this message translates to:
  /// **'Meal groups'**
  String get settingsMealGroups;

  /// No description provided for @mealGroupAdd.
  ///
  /// In en, this message translates to:
  /// **'Add group'**
  String get mealGroupAdd;

  /// No description provided for @mealGroupName.
  ///
  /// In en, this message translates to:
  /// **'Group name'**
  String get mealGroupName;

  /// No description provided for @notSet.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get notSet;

  /// No description provided for @settingsFont.
  ///
  /// In en, this message translates to:
  /// **'Font'**
  String get settingsFont;

  /// No description provided for @fontSystem.
  ///
  /// In en, this message translates to:
  /// **'System font'**
  String get fontSystem;

  /// No description provided for @fontCustom.
  ///
  /// In en, this message translates to:
  /// **'Your fonts'**
  String get fontCustom;

  /// No description provided for @fontAdd.
  ///
  /// In en, this message translates to:
  /// **'Add font'**
  String get fontAdd;

  /// No description provided for @fontAddHint.
  ///
  /// In en, this message translates to:
  /// **'TTF or OTF file, up to 5 MB'**
  String get fontAddHint;

  /// No description provided for @fontAdded.
  ///
  /// In en, this message translates to:
  /// **'Font added: {name}'**
  String fontAdded(String name);

  /// No description provided for @fontTooLarge.
  ///
  /// In en, this message translates to:
  /// **'The file is too large (max 5 MB)'**
  String get fontTooLarge;

  /// No description provided for @fontNotAFont.
  ///
  /// In en, this message translates to:
  /// **'This file is not a valid font'**
  String get fontNotAFont;

  /// No description provided for @fontUnsupported.
  ///
  /// In en, this message translates to:
  /// **'Font collections and WOFF files are not supported, use TTF or OTF'**
  String get fontUnsupported;

  /// No description provided for @fontDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete font {name}?'**
  String fontDeleteTitle(String name);

  /// No description provided for @fontPreview.
  ///
  /// In en, this message translates to:
  /// **'Today 1 240 kcal · Protein 96 g'**
  String get fontPreview;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en', 'ru', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
