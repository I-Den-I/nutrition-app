# Nutrition app

Cross-platform calorie/macro (КБЖВ) tracker. Architecture and product decisions: `docs/ARCHITECTURE.md` — read it before larger changes and keep it updated.

The owner is not a programmer: talk to them in Ukrainian, in plain words.

## Layout

- `app/` — Flutter client (iOS, Android, macOS, Windows, Web/Telegram).
- `docs/` — architecture.

## Commands (run in `app/`)

- `flutter test` — unit tests (domain formulas, database).
- `flutter analyze` — must stay clean.
- `dart run build_runner build` — after changing drift tables (`lib/core/db/tables.dart`).
- `flutter gen-l10n` — after changing ARB files (also runs automatically on build).
- `flutter build web` → `app/build/web` (needs `sqlite3.wasm` + `drift_worker.js` already in `app/web/`).

## Conventions

- Material comes from `package:material_ui/material_ui.dart`; `package:flutter/material.dart` is deprecated in this Flutter version — do not import it.
- No hard-coded colors in widgets: use `context.tokens` (`core/theme/app_tokens.dart`) or the theme's `ColorScheme`.
- No hard-coded UI strings: add keys to all four ARB files in `lib/core/l10n/arb/` (en, uk, ru, de) and use `context.l10n`.
- Nutrition math lives in `lib/core/domain/` as pure Dart with tests; screens never compute macros themselves.
- Every syncable table uses the `SyncColumns` mixin (UUID v7 id, timestamps, soft delete). Never hard-delete user data; set `deletedAt`.
- Gate cloud/paid features through `entitlementsProvider`, not by checking the mode directly.
- Feature code goes under `lib/features/<feature>/{data,domain,presentation}`.
- Generated files (`*.g.dart`, `lib/core/l10n/gen/`) are committed.
