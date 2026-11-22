import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/router/routes.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/labels.dart';
import '../../dishes/presentation/dishes_screen.dart';
import '../../products/presentation/products_screen.dart';
import '../../products/presentation/products_providers.dart';
import 'portion_sheet.dart';

enum _Source { products, dishes }

/// Search products or dishes and log portions. Stays open so several
/// items can be added in a row.
class AddEntryScreen extends ConsumerStatefulWidget {
  const AddEntryScreen({super.key, this.mealGroupId});

  final String? mealGroupId;

  @override
  ConsumerState<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends ConsumerState<AddEntryScreen> {
  String _query = '';
  _Source _source = _Source.products;

  Future<void> _log({
    required String name,
    String? productId,
    String? dishId,
    String unit = '',
  }) async {
    final added = await showPortionSheet(
      context,
      name: name,
      productId: productId,
      dishId: dishId,
      mealGroupId: widget.mealGroupId,
      unit: unit,
    );
    if (added && mounted) showMessage(context, context.l10n.addedToDiary(name));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.addToDiary),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(l10n.actionDone),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ContentWidth(
        child: Column(
          children: [
            SearchField(
              autofocus: true,
              onChanged: (q) => setState(() => _query = q),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: SizedBox(
                width: double.infinity,
                child: SegmentedButton<_Source>(
                  showSelectedIcon: false,
                  selected: {_source},
                  onSelectionChanged: (s) => setState(() => _source = s.first),
                  segments: [
                    ButtonSegment(
                      value: _Source.products,
                      label: Text(l10n.navProducts),
                    ),
                    ButtonSegment(
                      value: _Source.dishes,
                      label: Text(l10n.navDishes),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: switch (_source) {
                _Source.products => ProductList(
                  query: _query,
                  onTap: (p) => _log(
                    name: p.name,
                    productId: p.id,
                    unit: l10n.basisUnit(p.basis),
                  ),
                ),
                _Source.dishes => DishList(
                  query: _query,
                  onTap: (d) => _log(name: d.dish.name, dishId: d.dish.id),
                ),
              },
            ),
            if (_source == _Source.products && _query.isNotEmpty)
              _CreateProductButton(
                onCreated: (id) async {
                  final p = await ref.read(productDetailsProvider(id).future);
                  if (p != null) {
                    await _log(
                      name: p.product.name,
                      productId: id,
                      unit: l10n.basisUnit(p.product.basis),
                    );
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _CreateProductButton extends StatelessWidget {
  const _CreateProductButton({required this.onCreated});

  final ValueChanged<String> onCreated;

  @override
  Widget build(BuildContext context) => SafeArea(
    top: false,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
        icon: const Icon(Icons.add),
        label: Text(context.l10n.productNew),
        onPressed: () async {
          final id = await context.push<String>(Routes.productNew);
          if (id != null) onCreated(id);
        },
      ),
    ),
  );
}
