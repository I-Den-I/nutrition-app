import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  });

  final String languageCode;
  final ThemeMode themeMode;
  final bool onboardingDone;

  Locale get locale => Locale(languageCode);

  AppSettings copyWith({
    String? languageCode,
    ThemeMode? themeMode,
    bool? onboardingDone,
  }) => AppSettings(
    languageCode: languageCode ?? this.languageCode,
    themeMode: themeMode ?? this.themeMode,
    onboardingDone: onboardingDone ?? this.onboardingDone,
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
