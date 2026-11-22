import 'package:drift/drift.dart' show OrderingTerm;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/db/app_database.dart';
import '../../../core/db/database_provider.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/empty_state.dart';

final productsProvider = StreamProvider<List<Product>>((ref) {
  final db = ref.watch(databaseProvider);
  return (db.select(db.products)
        ..where((p) => p.deletedAt.isNull())
        ..orderBy([(p) => OrderingTerm.asc(p.name)]))
      .watch();
});

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final t = context.tokens;
    final products = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.navProducts)),
      floatingActionButton: FloatingActionButton(
        backgroundColor: t.accent,
        foregroundColor: t.onAccent,
        elevation: 0,
        onPressed: () => showComingSoon(context, l10n.comingSoon),
        child: const Icon(Icons.add),
      ),
      body: switch (products) {
        AsyncData(:final value) when value.isEmpty => EmptyState(
          icon: Icons.egg_outlined,
          message: l10n.emptyProducts,
        ),
        AsyncData(:final value) => ListView.separated(
          itemCount: value.length,
          separatorBuilder: (_, _) => const Divider(),
          itemBuilder: (_, i) {
            final p = value[i];
            return ListTile(
              title: Text(p.name),
              subtitle: Text(
                '${p.kcal.round()} ${l10n.nutrientKcal} · '
                '${p.protein} / ${p.fat} / ${p.carbs}',
              ),
            );
          },
        ),
        AsyncError(:final error) => Center(child: Text('$error')),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}
