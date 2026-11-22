import 'package:material_ui/material_ui.dart';

import 'app_tokens.dart';

/// Builds a minimal monochrome [ThemeData] from [AppTokens].
/// Fonts whose regular weight looks too light for body text.
const _thinFonts = {'Comfortaa'};

/// Whether [family] gets heavier default weights (see [_heavier]).
bool isThinFont(String? family) => _thinFonts.contains(family);

extension StrongWeight on BuildContext {
  /// Weight for emphasized numbers and labels: bold for thin fonts,
  /// semi-bold otherwise.
  FontWeight get strongWeight =>
      _thinFonts.contains(Theme.of(this).textTheme.bodyMedium?.fontFamily)
      ? FontWeight.w700
      : FontWeight.w600;
}

/// Body text semi-bold, headings bold.
TextTheme _heavier(TextTheme t) {
  TextStyle? w(TextStyle? s, FontWeight weight) =>
      s?.copyWith(fontWeight: weight);
  return t.copyWith(
    displayLarge: w(t.displayLarge, FontWeight.w700),
    displayMedium: w(t.displayMedium, FontWeight.w700),
    displaySmall: w(t.displaySmall, FontWeight.w700),
    headlineLarge: w(t.headlineLarge, FontWeight.w700),
    headlineMedium: w(t.headlineMedium, FontWeight.w700),
    headlineSmall: w(t.headlineSmall, FontWeight.w700),
    titleLarge: w(t.titleLarge, FontWeight.w700),
    titleMedium: w(t.titleMedium, FontWeight.w700),
    titleSmall: w(t.titleSmall, FontWeight.w700),
    bodyLarge: w(t.bodyLarge, FontWeight.w700),
    bodyMedium: w(t.bodyMedium, FontWeight.w700),
    bodySmall: w(t.bodySmall, FontWeight.w600),
    labelLarge: w(t.labelLarge, FontWeight.w700),
    labelMedium: w(t.labelMedium, FontWeight.w600),
    labelSmall: w(t.labelSmall, FontWeight.w600),
  );
}

abstract final class AppTheme {
  /// [fontFamily] null = platform font.
  static ThemeData light({String? fontFamily}) =>
      _build(AppTokens.light, Brightness.light, fontFamily);
  static ThemeData dark({String? fontFamily}) =>
      _build(AppTokens.dark, Brightness.dark, fontFamily);

  static ThemeData _build(
    AppTokens t,
    Brightness brightness,
    String? fontFamily,
  ) {
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
      fontFamily: fontFamily,
      colorScheme: scheme,
      scaffoldBackgroundColor: t.background,
      splashFactory: NoSplash.splashFactory,
      extensions: [t],
    );

    final applied = base.textTheme.apply(
      bodyColor: t.textPrimary,
      displayColor: t.textPrimary,
    );
    final headingWeight = _thinFonts.contains(fontFamily)
        ? FontWeight.w700
        : FontWeight.w600;
    final text = _thinFonts.contains(fontFamily) ? _heavier(applied) : applied;

    return base.copyWith(
      textTheme: text.copyWith(
        displaySmall: text.displaySmall?.copyWith(
          fontWeight: headingWeight,
          letterSpacing: -1,
        ),
        titleLarge: text.titleLarge?.copyWith(fontWeight: headingWeight),
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
        // Tight labels so long words ("Налаштування", "Einstellungen")
        // fit on one line even with wide fonts.
        labelTextStyle: WidgetStateProperty.resolveWith(
          (s) => (text.labelSmall ?? const TextStyle()).copyWith(
            fontFamily: fontFamily,
            fontSize: 11,
            letterSpacing: 0,
            color: s.contains(WidgetState.selected)
                ? t.textPrimary
                : t.textSecondary,
          ),
        ),
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
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
      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: t.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: t.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: t.textPrimary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: t.danger),
        ),
        labelStyle: TextStyle(color: t.textSecondary, fontFamily: fontFamily),
        floatingLabelStyle: TextStyle(
          color: t.textPrimary,
          fontFamily: fontFamily,
        ),
        helperStyle: TextStyle(color: t.textSecondary, fontFamily: fontFamily),
        suffixStyle: TextStyle(color: t.textSecondary, fontFamily: fontFamily),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: t.background,
        selectedColor: t.accent,
        // A plain style: chips merge it with their own, and a
        // WidgetStateTextStyle would lose the font family there.
        // Selected colors are set by SelectChip.
        labelStyle: (text.labelLarge ?? const TextStyle()).copyWith(
          fontFamily: fontFamily,
          color: t.textPrimary,
        ),
        secondaryLabelStyle: TextStyle(
          color: t.onAccent,
          fontFamily: fontFamily,
        ),
        side: BorderSide(color: t.border),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (s) =>
              s.contains(WidgetState.selected) ? t.onAccent : t.textSecondary,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? t.accent : t.surfaceMuted,
        ),
        trackOutlineColor: WidgetStatePropertyAll(t.border),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: t.textPrimary,
        contentTextStyle: (text.bodyMedium ?? const TextStyle()).copyWith(
          fontFamily: fontFamily,
          color: t.background,
        ),
        behavior: SnackBarBehavior.floating,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: t.background,
        surfaceTintColor: Colors.transparent,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: t.background,
        surfaceTintColor: Colors.transparent,
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
