import 'package:file_selector/file_selector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/db/repositories.dart';
import '../../../core/fonts/app_fonts.dart';
import '../../../core/fonts/custom_fonts_repository.dart';
import '../../../core/fonts/font_providers.dart';
import '../../../core/fonts/font_validator.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/settings/app_settings.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/form_fields.dart';

const _fontTypes = XTypeGroup(
  label: 'Fonts',
  extensions: ['ttf', 'otf'],
  mimeTypes: ['font/ttf', 'font/otf', 'font/sfnt', 'application/x-font-ttf'],
  uniformTypeIdentifiers: [
    'public.truetype-ttf-font',
    'public.opentype-font',
    'public.font',
  ],
);

/// Pick the app font: bundled ones, the platform font, or a user font.
class FontsScreen extends ConsumerWidget {
  const FontsScreen({super.key});

  Future<void> _add(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final file = await openFile(acceptedTypeGroups: [_fontTypes]);
    if (file == null || !context.mounted) return;

    // Check the size before reading the whole file into memory.
    if (await file.length() > maxFontBytes) {
      if (context.mounted) showMessage(context, l10n.fontTooLarge);
      return;
    }
    try {
      final font = await ref
          .read(customFontsRepositoryProvider)
          .add(await file.readAsBytes(), fileName: file.name);
      await ref.read(settingsProvider.notifier).setFont(customFontId(font.id));
      if (context.mounted) showMessage(context, l10n.fontAdded(font.name));
    } on FontRejected catch (e) {
      if (!context.mounted) return;
      showMessage(context, switch (e.reason) {
        FontCheckError.tooLarge => l10n.fontTooLarge,
        FontCheckError.unsupported => l10n.fontUnsupported,
        FontCheckError.notAFont => l10n.fontNotAFont,
      });
    }
  }

  Future<void> _delete(
    BuildContext context,
    WidgetRef ref,
    String id,
    String name,
  ) async {
    final l10n = context.l10n;
    final ok = await confirmDialog(
      context,
      title: l10n.fontDeleteTitle(name),
      confirmLabel: l10n.actionDelete,
    );
    if (!ok) return;
    final settings = ref.read(settingsProvider.notifier);
    if (ref.read(settingsProvider).fontId == customFontId(id)) {
      await settings.setFont(defaultFontId);
    }
    await ref.read(customFontsRepositoryProvider).delete(id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final t = context.tokens;
    final selected = ref.watch(settingsProvider.select((s) => s.fontId));
    final controller = ref.read(settingsProvider.notifier);
    final custom = ref.watch(customFontsProvider).value ?? const [];

    Widget option({
      required String id,
      required String title,
      required String? family,
      Widget? trailing,
    }) {
      final isSelected = id == selected;
      return ListTile(
        selected: isSelected,
        title: Text(
          title,
          style: TextStyle(
            fontFamily: family,
            fontSize: 17,
            fontWeight: isThinFont(family) ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
        subtitle: Text(
          l10n.fontPreview,
          style: TextStyle(
            fontFamily: family,
            color: t.textSecondary,
            fontWeight: isThinFont(family) ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ?trailing,
            if (isSelected) Icon(Icons.check, color: t.textPrimary),
          ],
        ),
        onTap: () => controller.setFont(id),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsFont)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
        children: [
          ContentWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final (id, family) in bundledFonts)
                  option(id: id, title: family, family: family),
                option(
                  id: systemFontId,
                  title: l10n.fontSystem,
                  family: Theme.of(context)
                      .typography
                      .black
                      .bodyMedium
                      ?.fontFamily,
                ),
                if (custom.isNotEmpty) SectionLabel(l10n.fontCustom),
                for (final f in custom)
                  // Loaded lazily so the preview renders in the font itself.
                  _CustomFontTile(
                    builder: (family) => option(
                      id: customFontId(f.id),
                      title: f.name,
                      family: family,
                      trailing: IconButton(
                        tooltip: l10n.actionDelete,
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () => _delete(context, ref, f.id, f.name),
                      ),
                    ),
                    fontId: f.id,
                  ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                  ),
                  icon: const Icon(Icons.upload_file_outlined),
                  label: Text(l10n.fontAdd),
                  onPressed: () => _add(context, ref),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    l10n.fontAddHint,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: t.textSecondary),
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

final _customFontLoadedProvider = FutureProvider.autoDispose
    .family<bool, String>(
      (ref, id) => ref.read(customFontsRepositoryProvider).load(id),
    );

class _CustomFontTile extends ConsumerWidget {
  const _CustomFontTile({required this.builder, required this.fontId});

  final Widget Function(String? family) builder;
  final String fontId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loaded = ref.watch(_customFontLoadedProvider(fontId)).value ?? false;
    return builder(loaded ? customFontFamily(fontId) : null);
  }
}
