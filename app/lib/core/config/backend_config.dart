import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';

/// Which server (if any) this build of the app talks to.
///
/// Set at build time, so anyone can point their own build at their own
/// server without changing code:
///
/// ```sh
/// flutter run --dart-define-from-file=config/backend.json
/// ```
///
/// See `config/backend.example.json`. With no config the app is purely
/// local and never makes network requests.
@immutable
class BackendConfig {
  const BackendConfig({required this.apiUrl, this.publicKey = ''});

  static const fromEnvironment = BackendConfig(
    apiUrl: String.fromEnvironment('BACKEND_URL'),
    publicKey: String.fromEnvironment('BACKEND_PUBLIC_KEY'),
  );

  /// Base URL of the backend, e.g. `https://api.example.com`. Empty = none.
  final String apiUrl;

  /// Public (client-safe) key, e.g. a Supabase anon key. Never a secret.
  final String publicKey;

  bool get isConfigured => apiUrl.isNotEmpty;
}

final backendConfigProvider = Provider<BackendConfig>(
  (ref) => BackendConfig.fromEnvironment,
);
