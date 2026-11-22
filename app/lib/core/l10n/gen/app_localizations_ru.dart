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
  String get actionContinue => 'Далее';

  @override
  String get actionSave => 'Сохранить';

  @override
  String get actionCancel => 'Отмена';

  @override
  String get actionDelete => 'Удалить';

  @override
  String get actionEdit => 'Изменить';

  @override
  String get actionAdd => 'Добавить';

  @override
  String get actionSkip => 'Пропустить';

  @override
  String get actionDone => 'Готово';

  @override
  String get actionFinish => 'Завершить';

  @override
  String get search => 'Поиск';

  @override
  String get fieldRequired => 'Обязательное поле';

  @override
  String get fieldInvalidNumber => 'Введите число';

  @override
  String get unsavedChangesTitle => 'Отменить изменения?';

  @override
  String get actionDiscard => 'Отменить изменения';

  @override
  String get onboardingChooseLanguage => 'Выберите язык';

  @override
  String get onboardingLanguageHint => 'Его можно изменить позже в настройках.';

  @override
  String get profileTitle => 'О вас';

  @override
  String get profileHint =>
      'Нужно, чтобы рассчитать суточную норму калорий и БЖУ. Можно пропустить и задать цели вручную.';

  @override
  String get sex => 'Пол';

  @override
  String get sexMale => 'Мужской';

  @override
  String get sexFemale => 'Женский';

  @override
  String get birthDate => 'Дата рождения';

  @override
  String get heightCm => 'Рост, см';

  @override
  String get weightKg => 'Вес, кг';

  @override
  String get activity => 'Активность';

  @override
  String get activitySedentary => 'Минимальная';

  @override
  String get activitySedentaryHint => 'Почти без тренировок';

  @override
  String get activityLight => 'Низкая';

  @override
  String get activityLightHint => 'Тренировки 1–3 раза в неделю';

  @override
  String get activityModerate => 'Средняя';

  @override
  String get activityModerateHint => 'Тренировки 3–5 раз в неделю';

  @override
  String get activityHigh => 'Высокая';

  @override
  String get activityHighHint => 'Тренировки 6–7 раз в неделю';

  @override
  String get activityVeryHigh => 'Очень высокая';

  @override
  String get activityVeryHighHint =>
      'Физическая работа или тренировки дважды в день';

  @override
  String get weightGoal => 'Цель';

  @override
  String get goalLose => 'Похудеть';

  @override
  String get goalMaintain => 'Поддерживать';

  @override
  String get goalGain => 'Набрать';

  @override
  String get goalsTitle => 'Дневные цели';

  @override
  String get goalsAutoHint =>
      'Рассчитано по вашему профилю. Измените любое значение, чтобы задать вручную.';

  @override
  String get goalsManualHint => 'Задано вручную.';

  @override
  String get goalsRecalculate => 'Пересчитать по профилю';

  @override
  String kcalFromMacros(String value) {
    return 'По БЖУ: $value ккал';
  }

  @override
  String get emptyProducts => 'Продуктов пока нет';

  @override
  String get emptyDishes => 'Блюд пока нет';

  @override
  String get emptyDiary => 'За этот день ничего не добавлено';

  @override
  String get nothingFound => 'Ничего не найдено';

  @override
  String get today => 'Сегодня';

  @override
  String get yesterday => 'Вчера';

  @override
  String get tomorrow => 'Завтра';

  @override
  String get dayTotal => 'Итого за день';

  @override
  String ofGoal(String goal) {
    return 'из $goal';
  }

  @override
  String kcalLeft(String value) {
    return 'Осталось $value ккал';
  }

  @override
  String kcalOver(String value) {
    return 'Превышено на $value ккал';
  }

  @override
  String get noMealGroup => 'Другое';

  @override
  String get addToDiary => 'Добавить в дневник';

  @override
  String addedToDiary(String name) {
    return 'Добавлено: $name';
  }

  @override
  String get editEntry => 'Изменить запись';

  @override
  String get grams => 'Граммы';

  @override
  String get mealGroup => 'Приём пищи';

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
  String get nutrientCalories => 'Калории';

  @override
  String get unitGram => 'г';

  @override
  String get unitCm => 'см';

  @override
  String get unitKg => 'кг';

  @override
  String get unitMl => 'мл';

  @override
  String get mealBreakfast => 'Завтрак';

  @override
  String get mealLunch => 'Обед';

  @override
  String get mealDinner => 'Ужин';

  @override
  String get mealSnack => 'Перекус';

  @override
  String get productNew => 'Новый продукт';

  @override
  String get productEdit => 'Изменить продукт';

  @override
  String get fieldName => 'Название';

  @override
  String get fieldDescription => 'Описание';

  @override
  String get basis => 'Единицы';

  @override
  String get basisG => 'Граммы';

  @override
  String get basisMl => 'Миллилитры';

  @override
  String get per100g => 'На 100 г';

  @override
  String get per100ml => 'На 100 мл';

  @override
  String get kcalAutoHint => 'Оставьте пустым, чтобы посчитать по БЖУ';

  @override
  String get photos => 'Фото';

  @override
  String get addPhoto => 'Добавить фото';

  @override
  String get photoGallery => 'Выбрать из галереи';

  @override
  String get photoCamera => 'Сделать фото';

  @override
  String get deleteProductTitle => 'Удалить продукт?';

  @override
  String get deleteProductBody =>
      'Он исчезнет из списка. Записи в дневнике и блюда с ним сохранятся.';

  @override
  String get dishNew => 'Новое блюдо';

  @override
  String get dishEdit => 'Изменить блюдо';

  @override
  String get ingredients => 'Ингредиенты';

  @override
  String get addIngredient => 'Добавить ингредиент';

  @override
  String get ingredientsRequired => 'Добавьте хотя бы один ингредиент';

  @override
  String get cookedWeight => 'Вес готового блюда, г';

  @override
  String get cookedWeightHint =>
      'Взвесьте готовое блюдо, чтобы учесть уваривание или разбухание. Пусто = сумма ингредиентов.';

  @override
  String get wholeDish => 'Всё блюдо';

  @override
  String get dishSuitsFor => 'Подходит для';

  @override
  String get deleteDishTitle => 'Удалить блюдо?';

  @override
  String get deleteDishBody =>
      'Оно исчезнет из списка. Записи в дневнике с ним сохранятся.';

  @override
  String get chooseProduct => 'Выберите продукт';

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

  @override
  String get settingsNutrients => 'Дополнительные нутриенты';

  @override
  String get settingsNutrientsHint =>
      'Калории, белки, жиры и углеводы считаются всегда. Выберите, что ещё показывать.';

  @override
  String get settingsProfile => 'Профиль';

  @override
  String get settingsGoals => 'Дневные цели';

  @override
  String get settingsMealGroups => 'Приёмы пищи';

  @override
  String get mealGroupAdd => 'Добавить группу';

  @override
  String get mealGroupName => 'Название группы';

  @override
  String get notSet => 'Не задано';
}
