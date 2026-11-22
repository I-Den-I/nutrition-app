import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/db/app_database.dart';
import '../../../core/db/repositories.dart';
import '../../../core/db/shared_providers.dart';
import '../../../core/domain/formatting.dart';
import '../../../core/domain/goals_calculator.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/media/media_repository.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/labels.dart';
import '../../../core/widgets/media_widgets.dart';
import '../../../core/widgets/nutrients_view.dart';
import '../data/products_repository.dart';

/// Create ([productId] == null) or edit a product.
class ProductFormScreen extends ConsumerStatefulWidget {
  const ProductFormScreen({super.key, this.productId});

  final String? productId;

  @override
  ConsumerState<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends ConsumerState<ProductFormScreen> {
  final _form = GlobalKey<FormState>();
  late final String _id = widget.productId ?? newId();
  bool get _isNew => widget.productId == null;

  final _name = TextEditingController();
  final _description = TextEditingController();
  final _kcal = TextEditingController();
  final _protein = TextEditingController();
  final _fat = TextEditingController();
  final _carbs = TextEditingController();
  final _extra = <String, TextEditingController>{};
  Basis _basis = Basis.g;
  bool _loading = true;
  bool _saved = false;
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
        : await ref.read(productsRepositoryProvider).get(_id);
    if (!mounted) return;
    final loc = localeOf(context);
    if (existing != null) {
      final p = existing.product;
      _name.text = p.name;
      _description.text = p.description ?? '';
      _basis = p.basis;
      _kcal.text = formatInput(p.kcal, loc);
      _protein.text = formatInput(p.protein, loc);
      _fat.text = formatInput(p.fat, loc);
      _carbs.text = formatInput(p.carbs, loc);
      for (final e in existing.extra.entries) {
        _extraController(e.key).text = formatInput(e.value, loc);
      }
    }
    setState(() => _loading = false);
  }

  TextEditingController _extraController(String code) =>
      _extra.putIfAbsent(code, TextEditingController.new);

  @override
  void dispose() {
    // A new product that was never saved must not leave photos behind.
    if (_isNew && !_saved) {
      _media.removeAllFor(MediaOwner.product, _id);
    }
    for (final c in [_name, _description, _kcal, _protein, _fat, _carbs]) {
      c.dispose();
    }
    for (final c in _extra.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    if (!_form.currentState!.validate()) return;
    final protein = parseDecimal(_protein.text) ?? 0;
    final fat = parseDecimal(_fat.text) ?? 0;
    final carbs = parseDecimal(_carbs.text) ?? 0;
    final extra = <String, double>{
      for (final MapEntry(key: code, value: c) in _extra.entries)
        code: ?parseDecimal(c.text),
    };
    await ref
        .read(productsRepositoryProvider)
        .save(
          ProductDraft(
            id: _id,
            name: _name.text,
            description: _description.text,
            basis: _basis,
            kcal:
                parseDecimal(_kcal.text) ??
                kcalFromMacros(protein: protein, fat: fat, carbs: carbs),
            protein: protein,
            fat: fat,
            carbs: carbs,
            extra: extra,
          ),
        );
    _saved = true;
    if (mounted) context.pop(_id);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final tracked = ref.watch(trackedNutrientsProvider);
    // Show tracked nutrients plus any the product already has.
    final extraCodes = [
      for (final (code, _) in optionalNutrients)
        if (tracked.contains(code) || _extra[code]?.text.isNotEmpty == true)
          code,
    ];
    final loc = localeOf(context);
    final fromMacros = kcalFromMacros(
      protein: parseDecimal(_protein.text) ?? 0,
      fat: parseDecimal(_fat.text) ?? 0,
      carbs: parseDecimal(_carbs.text) ?? 0,
    );
    void refresh(String _) => setState(() {});
    final unit = l10n.unitGram;

    return Scaffold(
      appBar: AppBar(
        title: Text(_isNew ? l10n.productNew : l10n.productEdit),
        actions: [
          TextButton(onPressed: _save, child: Text(l10n.actionSave)),
          const SizedBox(width: 8),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Form(
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
                          decoration: InputDecoration(
                            labelText: l10n.fieldName,
                          ),
                          validator: (v) => (v?.trim().isEmpty ?? true)
                              ? l10n.fieldRequired
                              : null,
                        ),
                        SectionLabel(l10n.per100(_basis)),
                        NumberField(
                          controller: _kcal,
                          label: l10n.nutrientCalories,
                          suffix: l10n.nutrientKcal,
                          helper: _kcal.text.isEmpty && fromMacros > 0
                              ? l10n.kcalFromMacros(
                                  formatAmount(fromMacros, loc),
                                )
                              : l10n.kcalAutoHint,
                          onChanged: refresh,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: NumberField(
                                controller: _protein,
                                label: l10n.nutrientProtein,
                                suffix: unit,
                                required: true,
                                onChanged: refresh,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: NumberField(
                                controller: _fat,
                                label: l10n.nutrientFat,
                                suffix: unit,
                                required: true,
                                onChanged: refresh,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: NumberField(
                                controller: _carbs,
                                label: l10n.nutrientCarbs,
                                suffix: unit,
                                required: true,
                                onChanged: refresh,
                              ),
                            ),
                          ],
                        ),
                        for (final code in extraCodes) ...[
                          const SizedBox(height: 12),
                          NumberField(
                            controller: _extraController(code),
                            label: l10n.nutrientName(code),
                            suffix: l10n.nutrientUnit(code),
                          ),
                        ],
                        SectionLabel(l10n.basis),
                        SegmentedButton<Basis>(
                          showSelectedIcon: false,
                          selected: {_basis},
                          onSelectionChanged: (s) =>
                              setState(() => _basis = s.first),
                          segments: [
                            ButtonSegment(
                              value: Basis.g,
                              label: Text(l10n.basisG),
                            ),
                            ButtonSegment(
                              value: Basis.ml,
                              label: Text(l10n.basisMl),
                            ),
                          ],
                        ),
                        SectionLabel(l10n.photos),
                        PhotoEditor(MediaOwner.product, _id),
                        SectionLabel(l10n.fieldDescription),
                        TextFormField(
                          controller: _description,
                          minLines: 3,
                          maxLines: 10,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: const InputDecoration(),
                        ),
                        const SizedBox(height: 32),
                        FilledButton(
                          onPressed: _save,
                          child: Text(l10n.actionSave),
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
