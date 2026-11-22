import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';

enum AppMode { local, cloud }

/// What the current user may do. Screens ask this instead of checking
/// the mode or subscription themselves, so paid/cloud features can be
/// switched on later without touching the UI code.
@immutable
class Entitlements {
  const Entitlements({required this.mode, this.isPremium = false});

  const Entitlements.local() : this(mode: AppMode.local);

  final AppMode mode;
  final bool isPremium;

  bool get isCloud => mode == AppMode.cloud;

  bool get canSync => isCloud;
  bool get canBrowsePublicCatalog => isCloud;
  bool get canPublish => isCloud;
  bool get canComment => isCloud;
  bool get canUseAi => isCloud && isPremium;
}

/// For now always local. Later: derived from the signed-in account.
final entitlementsProvider = Provider<Entitlements>(
  (ref) => const Entitlements.local(),
);
