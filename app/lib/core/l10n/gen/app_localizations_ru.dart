// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Питание';

  @override
  String get navDiary => 'Дневник';

  @override
  String get navProducts => 'Продукты';

  @override
  String get navDishes => 'Блюда';

  @override
  String get navSettings => 'Настройки';

  @override
  String get onboardingChooseLanguage => 'Выберите язык';

  @override
  String get onboardingLanguageHint => 'Его можно изменить позже в настройках.';

  @override
  String get actionContinue => 'Далее';

  @override
  String get emptyProducts => 'Продуктов пока нет';

  @override
  String get emptyDishes => 'Блюд пока нет';

  @override
  String get emptyDiary => 'Сегодня ещё ничего не добавлено';

  @override
  String get comingSoon => 'Скоро будет';

  @override
  String get today => 'Сегодня';

  @override
  String get dayTotal => 'Итого за день';

  @override
  String get nutrientKcal => 'ккал';

  @override
  String get nutrientProtein => 'Белки';

  @override
  String get nutrientFat => 'Жиры';

  @override
  String get nutrientCarbs => 'Углеводы';

  @override
  String get nutrientFiber => 'Клетчатка';

  @override
  String get nutrientSugar => 'Сахар';

  @override
  String get nutrientSatFat => 'Насыщенные жиры';

  @override
  String get nutrientSalt => 'Соль';

  @override
  String get nutrientWater => 'Вода';

  @override
  String get unitGram => 'г';

  @override
  String get mealBreakfast => 'Завтрак';

  @override
  String get mealLunch => 'Обед';

  @override
  String get mealDinner => 'Ужин';

  @override
  String get mealSnack => 'Перекус';

  @override
  String get settingsLanguage => 'Язык';

  @override
  String get settingsTheme => 'Тема';

  @override
  String get themeSystem => 'Системная';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get settingsMode => 'Режим';

  @override
  String get modeLocal => 'Локальный — данные только на этом устройстве';

  @override
  String get modeCloud => 'Облачный';
}
