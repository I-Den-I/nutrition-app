import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/db/app_database.dart';
import '../../../core/db/repositories.dart';
import '../../../core/db/shared_providers.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/labels.dart';
import '../../../core/widgets/media_widgets.dart';
import '../../../core/widgets/nutrients_view.dart';
import '../../diary/presentation/portion_sheet.dart';
import 'products_providers.dart';

/// Product card: photos, nutrients per 100 g, description.
class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key, required this.productId});

  final String productId;

  Future<void> _delete(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final ok = await confirmDialog(
      context,
      title: l10n.deleteProductTitle,
      body: l10n.deleteProductBody,
      confirmLabel: l10n.actionDelete,
    );
    if (!ok || !context.mounted) return;
    await ref.read(productsRepositoryProvider).delete(productId);
    if (context.mounted) context.pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final t = context.tokens;
    final details = ref.watch(productDetailsProvider(productId)).value;
    final tracked = ref.watch(trackedNutrientsProvider);

    if (details == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    final p = details.product;
    final extraCodes = [
      for (final (code, _) in optionalNutrients)
        if (tracked.contains(code) || details.extra.containsKey(code)) code,
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: l10n.actionEdit,
            icon: const Icon(Icons.edit_outlined),
            onPressed: () => context.push(Routes.productEdit(productId)),
          ),
          IconButton(
            tooltip: l10n.actionDelete,
            icon: const Icon(Icons.delete_outline),
            onPressed: () => _delete(context, ref),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
        children: [
          ContentWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(p.name, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 16),
                PhotoGallery(MediaOwner.product, productId),
                NutrientsPanel(
                  title: l10n.per100(p.basis),
                  nutrients: details.per100,
                  extraCodes: extraCodes,
                ),
                if (p.description != null) ...[
                  const SizedBox(height: 20),
                  Text(p.description!, style: TextStyle(color: t.textPrimary)),
                ],
                const SizedBox(height: 24),
                if (p.deletedAt == null)
                  FilledButton.icon(
                    icon: const Icon(Icons.add),
                    label: Text(l10n.addToDiary),
                    onPressed: () => showPortionSheet(
                      context,
                      name: p.name,
                      productId: p.id,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
