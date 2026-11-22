import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/db/app_database.dart';
import '../../../core/db/repositories.dart';
import '../../../core/db/shared_providers.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/labels.dart';

/// Show/hide built-in meal groups, add/rename/delete custom ones.
class MealGroupsScreen extends ConsumerWidget {
  const MealGroupsScreen({super.key});

  Future<String?> _askName(BuildContext context, {String initial = ''}) {
    final l10n = context.l10n;
    final controller = TextEditingController(text: initial);
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.mealGroupName),
        content: TextField(
          controller: controller,
          autofocus: true,
          textCapitalization: TextCapitalization.sentences,
          onSubmitted: (v) => Navigator.pop(context, v),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.actionCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: Text(l10n.actionSave),
          ),
        ],
      ),
    ).whenComplete(controller.dispose);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final t = context.tokens;
    final groups = ref.watch(mealGroupsProvider).value ?? const <MealGroup>[];
    final repo = ref.read(mealGroupsRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsMealGroups),
        actions: [
          IconButton(
            tooltip: l10n.mealGroupAdd,
            icon: const Icon(Icons.add),
            onPressed: () async {
              final name = await _askName(context);
              if (name != null && name.trim().isNotEmpty) {
                await repo.addCustom(name);
              }
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ContentWidth(
            child: Column(
              children: [
                for (final g in groups)
                  ListTile(
                    title: Text(
                      l10n.groupLabel(g),
                      style: TextStyle(
                        color: g.isHidden ? t.textSecondary : t.textPrimary,
                      ),
                    ),
                    onTap: g.systemKey != null
                        ? null
                        : () async {
                            final name = await _askName(
                              context,
                              initial: g.customName ?? '',
                            );
                            if (name != null && name.trim().isNotEmpty) {
                              await repo.rename(g.id, name);
                            }
                          },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (g.systemKey == null)
                          IconButton(
                            tooltip: l10n.actionDelete,
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () async {
                              final ok = await confirmDialog(
                                context,
                                title: '${l10n.actionDelete}: ${g.customName}?',
                                confirmLabel: l10n.actionDelete,
                              );
                              if (ok) await repo.delete(g.id);
                            },
                          ),
                        Switch(
                          value: !g.isHidden,
                          onChanged: (on) => repo.setHidden(g.id, hidden: !on),
                        ),
                      ],
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
