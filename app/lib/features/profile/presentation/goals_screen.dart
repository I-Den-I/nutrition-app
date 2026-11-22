import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/db/app_database.dart';
import '../../../core/db/repositories.dart';
import '../../../core/db/shared_providers.dart';
import '../../../core/domain/formatting.dart';
import '../../../core/domain/goals_calculator.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/settings/app_settings.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/nutrients_view.dart';

/// Daily calorie and macro goals: calculated from the profile (auto) or
/// typed in (manual).
class GoalsScreen extends ConsumerStatefulWidget {
  const GoalsScreen({super.key, this.onboarding = false});

  final bool onboarding;

  @override
  ConsumerState<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends ConsumerState<GoalsScreen> {
  final _form = GlobalKey<FormState>();
  final _kcal = TextEditingController();
  final _protein = TextEditingController();
  final _fat = TextEditingController();
  final _carbs = TextEditingController();
  GoalMode _mode = GoalMode.auto;
  bool _loaded = false;

  @override
  void dispose() {
    for (final c in [_kcal, _protein, _fat, _carbs]) {
      c.dispose();
    }
    super.dispose();
  }

  void _fill(BuildContext context) {
    final data = ref.read(profileProvider).value;
    if (_loaded || data == null) return;
    _loaded = true;
    final g = data.goals;
    final loc = localeOf(context);
    _mode = g.kcal == null ? GoalMode.manual : g.mode;
    _kcal.text = formatInput(g.kcal, loc);
    _protein.text = formatInput(g.protein, loc);
    _fat.text = formatInput(g.fat, loc);
    _carbs.text = formatInput(g.carbs, loc);
  }

  void _recalculate(BodyData body) {
    final g = calculateGoals(body);
    final loc = localeOf(context);
    setState(() {
      _mode = GoalMode.auto;
      _kcal.text = formatInput(g.kcal, loc);
      _protein.text = formatInput(g.protein, loc);
      _fat.text = formatInput(g.fat, loc);
      _carbs.text = formatInput(g.carbs, loc);
    });
  }

  Future<void> _save() async {
    if (!_form.currentState!.validate()) return;
    final values = [
      _kcal,
      _protein,
      _fat,
      _carbs,
    ].map((c) => parseDecimal(c.text)).toList();
    final allEmpty = values.every((v) => v == null);
    if (!allEmpty) {
      final protein = values[1] ?? 0;
      final fat = values[2] ?? 0;
      final carbs = values[3] ?? 0;
      await ref
          .read(profileRepositoryProvider)
          .saveGoals(
            mode: _mode,
            kcal:
                values[0] ??
                kcalFromMacros(protein: protein, fat: fat, carbs: carbs),
            protein: protein,
            fat: fat,
            carbs: carbs,
          );
    }
    if (!mounted) return;
    if (widget.onboarding) {
      await ref.read(settingsProvider.notifier).completeOnboarding();
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final t = context.tokens;
    final data = ref.watch(profileProvider).value;
    _fill(context);
    final body = data?.bodyData(DateTime.now());
    final loc = localeOf(context);

    final fromMacros = kcalFromMacros(
      protein: parseDecimal(_protein.text) ?? 0,
      fat: parseDecimal(_fat.text) ?? 0,
      carbs: parseDecimal(_carbs.text) ?? 0,
    );

    void edited(String _) => setState(() => _mode = GoalMode.manual);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.goalsTitle)),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
          children: [
            ContentWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    _mode == GoalMode.auto
                        ? l10n.goalsAutoHint
                        : l10n.goalsManualHint,
                    style: TextStyle(color: t.textSecondary),
                  ),
                  const SizedBox(height: 20),
                  NumberField(
                    controller: _kcal,
                    label: l10n.nutrientCalories,
                    suffix: l10n.nutrientKcal,
                    onChanged: edited,
                    helper: fromMacros > 0
                        ? l10n.kcalFromMacros(formatAmount(fromMacros, loc))
                        : null,
                  ),
                  const SizedBox(height: 12),
                  NumberField(
                    controller: _protein,
                    label: l10n.nutrientProtein,
                    suffix: l10n.unitGram,
                    onChanged: edited,
                  ),
                  const SizedBox(height: 12),
                  NumberField(
                    controller: _fat,
                    label: l10n.nutrientFat,
                    suffix: l10n.unitGram,
                    onChanged: edited,
                  ),
                  const SizedBox(height: 12),
                  NumberField(
                    controller: _carbs,
                    label: l10n.nutrientCarbs,
                    suffix: l10n.unitGram,
                    onChanged: edited,
                    textInputAction: TextInputAction.done,
                  ),
                  if (body != null) ...[
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: () => _recalculate(body),
                        icon: const Icon(Icons.refresh, size: 18),
                        label: Text(l10n.goalsRecalculate),
                      ),
                    ),
                  ],
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: _save,
                    child: Text(
                      widget.onboarding ? l10n.actionFinish : l10n.actionSave,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
