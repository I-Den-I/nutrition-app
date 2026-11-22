import 'package:material_ui/material_ui.dart';

import 'app_tokens.dart';

/// Builds a minimal monochrome [ThemeData] from [AppTokens].
abstract final class AppTheme {
  static ThemeData light() => _build(AppTokens.light, Brightness.light);
  static ThemeData dark() => _build(AppTokens.dark, Brightness.dark);

  static ThemeData _build(AppTokens t, Brightness brightness) {
    final scheme = ColorScheme(
      brightness: brightness,
      primary: t.accent,
      onPrimary: t.onAccent,
      secondary: t.textSecondary,
      onSecondary: t.background,
      error: t.danger,
      onError: t.background,
      surface: t.background,
      onSurface: t.textPrimary,
      onSurfaceVariant: t.textSecondary,
      surfaceContainerLowest: t.background,
      surfaceContainerLow: t.surface,
      surfaceContainer: t.surface,
      surfaceContainerHigh: t.surfaceMuted,
      surfaceContainerHighest: t.surfaceMuted,
      outline: t.border,
      outlineVariant: t.border,
      secondaryContainer: t.surfaceMuted,
      onSecondaryContainer: t.textPrimary,
    );

    final base = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: t.background,
      splashFactory: NoSplash.splashFactory,
      extensions: [t],
    );

    final text = base.textTheme.apply(
      bodyColor: t.textPrimary,
      displayColor: t.textPrimary,
    );

    return base.copyWith(
      textTheme: text.copyWith(
        displaySmall: text.displaySmall?.copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: -1,
        ),
        titleLarge: text.titleLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: t.background,
        foregroundColor: t.textPrimary,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
      ),
      dividerTheme: DividerThemeData(color: t.border, thickness: 1, space: 1),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: t.background,
        indicatorColor: t.surfaceMuted,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        height: 64,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: t.background,
        indicatorColor: t.surfaceMuted,
        labelType: NavigationRailLabelType.all,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: t.accent,
          foregroundColor: t.onAccent,
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: t.textSecondary,
        selectedColor: t.textPrimary,
        selectedTileColor: t.surfaceMuted,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: SegmentedButton.styleFrom(
          selectedBackgroundColor: t.accent,
          selectedForegroundColor: t.onAccent,
          side: BorderSide(color: t.border),
        ),
      ),
      cardTheme: CardThemeData(
        color: t.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: t.border),
        ),
      ),
    );
  }
}
