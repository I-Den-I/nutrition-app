import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/db/app_database.dart';
import '../../../core/db/repositories.dart';
import '../../../core/db/shared_providers.dart';
import '../../../core/domain/dish_calculator.dart';
import '../../../core/domain/formatting.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/media/media_repository.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/labels.dart';
import '../../../core/widgets/media_widgets.dart';
import '../../../core/widgets/nutrients_view.dart';
import '../../products/data/products_repository.dart';
import '../data/dishes_repository.dart';

class _Row {
  _Row(this.product, this.grams);

  final ProductDetails product;
  final TextEditingController grams;
}

/// Create ([dishId] == null) or edit a dish with live calculation.
class DishFormScreen extends ConsumerStatefulWidget {
  const DishFormScreen({super.key, this.dishId});

  final String? dishId;

  @override
  ConsumerState<DishFormScreen> createState() => _DishFormScreenState();
}

class _DishFormScreenState extends ConsumerState<DishFormScreen> {
  final _form = GlobalKey<FormState>();
  late final String _id = widget.dishId ?? newId();
  bool get _isNew => widget.dishId == null;

  final _name = TextEditingController();
  final _description = TextEditingController();
  final _cookedWeight = TextEditingController();
  final _rows = <_Row>[];
  final _groupIds = <String>{};
  bool _loading = true;
  bool _saved = false;
  bool _showItemsError = false;
  late final MediaRepository _media;

  @override
  void initState() {
    super.initState();
    _media = ref.read(mediaRepositoryProvider);
    // After initState: _load reads the locale from context.
    Future.microtask(_load);
  }

  Future<void> _load() async {
    final existing = _isNew
        ? null
        : await ref.read(dishesRepositoryProvider).get(_id);
    if (!mounted) return;
    final loc = localeOf(context);
    if (existing != null) {
      _name.text = existing.dish.name;
      _description.text = existing.dish.description ?? '';
      _cookedWeight.text = formatInput(existing.dish.cookedWeightG, loc);
      for (final i in existing.ingredients) {
        _rows.add(
          _Row(
            i.product,
            TextEditingController(text: formatInput(i.item.grams, loc)),
          ),
        );
      }
      _groupIds.addAll(existing.mealGroupIds);
    }
    setState(() => _loading = false);
  }

  @override
  void dispose() {
    if (_isNew && !_saved) _media.removeAllFor(MediaOwner.dish, _id);
    for (final c in [_name, _description, _cookedWeight]) {
      c.dispose();
    }
    for (final r in _rows) {
      r.grams.dispose();
    }
    super.dispose();
  }

  Future<void> _addIngredient() async {
    final productId = await context.push<String>(Routes.pickProduct);
    if (productId == null) return;
    final product = await ref.read(productsRepositoryProvider).get(productId);
    if (product == null || !mounted) return;
    setState(() {
      _rows.add(_Row(product, TextEditingController()));
      _showItemsError = false;
    });
  }

  DishBreakdown _breakdown() => calculateDish([
    for (final r in _rows)
      DishIngredient(
        per100: r.product.per100,
        grams: parseDecimal(r.grams.text) ?? 0,
      ),
  ], cookedWeightG: parseDecimal(_cookedWeight.text));

  Future<void> _save() async {
    final valid = _form.currentState!.validate();
    if (_rows.isEmpty) setState(() => _showItemsError = true);
    if (!valid || _rows.isEmpty) return;
    await ref
        .read(dishesRepositoryProvider)
        .save(
          DishDraft(
            id: _id,
            name: _name.text,
            description: _description.text,
            cookedWeightG: parseDecimal(_cookedWeight.text),
            items: [
              for (final r in _rows)
                DishItemDraft(
                  productId: r.product.product.id,
                  grams: parseDecimal(r.grams.text)!,
                ),
            ],
            mealGroupIds: _groupIds,
          ),
        );
    _saved = true;
    if (mounted) context.pop(_id);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final t = context.tokens;
    final groups = ref.watch(visibleMealGroupsProvider);
    final tracked = ref.watch(trackedNutrientsProvider);
    final loc = localeOf(context);
    void refresh(String _) => setState(() {});

    if (_loading) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    final b = _breakdown();

    return Scaffold(
      appBar: AppBar(
        title: Text(_isNew ? l10n.dishNew : l10n.dishEdit),
        actions: [
          TextButton(onPressed: _save, child: Text(l10n.actionSave)),
          const SizedBox(width: 8),
        ],
      ),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
          children: [
            ContentWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _name,
                    autofocus: _isNew,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(labelText: l10n.fieldName),
                    validator: (v) =>
                        (v?.trim().isEmpty ?? true) ? l10n.fieldRequired : null,
                  ),
                  SectionLabel(l10n.ingredients),
                  for (final (i, r) in _rows.indexed)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(r.product.product.name),
                                  Text(
                                    nutrientsLine(context, b.contributions[i]),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: t.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 96,
                            child: NumberField(
                              controller: r.grams,
                              label: l10n.unitGram,
                              required: true,
                              autofocus: r.grams.text.isEmpty,
                              onChanged: refresh,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => setState(() {
                              _rows.removeAt(i).grams.dispose();
                            }),
                          ),
                        ],
                      ),
                    ),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                    ),
                    icon: const Icon(Icons.add),
                    label: Text(l10n.addIngredient),
                    onPressed: _addIngredient,
                  ),
                  if (_showItemsError)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        l10n.ingredientsRequired,
                        style: TextStyle(color: t.danger, fontSize: 12),
                      ),
                    ),
                  const SizedBox(height: 20),
                  NumberField(
                    controller: _cookedWeight,
                    label: l10n.cookedWeight,
                    suffix: l10n.unitGram,
                    helper: l10n.cookedWeightHint,
                    onChanged: refresh,
                  ),
                  if (_rows.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    NutrientsPanel(
                      title: l10n.per100g,
                      nutrients: b.per100,
                      extraCodes: tracked,
                    ),
                    const SizedBox(height: 12),
                    NutrientsPanel(
                      title: l10n.wholeDish,
                      trailing:
                          '${formatAmount(b.weightG, loc)} ${l10n.unitGram}',
                      nutrients: b.total,
                      extraCodes: tracked,
                    ),
                  ],
                  if (groups.isNotEmpty) ...[
                    SectionLabel(l10n.dishSuitsFor),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final g in groups)
                          SelectChip(
                            label: l10n.groupLabel(g),
                            selected: _groupIds.contains(g.id),
                            onSelected: (sel) => setState(
                              () => sel
                                  ? _groupIds.add(g.id)
                                  : _groupIds.remove(g.id),
                            ),
                          ),
                      ],
                    ),
                  ],
                  SectionLabel(l10n.photos),
                  PhotoEditor(MediaOwner.dish, _id),
                  SectionLabel(l10n.fieldDescription),
                  TextFormField(
                    controller: _description,
                    minLines: 3,
                    maxLines: 12,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(),
                  ),
                  const SizedBox(height: 32),
                  FilledButton(onPressed: _save, child: Text(l10n.actionSave)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
