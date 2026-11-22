import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:nutrition_app/app.dart';
import 'package:nutrition_app/core/db/app_database.dart';
import 'package:nutrition_app/core/db/database_provider.dart';
import 'package:nutrition_app/core/settings/app_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Pumps frames for [seconds]; unlike pumpAndSettle it doesn't hang on
/// endless loading spinners.
Future<void> settle(WidgetTester tester, {double seconds = 1}) async {
  final frames = (seconds * 10).round();
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}

Finder field(String label) => find.widgetWithText(TextFormField, label);

/// End-to-end flow on a real device with the real on-device database:
/// `flutter test integration_test -d macos` (or an iOS simulator id).
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('onboarding → new product → log it in the diary', (tester) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    final db = AppDatabase.defaults();
    final productName = 'Test chicken ${DateTime.now().millisecondsSinceEpoch}';

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          databaseProvider.overrideWithValue(db),
        ],
        child: const NutritionApp(),
      ),
    );
    await settle(tester, seconds: 2);

    // Onboarding.
    await tester.tap(find.text('Українська'));
    await settle(tester);
    await tester.tap(find.text('Далі'));
    await settle(tester);
    await tester.tap(find.text('Пропустити'));
    await settle(tester);
    await tester.tap(find.text('Завершити'));
    await settle(tester, seconds: 2);
    expect(find.text('Сьогодні'), findsOneWidget);
    expect(find.text('Сніданок'), findsOneWidget);

    // New product; calories left empty → calculated from macros.
    await tester.tap(find.text('Продукти'));
    await settle(tester);
    await tester.tap(find.byTooltip('Новий продукт'));
    await settle(tester);
    await tester.enterText(field('Назва'), productName);
    await tester.enterText(field('Білки'), '23');
    await tester.enterText(field('Жири'), '1,2');
    await tester.enterText(field('Вуглеводи'), '0');
    await settle(tester);
    await tester.tap(find.widgetWithText(TextButton, 'Зберегти'));
    await settle(tester, seconds: 3);
    // Back on the list (the form is closed).
    expect(find.byTooltip('Новий продукт'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, productName), findsNothing);
    expect(find.text(productName), findsOneWidget);

    // Log 200 g of it.
    await tester.tap(find.text('Щоденник'));
    await settle(tester);
    await tester.tap(find.byTooltip('Додати в щоденник'));
    await settle(tester);
    await tester.tap(find.text(productName));
    await settle(tester);
    await tester.enterText(field('Грами'), '200');
    await settle(tester);
    await tester.tap(find.text('Додати'));
    await settle(tester);
    await tester.tap(find.text('Готово'));
    await settle(tester, seconds: 2);

    // 200 g × 102.8 kcal/100 g ≈ 206 kcal.
    expect(find.text(productName), findsOneWidget);
    expect(find.text('206'), findsWidgets);

    // Clean up the real database: remove what the test created.
    final products = await (db.select(
      db.products,
    )..where((p) => p.name.equals(productName))).get();
    for (final p in products) {
      await (db.delete(
        db.diaryEntries,
      )..where((e) => e.productId.equals(p.id))).go();
      await (db.delete(db.products)..where((x) => x.id.equals(p.id))).go();
    }
    await tester.pumpWidget(const SizedBox());
    await db.close();
  });
}
