import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/db/app_database.dart';
import '../../../core/db/repositories.dart';
import '../../../core/db/shared_providers.dart';
import '../../../core/domain/formatting.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/labels.dart';
import '../../../core/widgets/nutrients_view.dart';

/// Body data form. In onboarding it leads to the goals step; from settings
/// it saves and goes back.
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key, this.onboarding = false});

  final bool onboarding;

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _form = GlobalKey<FormState>();
  final _height = TextEditingController();
  final _weight = TextEditingController();
  Sex? _sex;
  DateTime? _birthDate;
  ActivityLevel _activity = ActivityLevel.moderate;
  WeightGoal _goal = WeightGoal.maintain;
  bool _loaded = false;
  bool _showErrors = false;

  @override
  void dispose() {
    _height.dispose();
    _weight.dispose();
    super.dispose();
  }

  void _fill(BuildContext context) {
    final data = ref.read(profileProvider).value;
    if (_loaded || data == null) return;
    _loaded = true;
    final p = data.profile;
    final loc = localeOf(context);
    _sex = p.sex;
    _birthDate = p.birthDate;
    _activity = p.activityLevel ?? _activity;
    _goal = p.weightGoal ?? _goal;
    _height.text = formatInput(p.heightCm, loc);
    _weight.text = formatInput(data.weightKg, loc);
  }

  Future<void> _pickBirthDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime(now.year - 30),
      firstDate: DateTime(1900),
      lastDate: now,
      initialEntryMode: DatePickerEntryMode.input,
    );
    if (picked != null) setState(() => _birthDate = picked);
  }

  Future<void> _save() async {
    setState(() => _showErrors = true);
    final valid = _form.currentState!.validate();
    if (!valid || _sex == null || _birthDate == null) return;
    final repo = ref.read(profileRepositoryProvider);
    await repo.saveBody(
      sex: _sex!,
      birthDate: _birthDate!,
      heightCm: parseDecimal(_height.text)!,
      weightKg: parseDecimal(_weight.text)!,
      activity: _activity,
      goal: _goal,
    );
    await repo.refreshAutoGoals();
    if (!mounted) return;
    if (widget.onboarding) {
      context.go(Routes.onboardingGoals);
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final t = context.tokens;
    ref.watch(profileProvider);
    _fill(context);
    final loc = localeOf(context);

    Widget error(bool show) => show && _showErrors
        ? Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              l10n.fieldRequired,
              style: TextStyle(color: t.danger, fontSize: 12),
            ),
          )
        : const SizedBox.shrink();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.onboarding ? l10n.profileTitle : l10n.settingsProfile,
        ),
        actions: [
          if (widget.onboarding)
            TextButton(
              onPressed: () => context.go(Routes.onboardingGoals),
              child: Text(l10n.actionSkip),
            ),
        ],
      ),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
          children: [
            ContentWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (widget.onboarding)
                    Text(
                      l10n.profileHint,
                      style: TextStyle(color: t.textSecondary),
                    ),
                  SectionLabel(l10n.sex),
                  SegmentedButton<Sex>(
                    showSelectedIcon: false,
                    emptySelectionAllowed: true,
                    selected: {?_sex},
                    onSelectionChanged: (s) =>
                        setState(() => _sex = s.firstOrNull),
                    segments: [
                      for (final s in Sex.values)
                        ButtonSegment(value: s, label: Text(l10n.sexName(s))),
                    ],
                  ),
                  error(_sex == null),
                  SectionLabel(l10n.birthDate),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(52),
                      alignment: Alignment.centerLeft,
                      foregroundColor: t.textPrimary,
                      side: BorderSide(color: t.border),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _pickBirthDate,
                    child: Text(
                      _birthDate == null
                          ? l10n.notSet
                          : DateFormat.yMMMMd(loc).format(_birthDate!),
                    ),
                  ),
                  error(_birthDate == null),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: NumberField(
                          controller: _height,
                          label: l10n.heightCm,
                          required: true,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: NumberField(
                          controller: _weight,
                          label: l10n.weightKg,
                          required: true,
                        ),
                      ),
                    ],
                  ),
                  SectionLabel(l10n.activity),
                  for (final a in ActivityLevel.values)
                    ListTile(
                      dense: true,
                      title: Text(l10n.activityName(a)),
                      subtitle: Text(l10n.activityHint(a)),
                      selected: a == _activity,
                      trailing: a == _activity ? const Icon(Icons.check) : null,
                      onTap: () => setState(() => _activity = a),
                    ),
                  SectionLabel(l10n.weightGoal),
                  SegmentedButton<WeightGoal>(
                    showSelectedIcon: false,
                    selected: {_goal},
                    onSelectionChanged: (s) => setState(() => _goal = s.first),
                    segments: [
                      for (final g in WeightGoal.values)
                        ButtonSegment(
                          value: g,
                          // Long words ("Підтримувати") must shrink, not wrap.
                          label: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(l10n.goalName(g), maxLines: 1),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  FilledButton(
                    onPressed: _save,
                    child: Text(
                      widget.onboarding ? l10n.actionContinue : l10n.actionSave,
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
