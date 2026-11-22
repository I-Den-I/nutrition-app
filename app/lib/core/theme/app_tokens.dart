import 'package:material_ui/material_ui.dart';

/// Design tokens: the only place where raw colors live.
///
/// Widgets read colors via `context.tokens` (or the derived [ColorScheme]),
/// never via hard-coded `Color(...)`. A future "accent picker" only has to
/// swap [accent] / [onAccent].
@immutable
class AppTokens extends ThemeExtension<AppTokens> {
  const AppTokens({
    required this.background,
    required this.surface,
    required this.surfaceMuted,
    required this.border,
    required this.textPrimary,
    required this.textSecondary,
    required this.accent,
    required this.onAccent,
    required this.danger,
  });

  final Color background;
  final Color surface;
  final Color surfaceMuted;
  final Color border;
  final Color textPrimary;
  final Color textSecondary;
  final Color accent;
  final Color onAccent;
  final Color danger;

  static const light = AppTokens(
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFFAFAFA),
    surfaceMuted: Color(0xFFF0F0F0),
    border: Color(0xFFE4E4E4),
    textPrimary: Color(0xFF0A0A0A),
    textSecondary: Color(0xFF6E6E6E),
    accent: Color(0xFF0A0A0A),
    onAccent: Color(0xFFFFFFFF),
    danger: Color(0xFF8A1C1C),
  );

  static const dark = AppTokens(
    background: Color(0xFF0A0A0A),
    surface: Color(0xFF141414),
    surfaceMuted: Color(0xFF1F1F1F),
    border: Color(0xFF2A2A2A),
    textPrimary: Color(0xFFF5F5F5),
    textSecondary: Color(0xFF9A9A9A),
    accent: Color(0xFFF5F5F5),
    onAccent: Color(0xFF0A0A0A),
    danger: Color(0xFFE07070),
  );

  @override
  AppTokens copyWith({
    Color? background,
    Color? surface,
    Color? surfaceMuted,
    Color? border,
    Color? textPrimary,
    Color? textSecondary,
    Color? accent,
    Color? onAccent,
    Color? danger,
  }) {
    return AppTokens(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceMuted: surfaceMuted ?? this.surfaceMuted,
      border: border ?? this.border,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      accent: accent ?? this.accent,
      onAccent: onAccent ?? this.onAccent,
      danger: danger ?? this.danger,
    );
  }

  @override
  AppTokens lerp(AppTokens? other, double t) {
    if (other == null) return this;
    return AppTokens(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceMuted: Color.lerp(surfaceMuted, other.surfaceMuted, t)!,
      border: Color.lerp(border, other.border, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      onAccent: Color.lerp(onAccent, other.onAccent, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
    );
  }
}

extension AppTokensContext on BuildContext {
  AppTokens get tokens => Theme.of(this).extension<AppTokens>()!;
}
