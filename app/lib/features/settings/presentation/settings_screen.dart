import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/entitlements/entitlements.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/settings/app_settings.dart';
import '../../../core/theme/app_tokens.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final t = context.tokens;
    final settings = ref.watch(settingsProvider);
    final controller = ref.read(settingsProvider.notifier);
    final entitlements = ref.watch(entitlementsProvider);

    Widget section(String title, Widget child) => Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 13, color: t.textSecondary)),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.navSettings)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          section(
            l10n.settingsLanguage,
            DropdownMenu<String>(
              initialSelection: settings.languageCode,
              expandedInsets: EdgeInsets.zero,
              onSelected: (code) {
                if (code != null) controller.setLanguage(code);
              },
              dropdownMenuEntries: [
                for (final (code, name) in supportedLanguages)
                  DropdownMenuEntry(value: code, label: name),
              ],
            ),
          ),
          section(
            l10n.settingsTheme,
            SizedBox(
              width: double.infinity,
              child: SegmentedButton<ThemeMode>(
                showSelectedIcon: false,
                selected: {settings.themeMode},
                onSelectionChanged: (s) => controller.setThemeMode(s.first),
                segments: [
                  ButtonSegment(
                    value: ThemeMode.system,
                    label: Text(l10n.themeSystem),
                  ),
                  ButtonSegment(
                    value: ThemeMode.light,
                    label: Text(l10n.themeLight),
                  ),
                  ButtonSegment(
                    value: ThemeMode.dark,
                    label: Text(l10n.themeDark),
                  ),
                ],
              ),
            ),
          ),
          section(
            l10n.settingsMode,
            Text(entitlements.isCloud ? l10n.modeCloud : l10n.modeLocal),
          ),
        ],
      ),
    );
  }
}
