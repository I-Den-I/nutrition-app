/// Route paths. Use these instead of string literals.
abstract final class Routes {
  static const onboarding = '/onboarding';
  static const onboardingProfile = '/onboarding/profile';
  static const onboardingGoals = '/onboarding/goals';

  static const diary = '/diary';
  static const diaryAdd = '/diary/add';

  static const products = '/products';
  static const productNew = '/products/new';
  static String product(String id) => '/products/$id';
  static String productEdit(String id) => '/products/$id/edit';

  static const dishes = '/dishes';
  static const dishNew = '/dishes/new';
  static String dish(String id) => '/dishes/$id';
  static String dishEdit(String id) => '/dishes/$id/edit';

  /// Full-screen product picker; pops with the chosen product id.
  static const pickProduct = '/pick-product';

  static const settings = '/settings';
  static const settingsProfile = '/settings/profile';
  static const settingsGoals = '/settings/goals';
  static const settingsMealGroups = '/settings/meal-groups';
  static const settingsFonts = '/settings/fonts';
}
