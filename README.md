# Nutrition

A minimal, open-source calorie and macro tracker for iOS, Android, macOS, Windows, the web and Telegram.

Log what you eat in grams and the app calculates each portion and the day's totals of calories, protein, fat, carbs and any extra nutrients you choose to track. Products and dishes live in your own database with descriptions and photos.

> **Status:** early development. The local MVP works: onboarding with goals, products with photos, dishes with calculation, and a daily diary. See the [roadmap](docs/ARCHITECTURE.md#13-roadmap).

## Principles

- **Local first.** The app works fully offline with all data on your device. No account needed.
- **Open source.** The client and the backend are both in this repository.
- **Self-hostable.** Cloud features (sync, shared catalog, social, AI) talk to a backend you choose: the official hosted service or your own server.
- **Minimal.** Black, white and grey; nothing that doesn't help you log food faster.
- **Multilingual.** English, Ukrainian, Russian and German from day one.

## Repository layout

| Path | What |
|---|---|
| `app/` | Flutter client for every platform |
| `docs/ARCHITECTURE.md` | Architecture, data model and roadmap |
| `backend/` | *(planned)* database migrations and server functions |
| `admin/` | *(planned)* admin panel |

## Getting started

Requirements: [Flutter](https://docs.flutter.dev/get-started/install) (stable, 3.50+). For iOS/macOS builds you also need Xcode; for Android, Android Studio.

```sh
cd app
flutter pub get
flutter run -d chrome        # or: -d macos, -d windows, an emulator, a device
```

Tests and checks:

```sh
flutter analyze
flutter test                              # unit tests
flutter test integration_test -d macos    # end-to-end flow (or an iOS simulator id)
```

To try the app without keeping data (e.g. in embedded browsers that block shared workers), use a throw-away in-memory database:

```sh
flutter run -d chrome --dart-define=IN_MEMORY_DB=true
```

After changing database tables run `dart run build_runner build`. After changing UI strings in `lib/core/l10n/arb/` run `flutter gen-l10n`.

## Connecting your own backend

By default the app is purely local and makes no network requests. To point a build at a server:

```sh
cp config/backend.example.json config/backend.json   # edit the values
flutter run --dart-define-from-file=config/backend.json
```

`config/backend.json` is git-ignored. Only public, client-safe values belong there; secrets stay on the server. Which cloud features are available is decided by the server, so a self-hosted instance can enable all of them. The backend and a self-hosting guide arrive with the cloud stage of the roadmap.

## Translations

UI strings are in `app/lib/core/l10n/arb/` (`app_en.arb` is the template). Add a new key to every language file, or add a new `app_<code>.arb` file to support another language.

## License

[AGPL-3.0](LICENSE). You may use, modify and self-host this project. If you run a modified version as a service for others, you must publish your changes under the same license.
