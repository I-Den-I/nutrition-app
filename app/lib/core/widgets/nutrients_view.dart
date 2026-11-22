import 'package:material_ui/material_ui.dart';

import '../domain/formatting.dart';
import '../domain/nutrients.dart';
import '../l10n/l10n.dart';
import '../theme/app_tokens.dart';
import 'labels.dart';

String localeOf(BuildContext context) =>
    Localizations.localeOf(context).toLanguageTag();

/// "120 kcal · P 7 · F 0,6 · C 26" — compact one-liner for list rows.
String nutrientsLine(BuildContext context, Nutrients n) {
  final l10n = context.l10n;
  final loc = localeOf(context);
  String f(double v) => formatAmount(v, loc);
  final p = l10n.nutrientProtein.characters.first;
  final fa = l10n.nutrientFat.characters.first;
  final c = l10n.nutrientCarbs.characters.first;
  return '${f(n.kcal)} ${l10n.nutrientKcal} · '
      '$p ${f(n.protein)} · $fa ${f(n.fat)} · $c ${f(n.carbs)}';
}

/// Big calories number plus protein / fat / carbs columns, and optionally
/// the tracked extra nutrients.
class NutrientsPanel extends StatelessWidget {
  const NutrientsPanel({
    super.key,
    required this.nutrients,
    this.title,
    this.trailing,
    this.extraCodes = const [],
  });

  final Nutrients nutrients;
  final String? title;
  final String? trailing;
  final List<String> extraCodes;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final t = context.tokens;
    final loc = localeOf(context);

    Widget macro(String label, double value, String unit) => Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${formatAmount(value, loc)} $unit',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: t.textSecondary),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );

    final extras = [
      for (final code in extraCodes)
        if (nutrients.extra[code] != null)
          '${l10n.nutrientName(code)} '
              '${formatAmount(nutrients.extra[code]!, loc)} '
              '${l10n.nutrientUnit(code)}',
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title!,
                        style: TextStyle(fontSize: 13, color: t.textSecondary),
                      ),
                    ),
                    if (trailing != null)
                      Text(
                        trailing!,
                        style: TextStyle(fontSize: 13, color: t.textSecondary),
                      ),
                  ],
                ),
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  formatAmount(nutrients.kcal, loc),
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  l10n.nutrientKcal,
                  style: TextStyle(color: t.textSecondary),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                macro(l10n.nutrientProtein, nutrients.protein, l10n.unitGram),
                macro(l10n.nutrientFat, nutrients.fat, l10n.unitGram),
                macro(l10n.nutrientCarbs, nutrients.carbs, l10n.unitGram),
              ],
            ),
            if (extras.isNotEmpty) ...[
              const SizedBox(height: 10),
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
