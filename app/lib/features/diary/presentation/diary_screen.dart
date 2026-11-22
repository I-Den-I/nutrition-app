import 'package:drift/drift.dart' show BooleanExpressionOperators, OrderingTerm;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/db/app_database.dart';
import '../../../core/db/database_provider.dart';
import '../../../core/domain/nutrients.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/empty_state.dart';

final _mealGroupsProvider = StreamProvider<List<MealGroup>>((ref) {
  final db = ref.watch(databaseProvider);
  return (db.select(db.mealGroups)
        ..where((g) => g.isHidden.equals(false) & g.deletedAt.isNull())
        ..orderBy([(g) => OrderingTerm.asc(g.sortOrder)]))
      .watch();
});

String mealGroupName(AppLocalizations l10n, MealGroup g) =>
    switch (g.systemKey) {
      'breakfast' => l10n.mealBreakfast,
      'lunch' => l10n.mealLunch,
      'dinner' => l10n.mealDinner,
      'snack' => l10n.mealSnack,
      _ => g.customName ?? '',
    };

class DiaryScreen extends ConsumerWidget {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final t = context.tokens;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final date = DateFormat.MMMMEEEEd(locale).format(DateTime.now());
    final groups = ref.watch(_mealGroupsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.today),
            Text(
              date,
              style: TextStyle(fontSize: 13, color: t.textSecondary),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: t.accent,
        foregroundColor: t.onAccent,
        elevation: 0,
        onPressed: () => showComingSoon(context, l10n.comingSoon),
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
        children: [
          const _DayTotalCard(total: Nutrients.zero),
          const SizedBox(height: 24),
          ...switch (groups) {
            AsyncData(:final value) => [
              for (final g in value) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    mealGroupName(l10n, g),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Divider(color: t.border),
              ],
              const SizedBox(height: 24),
              EmptyState(icon: Icons.restaurant, message: l10n.emptyDiary),
            ],
            AsyncError(:final error) => [Text('$error')],
            _ => [const Center(child: CircularProgressIndicator())],
          },
        ],
      ),
    );
  }
}

class _DayTotalCard extends StatelessWidget {
  const _DayTotalCard({required this.total});

  final Nutrients total;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final t = context.tokens;
    final fmt = NumberFormat.decimalPattern(
      Localizations.localeOf(context).toLanguageTag(),
    )..maximumFractionDigits = 1;

    Widget macro(String label, double value) => Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${fmt.format(value)} ${l10n.unitGram}',
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          Text(label, style: TextStyle(fontSize: 12, color: t.textSecondary)),
        ],
      ),
    );

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
                  fmt.format(total.kcal.round()),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(width: 6),
                Text(l10n.nutrientKcal, style: TextStyle(color: t.textSecondary)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                macro(l10n.nutrientProtein, total.protein),
                macro(l10n.nutrientFat, total.fat),
                macro(l10n.nutrientCarbs, total.carbs),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
