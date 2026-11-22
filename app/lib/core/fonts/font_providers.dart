import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../db/app_database.dart';
import '../db/repositories.dart';
import '../settings/app_settings.dart';
import 'app_fonts.dart';

final customFontsProvider = StreamProvider<List<CustomFont>>(
  (ref) => ref.watch(customFontsRepositoryProvider).watchAll(),
);

/// Theme font family for the chosen font. A user font is registered with
/// the engine first; if that fails (file gone or invalid) the default
/// font is used.
final activeFontFamilyProvider = FutureProvider<String?>((ref) async {
  final id = ref.watch(settingsProvider.select((s) => s.fontId));
  if (id.startsWith('custom:')) {
    final ok = await ref
        .read(customFontsRepositoryProvider)
        .load(id.substring(7));
    if (!ok) return fontFamilyFor(defaultFontId);
  }
  return fontFamilyFor(id);
});
