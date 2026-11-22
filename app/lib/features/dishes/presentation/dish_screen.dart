import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
import '../../../core/widgets/media_widgets.dart';
import '../../../core/widgets/nutrients_view.dart';
import '../../diary/presentation/portion_sheet.dart';
import 'dishes_screen.dart';

/// Dish card: photos, totals (whole / per 100 g), each ingredient's share,
/// meal groups and description.
class DishScreen extends ConsumerWidget {
  const DishScreen({super.key, required this.dishId});

  final String dishId;

  Future<void> _delete(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final ok = await confirmDialog(
      context,
      title: l10n.deleteDishTitle,
      body: l10n.deleteDishBody,
      confirmLabel: l10n.actionDelete,
    );
    if (!ok || !context.mounted) return;
    await ref.read(dishesRepositoryProvider).delete(dishId);
    if (context.mounted) context.pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final t = context.tokens;
    final details = ref.watch(dishDetailsProvider(dishId)).value;
    final tracked = ref.watch(trackedNutrientsProvider);
    final groups = ref.watch(mealGroupsProvider).value ?? const [];
    final loc = localeOf(context);

    if (details == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    final dish = details.dish;
    final b = details.breakdown;
    final suits = [
      for (final g in groups)
        if (details.mealGroupIds.contains(g.id)) l10n.groupLabel(g),
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: l10n.actionEdit,
            icon: const Icon(Icons.edit_outlined),
            onPressed: () => context.push(Routes.dishEdit(dishId)),
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
                Text(
                  dish.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                if (suits.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    '${l10n.dishSuitsFor}: ${suits.join(', ')}',
                    style: TextStyle(color: t.textSecondary),
                  ),
                ],
                const SizedBox(height: 16),
                PhotoGallery(MediaOwner.dish, dishId),
                NutrientsPanel(
                  title: l10n.per100g,
                  nutrients: b.per100,
                  extraCodes: tracked,
                ),
                const SizedBox(height: 12),
                NutrientsPanel(
                  title: l10n.wholeDish,
                  trailing: '${formatAmount(b.weightG, loc)} ${l10n.unitGram}',
                  nutrients: b.total,
                  extraCodes: tracked,
                ),
                SectionLabel(l10n.ingredients),
                for (final (i, ing) in details.ingredients.indexed) ...[
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: Text(
                      ing.product.product.name,
                      style: const TextStyle(fontSize: 15),
                    ),
                    subtitle: Text(nutrientsLine(context, b.contributions[i])),
                    trailing: Text(
                      '${formatAmount(ing.item.grams, loc)} ${l10n.unitGram}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    onTap: () =>
                        context.push(Routes.product(ing.product.product.id)),
                  ),
                  const Divider(),
                ],
                if (dish.description != null) ...[
                  const SizedBox(height: 20),
                  Text(dish.description!),
                ],
                const SizedBox(height: 24),
                if (dish.deletedAt == null)
                  FilledButton.icon(
                    icon: const Icon(Icons.add),
                    label: Text(l10n.addToDiary),
                    onPressed: () => showPortionSheet(
                      context,
                      name: dish.name,
                      dishId: dish.id,
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
