# Architecture

> Status: **v0.5**. Stages 0 (scaffold) and 1 (MVP) are done. Items marked ❓ are still open.

## 0. Decisions

| Topic | Decision |
|---|---|
| License | **AGPL-3.0**: open source; anyone running a modified server for others must publish their changes |
| Stack | **Flutter**: one codebase for iOS, Android, macOS, Windows and Web/Telegram |
| Modes | **Local** (offline, everything on the device) and **Cloud** (account, sync, shared catalog, social features) |
| What is paid | Only access to the **official hosted servers**. The app itself is free, and anyone can self-host a backend |
| Self-hosting | The backend URL is a build-time setting; the server decides which cloud features are granted |
| Moderation | For now anything can be added. Admin panel, roles and moderation arrive with the cloud mode |
| AI | Not in the MVP. Quick text entry works without AI; AI later as a cloud feature |
| Dishes | In the MVP: macros for the whole dish, per 100 g, and each ingredient's contribution |
| Meal groups | Optional: built-in (breakfast/lunch/dinner/snack) plus custom ones |
| Nutrients | Calories, protein, fat and carbs are always tracked; others (fiber, sugar, salt…) are opt-in |
| Barcodes | Later |
| Language | Code, docs and PRs in English; the app UI ships in en, uk, ru, de |

## 1. What the product does

Every day the user builds a list of what they eat: pick a product or dish → enter grams → the app calculates the portion and sums the day against a goal.

Core entities:
- **Product**: name, description, photos, nutrients per 100 g (or 100 ml), optional servings ("1 pc = 60 g").
- **Dish**: a list of products with grams plus an optional cooked weight. Has an info card with photos, video and text; in cloud mode also comments and likes/dislikes.
- **Diary entry**: day, optional meal group, product or dish, grams.
- **Profile & goals**: sex, age, height, weight, activity, goal → daily calories and macros (or set manually).

## 2. Open source, modes and self-hosting

```
┌──────────────────── Local mode ────────────────────┐
│ Free, offline. All data on the device (SQLite).    │
│ Products, dishes, diary, goals, photos/videos.     │
└────────────────────────────────────────────────────┘
                     │  sign in to a backend
                     ▼
┌──────────────────── Cloud mode ────────────────────┐
│ Sync between devices · shared catalog of products  │
│ and dishes · comments, likes · dish suggestions ·  │
│ AI entry · Telegram Mini App                       │
│                                                    │
│ Backend = official hosted service (paid access)    │
│        or anyone's self-hosted server              │
└────────────────────────────────────────────────────┘
```

How this is built into the code:
- **Everything local is free and open.** The local database works the same in both modes; the cloud only *adds* sync on top. Signing in uploads existing local data instead of replacing it.
- **Backend is configurable at build time** (`BackendConfig`): `flutter run --dart-define-from-file=config/backend.json`. With no config the app is purely local and makes no network requests. A fork can point at its own server without changing code.
- **No paywall in the client.** `Entitlements` asks the server which `CloudFeature`s (`sync`, `publicCatalog`, `publish`, `comments`, `ai`) are granted. The official service may charge for them; a self-hosted server can grant all of them.
- **The backend lives in this repo** (`backend/`: database migrations, server functions) and is built on open-source, self-hostable components, so anyone can run the full stack.
- Payments (official service only, later): App Store / Google Play, Telegram Stars, Stripe for web/desktop. Payment code stays on the server side and is optional for self-hosters ❓.

## 3. Stack

**Flutter (Dart)** builds one codebase for every platform with an identical look.

| Concern | Package |
|---|---|
| State & DI | `flutter_riverpod` |
| Navigation | `go_router` |
| Local database | `drift` (SQLite; WASM on the web) |
| UI components | `material_ui` (Material was split out of the Flutter SDK; do not import `package:flutter/material.dart`) |
| Models | `freezed` + `json_serializable` |
| Localization | built-in `flutter gen-l10n` (ARB files) |
| Photos / video | `image_picker`, `flutter_image_compress`, `video_player` |
| Telegram | `telegram_web_app` |
| Charts (later) | `fl_chart` |

## 4. Layers

```
┌───────────────────────────────────────────────┐
│ Presentation   screens, widgets, Riverpod     │
├───────────────────────────────────────────────┤
│ Domain         entities + pure calculations   │
│                (portion, day totals, BMR,     │
│                 dish → whole / per 100 g)     │
├───────────────────────────────────────────────┤
│ Data           repositories (interfaces)      │
│   ├─ LocalDataSource  (Drift / SQLite) ← now  │
│   └─ RemoteDataSource (API) + Sync     ← later│
└───────────────────────────────────────────────┘
```

UI and business logic only talk to **repository interfaces**. All formulas live in the domain layer and are unit-tested.

## 5. Repository layout (monorepo)

```
nutrition-app/
├── app/                      # Flutter client (all platforms)
│   ├── config/               # backend.example.json (backend.json is git-ignored)
│   ├── lib/
│   │   ├── core/
│   │   │   ├── config/       # BackendConfig (build-time server settings)
│   │   │   ├── db/           # Drift: tables, migrations
│   │   │   ├── domain/       # formulas: portion, dish, totals
│   │   │   ├── entitlements/ # which cloud features are available
│   │   │   ├── l10n/         # arb/ (strings in 4 languages) + gen/ (generated)
│   │   │   ├── router/
│   │   │   ├── settings/     # language, theme, onboarding (device prefs)
│   │   │   ├── theme/        # color tokens, ThemeData
│   │   │   ├── widgets/      # shared widgets
│   │   │   └── platform/     # Telegram, files, media (later)
│   │   └── features/
│   │       ├── onboarding/   # language, profile, goals
│   │       ├── products/
│   │       ├── dishes/       # dishes + info card
│   │       ├── diary/        # the day: groups, totals, progress
│   │       ├── goals/
│   │       └── settings/
│   │       (each feature: data/ domain/ presentation/)
│   ├── web/                  # + sqlite3.wasm, drift_worker.js for the web database
│   └── test/
├── admin/                    # later: admin panel (web)
├── backend/                  # later: Postgres migrations, server functions, docker-compose
└── docs/
```

## 6. Data model

Rules for **every** syncable table (so moving to a server is painless):
- `id` is a **UUID v7** generated on the client;
- `created_at`, `updated_at`, `deleted_at` (soft delete);
- nutrient values are stored **per 100 g/ml**.

### Products and nutrients

```
products
  id, owner_id?, visibility (private|public), status (active|pending|rejected)
  name, description, brand?, barcode?
  basis (g|ml)
  kcal, protein, fat, carbs           -- core, always present

nutrient_definitions                   -- catalog, seeded from code
  code ('fiber','sugar','salt','sat_fat','water',…), unit (g|mg|µg|ml), sort_order

product_nutrients                      -- optional nutrients of a product
  product_id, nutrient_code, amount_per_100

product_servings                       -- "1 pc", "1 tbsp"
  id, product_id, label, grams
```

The user picks which optional nutrients to show (`profile.tracked_nutrients`). A new nutrient needs no schema migration.

### Dishes

```
dishes
  id, owner_id?, visibility, name, description (markdown)
  cooked_weight_g?                     -- weight of the finished dish

dish_items
  id, dish_id, product_id, grams       -- raw ingredients

dish_meal_groups                       -- which meals it fits (future suggestions)
  dish_id, meal_group_id
```

Dish calculation (domain):
- **each ingredient**: `per100 × grams / 100`, shown as its contribution;
- **whole dish**: sum of contributions;
- **per 100 g**: `whole / weight × 100`, where weight = `cooked_weight_g` if set, otherwise the sum of raw weights. This accounts for water lost or absorbed while cooking.

### Media (shared by products and dishes)

```
media
  id, owner_type (product|dish), owner_id, kind (photo|video)
  local_path?, remote_url?, thumb_path?, sort_order, width, height, duration_s?
```

### Diary and meal groups

```
meal_groups
  id, system_key? ('breakfast'|'lunch'|'dinner'|'snack'), custom_name?, sort_order, is_hidden
  -- built-in groups have a system_key and a translated name;
  -- custom groups have a custom_name

diary_entries
  id, day (yyyy-MM-dd), meal_group_id?, product_id | dish_id, grams
  snapshot_kcal, snapshot_protein, snapshot_fat, snapshot_carbs
  snapshot_extra (JSON)                -- values at logging time
```

### Profile and goals

```
profile        sex, birth_date, height_cm, activity_level, weight_goal, tracked_nutrients
weight_log     id, day, weight_kg
goals          mode (auto|manual), kcal, protein, fat, carbs, extra (JSON)
```

Language, theme and onboarding state are per-device preferences (SharedPreferences), not part of the profile, so they are not synced.

Auto mode: BMR via Mifflin-St Jeor × activity factor ± deficit/surplus → calories; macros as g/kg of body weight or percentages. Any value can be overridden manually.

Schema changes bump `schemaVersion` in `AppDatabase` with a step in `onUpgrade`; `test/db/migration_test.dart` checks upgrades.

### Server-only (cloud mode)

```
users, roles (user|moderator|admin), entitlements
comments       id, target_type (product|dish), target_id, user_id, text
reactions      target_type, target_id, user_id, value (+1|-1)
reports        content reports for moderation
```

## 7. Localization

- Launch languages: **en, uk, ru, de**. Chosen on the first onboarding screen, changeable in settings.
- UI strings live in ARB files (`app/lib/core/l10n/arb/`), keys in English. Every new string goes into all four files.
- Numbers and dates are formatted per locale (`de` shows "12,5 g").
- Product and dish names are user content and are stored as entered. Translations for the shared catalog come with the cloud mode ❓.

## 8. Design system

- Monochrome: black, white and greys; light and dark themes.
- All colors go through **tokens** (`AppTokens`: `background`, `surface`, `border`, `textPrimary`, `accent`…). No hard-coded colors in widgets.
- A future accent picker only swaps `accent` / `onAccent`.
- Minimal decoration: typography, spacing, thin dividers, large day-total numbers.

## 9. Media files

- Photos are compressed (≤1600 px, ~80%) with a thumbnail. Videos are kept as-is with a size/length limit ❓.
- `MediaStorage` keeps files in the app support folder on native platforms and in the `media_blobs` table on the web (browsers have no writable file system); `media.local_path` stores the key.
- In cloud mode files are uploaded to S3-compatible object storage.

## 10. Backend and admin panel (Cloud stage)

- **Supabase** (Postgres + auth + storage + Row Level Security) to start: open source and self-hostable via Docker, so the same `backend/` works for the official service and for forks. Under the hood it is plain Postgres, so moving off Supabase stays possible.
- **Sync**: offline-first. The local database is the source of truth for the UI; background sync by `updated_at`.
- **Auth**: email / Apple / Google; in Telegram via `initData`, verified on the server.
- **Admin panel**: separate web app for moderating products and dishes, reports, users and roles.
- **Entitlements**: a server-side table/function returns the granted `CloudFeature`s. Billing integration plugs in here for the official service only.
- Secrets (AI keys, payment keys) live **only on the server**, never in the client or the repo.

## 11. Telegram Mini App

- The same Flutter web build plus a `core/platform/telegram` adapter (theme, back button, MainButton, haptics).
- Telegram may wipe local web storage, so the TG version is part of the **cloud mode**.

## 12. Quick text entry (no AI)

`chicken 200, rice 150, oil 10` → parser for "name + number (+ g/ml/pc)" → fuzzy search in the user's products and dishes → confirmation screen to fix matches → diary entries.

An AI version (free text, plate photo) comes later as a cloud feature.

## 13. Roadmap

| Stage | Scope |
|---|---|
| 0. Scaffold ✅ | Flutter project, theme (tokens, light/dark), l10n (4 languages), Drift, router, `Entitlements`, `BackendConfig` |
| 1. MVP ✅ | Onboarding (language, profile, goals) · products (CRUD, photos, description, optional nutrients) · dishes with calculation · day diary with groups, totals and progress |
| 2. Comfort | Quick text entry · "pc" servings · videos in cards · history, weight chart |
| 3. Cloud | Accounts · sync · shared catalog · admin panel and moderation · comments/likes · entitlements · self-hosting guide |
| 4. Extensions | TG Mini App · AI entry · meal suggestions by group · barcode scanner (Open Food Facts) · accent picker |
