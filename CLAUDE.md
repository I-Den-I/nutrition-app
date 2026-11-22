# Nutrition app

Cross-platform calorie and macro tracker. Architecture and product decisions: `docs/ARCHITECTURE.md` — read it before larger changes and keep it updated.

Open source (AGPL-3.0). The app is free; only access to the official hosted servers is paid. Anyone must be able to fork and connect their own backend.

The owner is not a programmer: talk to them in Ukrainian, in plain words. Code, comments, docs, commits and PRs are in English.

## Layout

- `app/` — Flutter client (iOS, Android, macOS, Windows, Web/Telegram).
- `docs/` — architecture.

## Commands (run in `app/`)

- `flutter test` — unit tests (domain formulas, database, migrations).
- `flutter test integration_test -d macos` (or `-d <simulator id>`) — end-to-end UI flow on a real device with the real database. Widget tests with drift + fake async hang; put UI flows here instead.
- `flutter analyze` — must stay clean.
- `dart run build_runner build` — after changing drift tables (`lib/core/db/tables.dart`).
- `flutter gen-l10n` — after changing ARB files (also runs automatically on build).
- `flutter build web` → `app/build/web` (needs `sqlite3.wasm` + `drift_worker.js` already in `app/web/`).
- UI checks in Claude's built-in browser pane: its shared workers cannot fetch, so the persistent web database hangs there. Build with `--dart-define=IN_MEMORY_DB=true` (e.g. `--output build/web-demo`) and serve that folder instead.

## Conventions

- Material comes from `package:material_ui/material_ui.dart`; `package:flutter/material.dart` is deprecated in this Flutter version — do not import it.
- No hard-coded colors in widgets: use `context.tokens` (`core/theme/app_tokens.dart`) or the theme's `ColorScheme`.
- No hard-coded UI strings: add keys to all four ARB files in `lib/core/l10n/arb/` (en, uk, ru, de) and use `context.l10n`.
- Nutrition math lives in `lib/core/domain/` as pure Dart with tests; screens never compute macros themselves.
- Every syncable table uses the `SyncColumns` mixin (UUID v7 id, timestamps, soft delete). Never hard-delete user data; set `deletedAt`.
- Gate cloud features through `ref.watch(entitlementsProvider).can(CloudFeature.x)`; never hard-code a paywall in the client. The server decides what is granted.
- Server URLs and keys come only from `BackendConfig` (`--dart-define-from-file`), never hard-coded. No secrets in the client or the repo.
- Feature code goes under `lib/features/<feature>/{data,domain,presentation}`.
- Generated files (`*.g.dart`, `lib/core/l10n/gen/`) are committed.
- Schema change → bump `schemaVersion`, add an `onUpgrade` step, extend `test/db/migration_test.dart`.
- iOS number pads have no "Done" key: the app-level tap/scroll handler in `app.dart` closes the keyboard; keep it.
- Component themes in `app_theme.dart` must use plain `TextStyle`s that carry `fontFamily` (copy from the text theme). A `WidgetStateTextStyle` loses the font when widgets merge styles, and the chips fell back to the system font.
- User-provided files (fonts, photos) are validated by content, stored under our own random key and never used to build paths, family names or SQL.
- Every `FloatingActionButton` needs `heroTag: null` (tabs live side by side in an IndexedStack).
- Shared UI pieces live in `lib/core/widgets/` (`NumberField`, `SelectChip`, `NutrientsPanel`, `PhotoEditor`…); reuse them before writing new ones.
