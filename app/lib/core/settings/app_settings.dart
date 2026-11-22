import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../fonts/app_fonts.dart';

/// Languages offered in the app, with their own-language names.
const supportedLanguages = <(String code, String nativeName)>[
  ('uk', 'Українська'),
  ('en', 'English'),
  ('de', 'Deutsch'),
  ('ru', 'Русский'),
];

/// Device-level UI preferences (not synced between devices).
@immutable
class AppSettings {
  const AppSettings({
    required this.languageCode,
    required this.themeMode,
    required this.onboardingDone,
    this.fontId = defaultFontId,
  });

  final String languageCode;
  final ThemeMode themeMode;
  final bool onboardingDone;

  /// See `app_fonts.dart`: a bundled id, `system` or `custom:<id>`.
  final String fontId;

  Locale get locale => Locale(languageCode);

  AppSettings copyWith({
    String? languageCode,
    ThemeMode? themeMode,
    bool? onboardingDone,
    String? fontId,
  }) => AppSettings(
    languageCode: languageCode ?? this.languageCode,
    themeMode: themeMode ?? this.themeMode,
    onboardingDone: onboardingDone ?? this.onboardingDone,
    fontId: fontId ?? this.fontId,
  );
}

/// Overridden in `main()` with the loaded instance.
final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError('sharedPreferencesProvider not overridden'),
);

final settingsProvider = NotifierProvider<SettingsController, AppSettings>(
  SettingsController.new,
);

class SettingsController extends Notifier<AppSettings> {
  static const _kLanguage = 'language';
  static const _kTheme = 'themeMode';
  static const _kOnboarding = 'onboardingDone';
  static const _kFont = 'font';

  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  @override
  AppSettings build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return AppSettings(
      languageCode: prefs.getString(_kLanguage) ?? _systemLanguage(),
      themeMode:
          ThemeMode.values.asNameMap()[prefs.getString(_kTheme)] ??
          ThemeMode.system,
      onboardingDone: prefs.getBool(_kOnboarding) ?? false,
      fontId: prefs.getString(_kFont) ?? defaultFontId,
    );
  }

  Future<void> setLanguage(String code) async {
    state = state.copyWith(languageCode: code);
    await _prefs.setString(_kLanguage, code);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = state.copyWith(themeMode: mode);
    await _prefs.setString(_kTheme, mode.name);
  }

  Future<void> setFont(String id) async {
    state = state.copyWith(fontId: id);
    await _prefs.setString(_kFont, id);
  }

  Future<void> completeOnboarding() async {
    state = state.copyWith(onboardingDone: true);
    await _prefs.setBool(_kOnboarding, true);
  }

  static String _systemLanguage() {
    final system = WidgetsBinding.instance.platformDispatcher.locale;
    final codes = supportedLanguages.map((l) => l.$1);
    return codes.contains(system.languageCode) ? system.languageCode : 'en';
  }
}
