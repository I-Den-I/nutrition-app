import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/db/app_database.dart';
import '../../../core/db/repositories.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/media_widgets.dart';
import '../../../core/widgets/nutrients_view.dart';
import '../../products/presentation/products_screen.dart';
import '../data/dishes_repository.dart';

final dishesSearchProvider = StreamProvider.autoDispose
    .family<List<DishDetails>, String>(
      (ref, query) =>
          ref.watch(dishesRepositoryProvider).watchAll(query: query),
    );

final dishDetailsProvider = StreamProvider.autoDispose
    .family<DishDetails?, String>(
      (ref, id) => ref.watch(dishesRepositoryProvider).watch(id),
    );

class DishesScreen extends StatefulWidget {
  const DishesScreen({super.key});

  @override
  State<DishesScreen> createState() => _DishesScreenState();
}

class _DishesScreenState extends State<DishesScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final t = context.tokens;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.navDishes)),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        backgroundColor: t.accent,
        foregroundColor: t.onAccent,
        elevation: 0,
        tooltip: l10n.dishNew,
        onPressed: () => context.push(Routes.dishNew),
        child: const Icon(Icons.add),
      ),
      body: ContentWidth(
        child: Column(
          children: [
            SearchField(onChanged: (q) => setState(() => _query = q)),
            Expanded(
              child: DishList(
                query: _query,
                onTap: (d) => context.push(Routes.dish(d.dish.id)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Searchable list of dishes with calories per 100 g.
class DishList extends ConsumerWidget {
  const DishList({super.key, required this.query, required this.onTap});

  final String query;
  final ValueChanged<DishDetails> onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final dishes = ref.watch(dishesSearchProvider(query));
    return switch (dishes) {
      AsyncData(:final value) when value.isEmpty => EmptyState(
        icon: Icons.restaurant_outlined,
        message: query.isEmpty ? l10n.emptyDishes : l10n.nothingFound,
      ),
      AsyncData(:final value) => ListView.separated(
        padding: const EdgeInsets.only(bottom: 96),
        itemCount: value.length,
        separatorBuilder: (_, _) => const Divider(indent: 16, endIndent: 16),
        itemBuilder: (context, i) {
          final d = value[i];
          return ListTile(
            leading: FirstPhotoThumb(MediaOwner.dish, d.dish.id),
            title: Text(d.dish.name),
            subtitle: Text(
              '${l10n.per100g}: ${nutrientsLine(context, d.breakdown.per100)}',
            ),
            onTap: () => onTap(d),
          );
        },
      ),
      AsyncError(:final error) => Center(child: Text('$error')),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
