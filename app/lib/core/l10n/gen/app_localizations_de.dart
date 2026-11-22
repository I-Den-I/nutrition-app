// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Ernährung';

  @override
  String get navDiary => 'Tagebuch';

  @override
  String get navProducts => 'Produkte';

  @override
  String get navDishes => 'Gerichte';

  @override
  String get navSettings => 'Einstellungen';

  @override
  String get actionContinue => 'Weiter';

  @override
  String get actionSave => 'Speichern';

  @override
  String get actionCancel => 'Abbrechen';

  @override
  String get actionDelete => 'Löschen';

  @override
  String get actionEdit => 'Bearbeiten';

  @override
  String get actionAdd => 'Hinzufügen';

  @override
  String get actionSkip => 'Überspringen';

  @override
  String get actionDone => 'Fertig';

  @override
  String get actionFinish => 'Abschließen';

  @override
  String get search => 'Suchen';

  @override
  String get fieldRequired => 'Pflichtfeld';

  @override
  String get fieldInvalidNumber => 'Zahl eingeben';

  @override
  String get unsavedChangesTitle => 'Änderungen verwerfen?';

  @override
  String get actionDiscard => 'Verwerfen';

  @override
  String get onboardingChooseLanguage => 'Sprache wählen';

  @override
  String get onboardingLanguageHint =>
      'Du kannst sie später in den Einstellungen ändern.';

  @override
  String get profileTitle => 'Über dich';

  @override
  String get profileHint =>
      'Damit wird dein täglicher Kalorien- und Makrobedarf geschätzt. Du kannst das überspringen und Ziele manuell setzen.';

  @override
  String get sex => 'Geschlecht';

  @override
  String get sexMale => 'Männlich';

  @override
  String get sexFemale => 'Weiblich';

  @override
  String get birthDate => 'Geburtsdatum';

  @override
  String get heightCm => 'Größe, cm';

  @override
  String get weightKg => 'Gewicht, kg';

  @override
  String get activity => 'Aktivität';

  @override
  String get activitySedentary => 'Sitzend';

  @override
  String get activitySedentaryHint => 'Kaum oder kein Sport';

  @override
  String get activityLight => 'Leicht';

  @override
  String get activityLightHint => 'Sport 1–3 Mal pro Woche';

  @override
  String get activityModerate => 'Mittel';

  @override
  String get activityModerateHint => 'Sport 3–5 Mal pro Woche';

  @override
  String get activityHigh => 'Hoch';

  @override
  String get activityHighHint => 'Sport 6–7 Mal pro Woche';

  @override
  String get activityVeryHigh => 'Sehr hoch';

  @override
  String get activityVeryHighHint =>
      'Körperliche Arbeit oder zweimal täglich Training';

  @override
  String get weightGoal => 'Ziel';

  @override
  String get goalLose => 'Abnehmen';

  @override
  String get goalMaintain => 'Halten';

  @override
  String get goalGain => 'Zunehmen';

  @override
  String get goalsTitle => 'Tagesziele';

  @override
  String get goalsAutoHint =>
      'Aus deinem Profil berechnet. Ändere einen Wert, um ihn manuell festzulegen.';

  @override
  String get goalsManualHint => 'Manuell festgelegt.';

  @override
  String get goalsRecalculate => 'Aus Profil neu berechnen';

  @override
  String kcalFromMacros(String value) {
    return 'Aus Makros: $value kcal';
  }

  @override
  String get emptyProducts => 'Noch keine Produkte';

  @override
  String get emptyDishes => 'Noch keine Gerichte';

  @override
  String get emptyDiary => 'An diesem Tag nichts eingetragen';

  @override
  String get nothingFound => 'Nichts gefunden';

  @override
  String get today => 'Heute';

  @override
  String get yesterday => 'Gestern';

  @override
  String get tomorrow => 'Morgen';

  @override
  String get dayTotal => 'Tagessumme';

  @override
  String ofGoal(String goal) {
    return 'von $goal';
  }

  @override
  String kcalLeft(String value) {
    return 'Noch $value kcal';
  }

  @override
  String kcalOver(String value) {
    return '$value kcal zu viel';
  }

  @override
  String get noMealGroup => 'Sonstiges';

  @override
  String get addToDiary => 'Zum Tagebuch hinzufügen';

  @override
  String addedToDiary(String name) {
    return 'Hinzugefügt: $name';
  }

  @override
  String get editEntry => 'Eintrag bearbeiten';

  @override
  String get grams => 'Gramm';

  @override
  String get mealGroup => 'Mahlzeit';

  @override
  String get nutrientKcal => 'kcal';

  @override
  String get nutrientProtein => 'Eiweiß';

  @override
  String get nutrientFat => 'Fett';

  @override
  String get nutrientCarbs => 'Kohlenhydrate';

  @override
  String get nutrientFiber => 'Ballaststoffe';

  @override
  String get nutrientSugar => 'Zucker';

  @override
  String get nutrientSatFat => 'Gesättigte Fettsäuren';

  @override
  String get nutrientSalt => 'Salz';

  @override
  String get nutrientWater => 'Wasser';

  @override
  String get nutrientCalories => 'Kalorien';

  @override
  String get unitGram => 'g';

  @override
  String get unitCm => 'cm';

  @override
  String get unitKg => 'kg';

  @override
  String get unitMl => 'ml';

  @override
  String get mealBreakfast => 'Frühstück';

  @override
  String get mealLunch => 'Mittagessen';

  @override
  String get mealDinner => 'Abendessen';

  @override
  String get mealSnack => 'Snack';

  @override
  String get productNew => 'Neues Produkt';

  @override
  String get productEdit => 'Produkt bearbeiten';

  @override
  String get fieldName => 'Name';

  @override
  String get fieldDescription => 'Beschreibung';

  @override
  String get basis => 'Einheit';

  @override
  String get basisG => 'Gramm';

  @override
  String get basisMl => 'Milliliter';

  @override
  String get per100g => 'Pro 100 g';

  @override
  String get per100ml => 'Pro 100 ml';

  @override
  String get kcalAutoHint => 'Leer lassen, um aus Makros zu berechnen';

  @override
  String get photos => 'Fotos';

  @override
  String get addPhoto => 'Foto hinzufügen';

  @override
  String get photoGallery => 'Aus Galerie wählen';

  @override
  String get photoCamera => 'Foto aufnehmen';

  @override
  String get deleteProductTitle => 'Produkt löschen?';

  @override
  String get deleteProductBody =>
      'Es verschwindet aus der Liste. Tagebucheinträge und Gerichte damit bleiben erhalten.';

  @override
  String get dishNew => 'Neues Gericht';

  @override
  String get dishEdit => 'Gericht bearbeiten';

  @override
  String get ingredients => 'Zutaten';

  @override
  String get addIngredient => 'Zutat hinzufügen';

  @override
  String get ingredientsRequired => 'Mindestens eine Zutat hinzufügen';

  @override
  String get cookedWeight => 'Gewicht fertig, g';

  @override
  String get cookedWeightHint =>
      'Wiege das fertige Gericht, um Wasserverlust oder -aufnahme beim Kochen zu berücksichtigen. Leer = Summe der Zutaten.';

  @override
  String get wholeDish => 'Ganzes Gericht';

  @override
  String get dishSuitsFor => 'Passt zu';

  @override
  String get deleteDishTitle => 'Gericht löschen?';

  @override
  String get deleteDishBody =>
      'Es verschwindet aus der Liste. Tagebucheinträge damit bleiben erhalten.';

  @override
  String get chooseProduct => 'Produkt wählen';

  @override
  String get settingsLanguage => 'Sprache';

  @override
  String get settingsTheme => 'Design';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get settingsMode => 'Modus';

  @override
  String get modeLocal => 'Lokal — Daten bleiben auf diesem Gerät';

  @override
  String get modeCloud => 'Cloud';

  @override
  String get settingsNutrients => 'Weitere Nährstoffe';

  @override
  String get settingsNutrientsHint =>
      'Kalorien, Eiweiß, Fett und Kohlenhydrate werden immer erfasst. Wähle, was zusätzlich angezeigt wird.';

  @override
  String get settingsProfile => 'Profil';

  @override
  String get settingsGoals => 'Tagesziele';

  @override
  String get settingsMealGroups => 'Mahlzeiten';

  @override
  String get mealGroupAdd => 'Gruppe hinzufügen';

  @override
  String get mealGroupName => 'Gruppenname';

  @override
  String get notSet => 'Nicht festgelegt';

  @override
  String get settingsFont => 'Schriftart';

  @override
  String get fontSystem => 'Systemschrift';

  @override
  String get fontCustom => 'Eigene Schriften';

  @override
  String get fontAdd => 'Schrift hinzufügen';

  @override
  String get fontAddHint => 'TTF- oder OTF-Datei, bis 5 MB';

  @override
  String fontAdded(String name) {
    return 'Schrift hinzugefügt: $name';
  }

  @override
  String get fontTooLarge => 'Die Datei ist zu groß (max. 5 MB)';

  @override
  String get fontNotAFont => 'Diese Datei ist keine gültige Schrift';

  @override
  String get fontUnsupported =>
      'Schriftsammlungen und WOFF werden nicht unterstützt, bitte TTF oder OTF verwenden';

  @override
  String fontDeleteTitle(String name) {
    return 'Schrift $name löschen?';
  }

  @override
  String get fontPreview => 'Heute 1 240 kcal · Eiweiß 96 g';
}
