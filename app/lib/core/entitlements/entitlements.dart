import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';

enum AppMode { local, cloud }

/// Features that need a server. Everything else works locally for free.
enum CloudFeature { sync, publicCatalog, publish, comments, ai }

/// What the current user may do.
///
/// The app never hard-codes a paywall: in cloud mode the **server** says
/// which [CloudFeature]s are granted. The official hosted service may sell
/// some of them; a self-hosted server can simply grant all of them.
///
/// Screens ask [can] instead of checking the mode or a subscription.
@immutable
class Entitlements {
  const Entitlements({required this.mode, this.granted = const {}});

  const Entitlements.local() : this(mode: AppMode.local);

  final AppMode mode;
  final Set<CloudFeature> granted;

  bool get isCloud => mode == AppMode.cloud;

  bool can(CloudFeature feature) => isCloud && granted.contains(feature);
}

/// Always local for now. Once accounts exist: local until the user signs
/// in to the server from `backendConfigProvider`, then whatever it grants.
final entitlementsProvider = Provider<Entitlements>(
  (ref) => const Entitlements.local(),
);
