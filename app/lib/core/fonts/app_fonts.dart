/// Fonts bundled with the app (assets/fonts, SIL Open Font License).
/// The id is what settings store; the family is the pubspec family.
const bundledFonts = <(String id, String family)>[
  ('comfortaa', 'Comfortaa'),
  ('nunito', 'Nunito'),
  ('manrope', 'Manrope'),
  ('inter', 'Inter'),
  ('rubik', 'Rubik'),
];

const defaultFontId = 'comfortaa';

/// Platform font (San Francisco, Roboto, Segoe UI…).
const systemFontId = 'system';

/// Settings value for a user-added font.
String customFontId(String rowId) => 'custom:$rowId';

/// Engine family name for a user-added font. Only our own UUID goes in,
/// never anything from the file.
String customFontFamily(String rowId) => 'custom-$rowId';

/// Font family for [ThemeData], or null for the platform font.
/// Unknown ids fall back to the default font.
String? fontFamilyFor(String id) {
  if (id == systemFontId) return null;
  if (id.startsWith('custom:')) return customFontFamily(id.substring(7));
  for (final (bundledId, family) in bundledFonts) {
    if (bundledId == id) return family;
  }
  return bundledFonts.first.$2;
}
