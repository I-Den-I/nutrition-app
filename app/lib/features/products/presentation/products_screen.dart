import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/db/app_database.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/media_widgets.dart';
import '../../../core/widgets/nutrients_view.dart';
import '../data/products_repository.dart';
import 'products_providers.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final t = context.tokens;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.navProducts)),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        backgroundColor: t.accent,
        foregroundColor: t.onAccent,
        elevation: 0,
        tooltip: l10n.productNew,
        onPressed: () => context.push(Routes.productNew),
        child: const Icon(Icons.add),
      ),
      body: ContentWidth(
        child: Column(
          children: [
            SearchField(onChanged: (q) => setState(() => _query = q)),
            Expanded(
              child: ProductList(
                query: _query,
                onTap: (p) => context.push(Routes.product(p.id)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.onChanged,
    this.autofocus = false,
  });

  final ValueChanged<String> onChanged;
  final bool autofocus;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
    child: TextField(
      autofocus: autofocus,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: context.l10n.search,
        prefixIcon: const Icon(Icons.search),
        isDense: true,
      ),
    ),
  );
}

/// Searchable list of products; used on the Products tab and in pickers.
class ProductList extends ConsumerWidget {
  const ProductList({super.key, required this.query, required this.onTap});

  final String query;
  final ValueChanged<Product> onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final products = ref.watch(productsSearchProvider(query));
    return switch (products) {
      AsyncData(:final value) when value.isEmpty => EmptyState(
        icon: Icons.egg_outlined,
        message: query.isEmpty ? l10n.emptyProducts : l10n.nothingFound,
      ),
      AsyncData(:final value) => ListView.separated(
        padding: const EdgeInsets.only(bottom: 96),
        itemCount: value.length,
        separatorBuilder: (_, _) => const Divider(indent: 16, endIndent: 16),
        itemBuilder: (context, i) {
          final p = value[i];
          return ListTile(
            leading: FirstPhotoThumb(MediaOwner.product, p.id),
            title: Text(p.name),
            subtitle: Text(
              nutrientsLine(context, ProductDetails(p, const {}).per100),
            ),
            onTap: () => onTap(p),
          );
        },
      ),
      AsyncError(:final error) => Center(child: Text('$error')),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
