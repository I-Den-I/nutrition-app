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
  String get actionContinue => 'Далі';

  @override
  String get actionSave => 'Зберегти';

  @override
  String get actionCancel => 'Скасувати';

  @override
  String get actionDelete => 'Видалити';

  @override
  String get actionEdit => 'Редагувати';

  @override
  String get actionAdd => 'Додати';

  @override
  String get actionSkip => 'Пропустити';

  @override
  String get actionDone => 'Готово';

  @override
  String get actionFinish => 'Завершити';

  @override
  String get search => 'Пошук';

  @override
  String get fieldRequired => 'Обов\'язкове поле';

  @override
  String get fieldInvalidNumber => 'Введіть число';

  @override
  String get unsavedChangesTitle => 'Скасувати зміни?';

  @override
  String get actionDiscard => 'Скасувати зміни';

  @override
  String get onboardingChooseLanguage => 'Оберіть мову';

  @override
  String get onboardingLanguageHint =>
      'Її можна змінити пізніше в налаштуваннях.';

  @override
  String get profileTitle => 'Про вас';

  @override
  String get profileHint =>
      'Потрібно, щоб розрахувати добову норму калорій і БЖВ. Можна пропустити й задати цілі вручну.';

  @override
  String get sex => 'Стать';

  @override
  String get sexMale => 'Чоловіча';

  @override
  String get sexFemale => 'Жіноча';

  @override
  String get birthDate => 'Дата народження';

  @override
  String get heightCm => 'Зріст, см';

  @override
  String get weightKg => 'Вага, кг';

  @override
  String get activity => 'Активність';

  @override
  String get activitySedentary => 'Мінімальна';

  @override
  String get activitySedentaryHint => 'Майже без тренувань';

  @override
  String get activityLight => 'Низька';

  @override
  String get activityLightHint => 'Тренування 1–3 рази на тиждень';

  @override
  String get activityModerate => 'Середня';

  @override
  String get activityModerateHint => 'Тренування 3–5 разів на тиждень';

  @override
  String get activityHigh => 'Висока';

  @override
  String get activityHighHint => 'Тренування 6–7 разів на тиждень';

  @override
  String get activityVeryHigh => 'Дуже висока';

  @override
  String get activityVeryHighHint =>
      'Фізична робота або тренування двічі на день';

  @override
  String get weightGoal => 'Мета';

  @override
  String get goalLose => 'Схуднути';

  @override
  String get goalMaintain => 'Підтримувати';

  @override
  String get goalGain => 'Набрати';

  @override
  String get goalsTitle => 'Добові цілі';

  @override
  String get goalsAutoHint =>
      'Розраховано за вашим профілем. Змініть будь-яке значення, щоб задати вручну.';

  @override
  String get goalsManualHint => 'Задано вручну.';

  @override
  String get goalsRecalculate => 'Перерахувати за профілем';

  @override
  String kcalFromMacros(String value) {
    return 'За БЖВ: $value ккал';
  }

  @override
  String get emptyProducts => 'Продуктів ще немає';

  @override
  String get emptyDishes => 'Страв ще немає';

  @override
  String get emptyDiary => 'За цей день нічого не додано';

  @override
  String get nothingFound => 'Нічого не знайдено';

  @override
  String get today => 'Сьогодні';

  @override
  String get yesterday => 'Вчора';

  @override
  String get tomorrow => 'Завтра';

  @override
  String get dayTotal => 'Разом за день';

  @override
  String ofGoal(String goal) {
    return 'з $goal';
  }

  @override
  String kcalLeft(String value) {
    return 'Лишилось $value ккал';
  }

  @override
  String kcalOver(String value) {
    return 'Перевищено на $value ккал';
  }

  @override
  String get noMealGroup => 'Інше';

  @override
  String get addToDiary => 'Додати в щоденник';

  @override
  String addedToDiary(String name) {
    return 'Додано: $name';
  }

  @override
  String get editEntry => 'Редагувати запис';

  @override
  String get grams => 'Грами';

  @override
  String get mealGroup => 'Прийом їжі';

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
  String get nutrientCalories => 'Калорії';

  @override
  String get unitGram => 'г';

  @override
  String get unitCm => 'см';

  @override
  String get unitKg => 'кг';

  @override
  String get unitMl => 'мл';

  @override
  String get mealBreakfast => 'Сніданок';

  @override
  String get mealLunch => 'Обід';

  @override
  String get mealDinner => 'Вечеря';

  @override
  String get mealSnack => 'Перекус';

  @override
  String get productNew => 'Новий продукт';

  @override
  String get productEdit => 'Редагувати продукт';

  @override
  String get fieldName => 'Назва';

  @override
  String get fieldDescription => 'Опис';

  @override
  String get basis => 'Одиниці';

  @override
  String get basisG => 'Грами';

  @override
  String get basisMl => 'Мілілітри';

  @override
  String get per100g => 'На 100 г';

  @override
  String get per100ml => 'На 100 мл';

  @override
  String get kcalAutoHint => 'Залиште порожнім, щоб порахувати за БЖВ';

  @override
  String get photos => 'Фото';

  @override
  String get addPhoto => 'Додати фото';

  @override
  String get photoGallery => 'Вибрати з галереї';

  @override
  String get photoCamera => 'Зробити фото';

  @override
  String get deleteProductTitle => 'Видалити продукт?';

  @override
  String get deleteProductBody =>
      'Він зникне зі списку. Записи в щоденнику та страви з ним залишаться.';

  @override
  String get dishNew => 'Нова страва';

  @override
  String get dishEdit => 'Редагувати страву';

  @override
  String get ingredients => 'Інгредієнти';

  @override
  String get addIngredient => 'Додати інгредієнт';

  @override
  String get ingredientsRequired => 'Додайте хоча б один інгредієнт';

  @override
  String get cookedWeight => 'Вага готової страви, г';

  @override
  String get cookedWeightHint =>
      'Зважте готову страву, щоб врахувати википання чи набухання. Порожньо = сума інгредієнтів.';

  @override
  String get wholeDish => 'Уся страва';

  @override
  String get dishSuitsFor => 'Підходить для';

  @override
  String get deleteDishTitle => 'Видалити страву?';

  @override
  String get deleteDishBody =>
      'Вона зникне зі списку. Записи в щоденнику з нею залишаться.';

  @override
  String get chooseProduct => 'Оберіть продукт';

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

  @override
  String get settingsNutrients => 'Додаткові нутрієнти';

  @override
  String get settingsNutrientsHint =>
      'Калорії, білки, жири й вуглеводи рахуються завжди. Оберіть, що ще показувати.';

  @override
  String get settingsProfile => 'Профіль';

  @override
  String get settingsGoals => 'Добові цілі';

  @override
  String get settingsMealGroups => 'Прийоми їжі';

  @override
  String get mealGroupAdd => 'Додати групу';

  @override
  String get mealGroupName => 'Назва групи';

  @override
  String get notSet => 'Не задано';
}
