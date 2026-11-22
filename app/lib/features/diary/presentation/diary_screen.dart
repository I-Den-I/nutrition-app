import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/db/app_database.dart';
import '../../../core/db/shared_providers.dart';
import '../../../core/domain/formatting.dart';
import '../../../core/domain/nutrients.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/labels.dart';
import '../../../core/widgets/nutrients_view.dart';
import '../data/diary_repository.dart';
import 'diary_providers.dart';
import 'portion_sheet.dart';

class DiaryScreen extends ConsumerWidget {
  const DiaryScreen({super.key});

  String _dayTitle(BuildContext context, DateTime day) {
    final l10n = context.l10n;
    final today = DateTime.now();
    final diff = DateTime(
      day.year,
      day.month,
      day.day,
    ).difference(DateTime(today.year, today.month, today.day)).inDays;
    return switch (diff) {
      0 => l10n.today,
      -1 => l10n.yesterday,
      1 => l10n.tomorrow,
      _ => DateFormat.MMMMd(localeOf(context)).format(day),
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final t = context.tokens;
    final day = ref.watch(selectedDayProvider);
    final dayNotifier = ref.read(selectedDayProvider.notifier);
    final entries = ref.watch(dayEntriesProvider(dayKey(day)));
    final groups = ref.watch(visibleMealGroupsProvider);
    final profile = ref.watch(profileProvider).value;
    final tracked = ref.watch(trackedNutrientsProvider);
    final loc = localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_dayTitle(context, day)),
            Text(
              DateFormat.yMMMMEEEEd(loc).format(day),
              style: TextStyle(fontSize: 13, color: t.textSecondary),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => dayNotifier.shift(-1),
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today_outlined, size: 20),
            onPressed: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: day,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (picked != null) dayNotifier.set(picked);
            },
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () => dayNotifier.shift(1),
          ),
          const SizedBox(width: 4),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        backgroundColor: t.accent,
        foregroundColor: t.onAccent,
        elevation: 0,
        tooltip: l10n.addToDiary,
        onPressed: () => context.push(Routes.diaryAdd),
        child: const Icon(Icons.add),
      ),
      body: switch (entries) {
        AsyncData(:final value) => _DayView(
          entries: value,
          groups: groups,
          goals: profile?.hasGoals == true ? profile!.goals : null,
          tracked: tracked,
        ),
        AsyncError(:final error) => Center(child: Text('$error')),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}

class _DayView extends StatelessWidget {
  const _DayView({
    required this.entries,
    required this.groups,
    required this.goals,
    required this.tracked,
  });

  final List<DiaryEntryView> entries;
  final List<MealGroup> groups;
  final Goal? goals;
  final List<String> tracked;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final total = Nutrients.sum(entries.map((e) => e.nutrients));
    final groupIds = {for (final g in groups) g.id};
    final other = [
      for (final e in entries)
        if (!groupIds.contains(e.entry.mealGroupId)) e,
    ];

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 96),
      children: [
        ContentWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _DayTotalCard(total: total, goals: goals, tracked: tracked),
              const SizedBox(height: 8),
              for (final g in groups)
                _GroupSection(
                  title: l10n.groupLabel(g),
                  groupId: g.id,
                  entries: [
                    for (final e in entries)
                      if (e.entry.mealGroupId == g.id) e,
                  ],
                ),
              if (other.isNotEmpty || groups.isEmpty)
                _GroupSection(
                  title: l10n.noMealGroup,
                  groupId: null,
                  entries: other,
                ),
              if (entries.isEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: EmptyState(
                    icon: Icons.restaurant,
                    message: l10n.emptyDiary,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GroupSection extends StatelessWidget {
  const _GroupSection({
    required this.title,
    required this.groupId,
    required this.entries,
  });

  final String title;
  final String? groupId;
  final List<DiaryEntryView> entries;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final t = context.tokens;
    final loc = localeOf(context);
    final kcal = entries.fold<double>(0, (s, e) => s + e.nutrients.kcal);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              if (entries.isNotEmpty)
                Text(
                  '${formatAmount(kcal, loc)} ${l10n.nutrientKcal}',
                  style: TextStyle(color: t.textSecondary),
                ),
              IconButton(
                visualDensity: VisualDensity.compact,
                tooltip: l10n.actionAdd,
                icon: Icon(Icons.add, color: t.textSecondary),
                onPressed: () => context.push(
                  groupId == null
                      ? Routes.diaryAdd
                      : '${Routes.diaryAdd}?group=$groupId',
                ),
              ),
            ],
          ),
        ),
        Divider(color: t.border),
        for (final e in entries)
          ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            title: Text(e.name, style: const TextStyle(fontSize: 15)),
            subtitle: Text(
              '${formatAmount(e.entry.grams, loc)} ${l10n.basisUnit(e.basis)} · '
              '${l10n.nutrientProtein.characters.first} ${formatAmount(e.nutrients.protein, loc)} · '
              '${l10n.nutrientFat.characters.first} ${formatAmount(e.nutrients.fat, loc)} · '
              '${l10n.nutrientCarbs.characters.first} ${formatAmount(e.nutrients.carbs, loc)}',
            ),
            trailing: Text(
              formatAmount(e.nutrients.kcal, loc),
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            onTap: () =>
                showPortionSheet(context, name: e.name, entry: e.entry),
          ),
      ],
    );
  }
}

class _DayTotalCard extends StatelessWidget {
  const _DayTotalCard({
    required this.total,
    required this.goals,
    required this.tracked,
  });

  final Nutrients total;
  final Goal? goals;
  final List<String> tracked;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final t = context.tokens;
    final loc = localeOf(context);
    String f(double v) => formatAmount(v, loc);
    final kcalGoal = goals?.kcal;

    Widget bar(double value, double? goal) {
      if (goal == null || goal <= 0) return const SizedBox(height: 4);
      final ratio = value / goal;
      return ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: LinearProgressIndicator(
          value: ratio.clamp(0, 1),
          minHeight: 4,
          backgroundColor: t.surfaceMuted,
          color: ratio > 1.05 ? t.danger : t.accent,
        ),
      );
    }

    Widget macro(String label, double value, double? goal) => Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: f(value),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: goal == null
                        ? ' ${l10n.unitGram}'
                        : ' / ${f(goal)} ${l10n.unitGram}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: t.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(fontSize: 12, color: t.textSecondary)),
            const SizedBox(height: 6),
            bar(value, goal),
          ],
        ),
      ),
    );

    final extras = [
      for (final code in tracked)
        '${l10n.nutrientName(code)} ${f(total.extra[code] ?? 0)} '
            '${l10n.nutrientUnit(code)}',
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.dayTotal,
              style: TextStyle(fontSize: 13, color: t.textSecondary),
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  f(total.kcal.roundToDouble()),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(width: 6),
                Text(
                  kcalGoal == null
                      ? l10n.nutrientKcal
                      : '${l10n.ofGoal(f(kcalGoal))} ${l10n.nutrientKcal}',
                  style: TextStyle(color: t.textSecondary),
                ),
              ],
            ),
            if (kcalGoal != null) ...[
              const SizedBox(height: 8),
              bar(total.kcal, kcalGoal),
              const SizedBox(height: 6),
              Text(
                total.kcal <= kcalGoal
                    ? l10n.kcalLeft(f((kcalGoal - total.kcal).roundToDouble()))
                    : l10n.kcalOver(f((total.kcal - kcalGoal).roundToDouble())),
                style: TextStyle(fontSize: 13, color: t.textSecondary),
              ),
            ],
            const SizedBox(height: 16),
            Row(
              children: [
                macro(l10n.nutrientProtein, total.protein, goals?.protein),
                macro(l10n.nutrientFat, total.fat, goals?.fat),
                macro(l10n.nutrientCarbs, total.carbs, goals?.carbs),
              ],
            ),
            if (extras.isNotEmpty) ...[
              const SizedBox(height: 14),
              Text(
                extras.join(' · '),
                style: TextStyle(fontSize: 13, color: t.textSecondary),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
