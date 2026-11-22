import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/router/routes.dart';
import '../../../core/widgets/form_fields.dart';
import 'products_screen.dart';

/// Pick a product (e.g. a dish ingredient). Pops with the product id.
class ProductPickerScreen extends StatefulWidget {
  const ProductPickerScreen({super.key});

  @override
  State<ProductPickerScreen> createState() => _ProductPickerScreenState();
}

class _ProductPickerScreenState extends State<ProductPickerScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.chooseProduct),
        actions: [
          IconButton(
            tooltip: l10n.productNew,
            icon: const Icon(Icons.add),
            onPressed: () async {
              final id = await context.push<String>(Routes.productNew);
              if (id != null && context.mounted) context.pop(id);
            },
          ),
        ],
      ),
      body: ContentWidth(
        child: Column(
          children: [
            SearchField(
              autofocus: true,
              onChanged: (q) => setState(() => _query = q),
            ),
            Expanded(
              child: ProductList(
                query: _query,
                onTap: (p) => context.pop(p.id),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
