import 'package:material_ui/material_ui.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/empty_state.dart';

class DishesScreen extends StatelessWidget {
  const DishesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final t = context.tokens;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.navDishes)),
      floatingActionButton: FloatingActionButton(
        backgroundColor: t.accent,
        foregroundColor: t.onAccent,
        elevation: 0,
        onPressed: () => showComingSoon(context, l10n.comingSoon),
        child: const Icon(Icons.add),
      ),
      body: EmptyState(
        icon: Icons.restaurant_outlined,
        message: l10n.emptyDishes,
      ),
    );
  }
}
