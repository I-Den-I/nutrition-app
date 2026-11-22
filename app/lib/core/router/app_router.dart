import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../features/diary/presentation/add_entry_screen.dart';
import '../../features/diary/presentation/diary_screen.dart';
import '../../features/dishes/presentation/dish_form_screen.dart';
import '../../features/dishes/presentation/dish_screen.dart';
import '../../features/dishes/presentation/dishes_screen.dart';
import '../../features/onboarding/presentation/language_screen.dart';
import '../../features/products/presentation/product_form_screen.dart';
import '../../features/products/presentation/product_picker_screen.dart';
import '../../features/products/presentation/product_screen.dart';
import '../../features/products/presentation/products_screen.dart';
import '../../features/profile/presentation/goals_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/settings/presentation/fonts_screen.dart';
import '../../features/settings/presentation/meal_groups_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/shell/app_shell.dart';
import '../settings/app_settings.dart';
import 'routes.dart';

export 'routes.dart';

final _rootKey = GlobalKey<NavigatorState>();

/// A route shown full-screen above the tab bar.
GoRoute _full(String path, Widget Function(GoRouterState s) build) => GoRoute(
  path: path,
  parentNavigatorKey: _rootKey,
  builder: (_, s) => build(s),
);

final routerProvider = Provider<GoRouter>((ref) {
  // Re-run redirects when onboarding state changes, without rebuilding
  // the whole router.
  final onboardingDone = ValueNotifier(
    ref.read(settingsProvider).onboardingDone,
  );
  ref.listen(
    settingsProvider.select((s) => s.onboardingDone),
    (_, done) => onboardingDone.value = done,
  );
  ref.onDispose(onboardingDone.dispose);

  final router = GoRouter(
    navigatorKey: _rootKey,
    initialLocation: Routes.diary,
    refreshListenable: onboardingDone,
    redirect: (context, state) {
      final inOnboarding = state.matchedLocation.startsWith(Routes.onboarding);
      if (!onboardingDone.value) return inOnboarding ? null : Routes.onboarding;
      if (inOnboarding) return Routes.diary;
      return null;
    },
    routes: [
      GoRoute(
        path: Routes.onboarding,
        builder: (_, _) => const LanguageScreen(),
        routes: [
          GoRoute(
            path: 'profile',
            builder: (_, _) => const ProfileScreen(onboarding: true),
          ),
          GoRoute(
            path: 'goals',
            builder: (_, _) => const GoalsScreen(onboarding: true),
          ),
        ],
      ),
      _full(Routes.pickProduct, (_) => const ProductPickerScreen()),
      StatefulShellRoute.indexedStack(
        builder: (_, _, shell) => AppShell(navigationShell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.diary,
                builder: (_, _) => const DiaryScreen(),
                routes: [
                  _full(
                    'add',
                    (s) => AddEntryScreen(
                      mealGroupId: s.uri.queryParameters['group'],
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.products,
                builder: (_, _) => const ProductsScreen(),
                routes: [
                  _full('new', (_) => const ProductFormScreen()),
                  GoRoute(
                    path: ':id',
                    builder: (_, s) =>
                        ProductScreen(productId: s.pathParameters['id']!),
                    routes: [
                      _full(
                        'edit',
                        (s) => ProductFormScreen(
                          productId: s.pathParameters['id'],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.dishes,
                builder: (_, _) => const DishesScreen(),
                routes: [
                  _full('new', (_) => const DishFormScreen()),
                  GoRoute(
                    path: ':id',
                    builder: (_, s) =>
                        DishScreen(dishId: s.pathParameters['id']!),
                    routes: [
                      _full(
                        'edit',
                        (s) => DishFormScreen(dishId: s.pathParameters['id']),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.settings,
                builder: (_, _) => const SettingsScreen(),
                routes: [
                  GoRoute(
                    path: 'profile',
                    builder: (_, _) => const ProfileScreen(),
                  ),
                  GoRoute(
                    path: 'goals',
                    builder: (_, _) => const GoalsScreen(),
                  ),
                  GoRoute(
                    path: 'meal-groups',
                    builder: (_, _) => const MealGroupsScreen(),
                  ),
                  GoRoute(
                    path: 'fonts',
                    builder: (_, _) => const FontsScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});
