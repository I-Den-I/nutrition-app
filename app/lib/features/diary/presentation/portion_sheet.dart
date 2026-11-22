import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/db/app_database.dart';
import '../../../core/db/repositories.dart';
import '../../../core/db/shared_providers.dart';
import '../../../core/domain/formatting.dart';
import '../../../core/domain/nutrients.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/labels.dart';
import '../../../core/widgets/nutrients_view.dart';
import 'diary_providers.dart';

/// Bottom sheet to log a portion of a product/dish, or to edit an
/// existing diary [entry]. Returns true when something was saved.
Future<bool> showPortionSheet(
  BuildContext context, {
  required String name,
  String? productId,
  String? dishId,
  DiaryEntry? entry,
  String? mealGroupId,
  String unit = '',
}) async {
  final saved = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    useSafeArea: true,
    builder: (_) => _PortionSheet(
      name: name,
      productId: productId ?? entry?.productId,
      dishId: dishId ?? entry?.dishId,
      entry: entry,
      initialGroupId: mealGroupId,
      unit: unit,
    ),
  );
  return saved ?? false;
}

final _per100Provider = FutureProvider.autoDispose
    .family<Nutrients?, (String?, String?)>(
      (ref, ids) => ref
          .watch(diaryRepositoryProvider)
          .per100(productId: ids.$1, dishId: ids.$2),
    );

class _PortionSheet extends ConsumerStatefulWidget {
  const _PortionSheet({
    required this.name,
    required this.productId,
    required this.dishId,
    required this.entry,
    required this.initialGroupId,
    required this.unit,
  });

  final String name;
  final String? productId;
  final String? dishId;
  final DiaryEntry? entry;
  final String? initialGroupId;
  final String unit;

  @override
  ConsumerState<_PortionSheet> createState() => _PortionSheetState();
}

class _PortionSheetState extends ConsumerState<_PortionSheet> {
  final _form = GlobalKey<FormState>();
  final _grams = TextEditingController();
  String? _groupId;
  bool _groupChosen = false;

  @override
  void initState() {
    super.initState();
    final e = widget.entry;
    if (e != null) {
      _groupId = e.mealGroupId;
      _groupChosen = true;
    } else if (widget.initialGroupId != null) {
      _groupId = widget.initialGroupId;
      _groupChosen = true;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final e = widget.entry;
    if (e != null && _grams.text.isEmpty) {
      _grams.text = formatInput(e.grams, localeOf(context));
      // Select the old value so typing replaces it.
      _grams.selection = TextSelection(
        baseOffset: 0,
        extentOffset: _grams.text.length,
      );
    }
  }

  @override
  void dispose() {
    _grams.dispose();
    super.dispose();
  }

  /// Pre-selects a group by time of day when adding without one.
  String? _guessGroup(List<MealGroup> groups) {
    final h = DateTime.now().hour;
    final key = h < 11
        ? 'breakfast'
        : h < 16
        ? 'lunch'
        : h < 21
        ? 'dinner'
        : 'snack';
    return groups.where((g) => g.systemKey == key).firstOrNull?.id;
  }

  Future<void> _save() async {
    if (!_form.currentState!.validate()) return;
    final grams = parseDecimal(_grams.text)!;
    final repo = ref.read(diaryRepositoryProvider);
    final e = widget.entry;
    if (e == null) {
      await repo.add(
        day: ref.read(selectedDayKeyProvider),
        productId: widget.productId,
        dishId: widget.dishId,
        grams: grams,
        mealGroupId: _groupId,
      );
    } else {
      await repo.update(e, grams: grams, mealGroupId: _groupId);
    }
    if (mounted) Navigator.pop(context, true);
  }

  Future<void> _delete() async {
    await ref.read(diaryRepositoryProvider).delete(widget.entry!.id);
    if (mounted) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final t = context.tokens;
    final groups = ref.watch(visibleMealGroupsProvider);
    if (!_groupChosen && groups.isNotEmpty) {
      _groupId = _guessGroup(groups);
      _groupChosen = true;
    }
    final per100 = ref
        .watch(_per100Provider((widget.productId, widget.dishId)))
        .value;
    final grams = parseDecimal(_grams.text) ?? 0;
    final e = widget.entry;
    // When editing, rescale the stored snapshot so the preview matches
    // what will be saved.
    final preview = e != null
        ? Nutrients(
            kcal: e.snapshotKcal,
            protein: e.snapshotProtein,
            fat: e.snapshotFat,
            carbs: e.snapshotCarbs,
          ).scale(e.grams > 0 ? grams / e.grams : 0)
        : per100?.portion(grams);
    final unit = widget.unit.isEmpty ? l10n.unitGram : widget.unit;

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 16,
      ),
      child: Form(
        key: _form,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(widget.name, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            NumberField(
              controller: _grams,
              label: l10n.grams,
              suffix: unit,
              required: true,
              autofocus: true,
              textInputAction: TextInputAction.done,
              onChanged: (_) => setState(() {}),
              onSubmitted: (_) => _save(),
            ),
            const SizedBox(height: 12),
            if (preview != null)
              Text(
                nutrientsLine(context, preview),
                style: TextStyle(color: t.textSecondary),
              ),
            if (groups.isNotEmpty) ...[
              SectionLabel(l10n.mealGroup),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final g in groups)
                    SelectChip(
                      label: l10n.groupLabel(g),
                      selected: _groupId == g.id,
                      onSelected: (sel) =>
                          setState(() => _groupId = sel ? g.id : null),
                    ),
                ],
              ),
            ],
            const SizedBox(height: 24),
            Row(
              children: [
                if (e != null) ...[
                  IconButton(
                    tooltip: l10n.actionDelete,
                    onPressed: _delete,
                    icon: const Icon(Icons.delete_outline),
                  ),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: FilledButton(
                    onPressed: _save,
                    child: Text(e == null ? l10n.actionAdd : l10n.actionSave),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
