import 'package:flutter_test/flutter_test.dart';
import 'package:nutrition_app/core/config/backend_config.dart';
import 'package:nutrition_app/core/entitlements/entitlements.dart';

void main() {
  test('local mode grants no cloud features', () {
    const e = Entitlements.local();
    for (final f in CloudFeature.values) {
      expect(e.can(f), isFalse);
    }
  });

  test('cloud mode grants only what the server returned', () {
    const e = Entitlements(
      mode: AppMode.cloud,
      granted: {CloudFeature.sync},
    );
    expect(e.can(CloudFeature.sync), isTrue);
    expect(e.can(CloudFeature.ai), isFalse);
  });

  test('no backend is configured by default', () {
    expect(BackendConfig.fromEnvironment.isConfigured, isFalse);
  });
}
