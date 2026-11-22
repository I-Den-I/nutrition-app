import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import 'core/fonts/app_fonts.dart';
import 'core/fonts/font_providers.dart';
import 'core/l10n/l10n.dart';
import 'core/router/app_router.dart';
import 'core/settings/app_settings.dart';
import 'core/theme/app_theme.dart';

class NutritionApp extends ConsumerWidget {
  const NutritionApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final router = ref.watch(routerProvider);
    final font = ref.watch(activeFontFamilyProvider);
    // While a user font loads, keep the default one instead of flashing
    // the platform font.
    final fontFamily = font.hasValue
        ? font.value
        : fontFamilyFor(defaultFontId);

    return MaterialApp.router(
      onGenerateTitle: (context) => context.l10n.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(fontFamily: fontFamily),
      darkTheme: AppTheme.dark(fontFamily: fontFamily),
      themeMode: settings.themeMode,
      locale: settings.locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: appLocalizationsDelegates,
      routerConfig: router,
      // Tapping outside a text field closes the keyboard. Needed on iOS,
      // where the number pad has no "Done" key.
      builder: (context, child) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ScrollConfiguration(
          behavior: const _DismissKeyboardOnScroll(),
          child: child!,
        ),
      ),
    );
  }
}

/// Closes the keyboard when the user starts scrolling a list.
class _DismissKeyboardOnScroll extends MaterialScrollBehavior {
  const _DismissKeyboardOnScroll();

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return NotificationListener<ScrollStartNotification>(
      onNotification: (n) {
        if (n.dragDetails != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
        return false;
      },
      child: super.buildScrollbar(context, child, details),
    );
  }
}
