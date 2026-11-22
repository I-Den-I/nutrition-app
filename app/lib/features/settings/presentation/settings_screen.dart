import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/db/app_database.dart';
import '../../../core/db/repositories.dart';
import '../../../core/db/shared_providers.dart';
import '../../../core/domain/formatting.dart';
import '../../../core/entitlements/entitlements.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/router/routes.dart';
import '../../../core/settings/app_settings.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/labels.dart';
import '../../../core/widgets/nutrients_view.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final t = context.tokens;
    final settings = ref.watch(settingsProvider);
    final controller = ref.read(settingsProvider.notifier);
    final entitlements = ref.watch(entitlementsProvider);
    final profile = ref.watch(profileProvider).value;
    final tracked = ref.watch(trackedNutrientsProvider);
    final groups = ref.watch(visibleMealGroupsProvider);
    final loc = localeOf(context);

    String? profileSummary() {
      final p = profile?.profile;
      if (p?.sex == null || profile?.weightKg == null) return null;
      return [
        l10n.sexName(p!.sex!),
        if (p.heightCm != null)
          '${formatAmount(p.heightCm!, loc)} ${l10n.unitCm}',
        '${formatAmount(profile!.weightKg!, loc)} ${l10n.unitKg}',
        if (p.weightGoal != null) l10n.goalName(p.weightGoal!),
      ].join(' · ');
    }

    String? goalsSummary() {
      final g = profile?.goals;
      if (g?.kcal == null) return null;
      String f(double? v) => formatAmount(v ?? 0, loc);
      return '${f(g!.kcal)} ${l10n.nutrientKcal} · '
          '${l10n.nutrientProtein.characters.first} ${f(g.protein)} · '
          '${l10n.nutrientFat.characters.first} ${f(g.fat)} · '
          '${l10n.nutrientCarbs.characters.first} ${f(g.carbs)}';
    }

    Widget link(String title, String? subtitle, String route) => ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      subtitle: Text(subtitle ?? l10n.notSet),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => context.push(route),
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.navSettings)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
        children: [
          ContentWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                link(
                  l10n.settingsProfile,
                  profileSummary(),
                  Routes.settingsProfile,
                ),
                const Divider(),
                link(l10n.settingsGoals, goalsSummary(), Routes.settingsGoals),
                const Divider(),
                link(
                  l10n.settingsMealGroups,
                  groups.map(l10n.groupLabel).join(', '),
                  Routes.settingsMealGroups,
                ),
                SectionLabel(l10n.settingsNutrients),
                Text(
                  l10n.settingsNutrientsHint,
                  style: TextStyle(fontSize: 13, color: t.textSecondary),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final (code, _) in optionalNutrients)
                      SelectChip(
                        label: l10n.nutrientName(code),
                        selected: tracked.contains(code),
                        onSelected: (sel) => ref
                            .read(profileRepositoryProvider)
                            .setTrackedNutrients([
                              for (final (c, _) in optionalNutrients)
                                if (c == code ? sel : tracked.contains(c)) c,
                            ]),
                      ),
                  ],
                ),
                SectionLabel(l10n.settingsLanguage),
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
                SectionLabel(l10n.settingsTheme),
                SegmentedButton<ThemeMode>(
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
                SectionLabel(l10n.settingsMode),
                Text(entitlements.isCloud ? l10n.modeCloud : l10n.modeLocal),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
