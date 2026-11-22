// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Харчування';

  @override
  String get navDiary => 'Щоденник';

  @override
  String get navProducts => 'Продукти';

  @override
  String get navDishes => 'Страви';

  @override
  String get navSettings => 'Налаштування';

  @override
  String get onboardingChooseLanguage => 'Оберіть мову';

  @override
  String get onboardingLanguageHint =>
      'Її можна змінити пізніше в налаштуваннях.';

  @override
  String get actionContinue => 'Далі';

  @override
  String get emptyProducts => 'Продуктів ще немає';

  @override
  String get emptyDishes => 'Страв ще немає';

  @override
  String get emptyDiary => 'Сьогодні ще нічого не додано';

  @override
  String get comingSoon => 'Скоро буде';

  @override
  String get today => 'Сьогодні';

  @override
  String get dayTotal => 'Разом за день';

  @override
  String get nutrientKcal => 'ккал';

  @override
  String get nutrientProtein => 'Білки';

  @override
  String get nutrientFat => 'Жири';

  @override
  String get nutrientCarbs => 'Вуглеводи';

  @override
  String get nutrientFiber => 'Клітковина';

  @override
  String get nutrientSugar => 'Цукор';

  @override
  String get nutrientSatFat => 'Насичені жири';

  @override
  String get nutrientSalt => 'Сіль';

  @override
  String get nutrientWater => 'Вода';

  @override
  String get unitGram => 'г';

  @override
  String get mealBreakfast => 'Сніданок';

  @override
  String get mealLunch => 'Обід';

  @override
  String get mealDinner => 'Вечеря';

  @override
  String get mealSnack => 'Перекус';

  @override
  String get settingsLanguage => 'Мова';

  @override
  String get settingsTheme => 'Тема';

  @override
  String get themeSystem => 'Системна';

  @override
  String get themeLight => 'Світла';

  @override
  String get themeDark => 'Темна';

  @override
  String get settingsMode => 'Режим';

  @override
  String get modeLocal => 'Локальний — дані лише на цьому пристрої';

  @override
  String get modeCloud => 'Хмарний';
}
