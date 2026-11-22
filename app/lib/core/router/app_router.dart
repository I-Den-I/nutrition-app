import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../features/diary/presentation/diary_screen.dart';
import '../../features/dishes/presentation/dishes_screen.dart';
import '../../features/onboarding/presentation/language_screen.dart';
import '../../features/products/presentation/products_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/shell/app_shell.dart';
import '../settings/app_settings.dart';

abstract final class Routes {
  static const onboarding = '/onboarding';
  static const diary = '/diary';
  static const products = '/products';
  static const dishes = '/dishes';
  static const settings = '/settings';
}

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
    initialLocation: Routes.diary,
    refreshListenable: onboardingDone,
    redirect: (context, state) {
      final atOnboarding = state.matchedLocation == Routes.onboarding;
      if (!onboardingDone.value) return atOnboarding ? null : Routes.onboarding;
      if (atOnboarding) return Routes.diary;
      return null;
    },
    routes: [
      GoRoute(
        path: Routes.onboarding,
        builder: (_, _) => const LanguageScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (_, _, shell) => AppShell(navigationShell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.diary,
                builder: (_, _) => const DiaryScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.products,
                builder: (_, _) => const ProductsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.dishes,
                builder: (_, _) => const DishesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.settings,
                builder: (_, _) => const SettingsScreen(),
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
