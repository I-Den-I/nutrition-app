import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutrition_app/core/db/app_database.dart';

void main() {
  test('upgrades a v1 database to the current version', () async {
    final dir = await Directory.systemTemp.createTemp('nutrition_migration');
    final file = File('${dir.path}/db.sqlite');

    // Build a database, then roll it back to the v1 shape.
    var db = AppDatabase(NativeDatabase(file));
    await db.select(db.products).get();
    await db.customStatement('DROP TABLE media_blobs');
    await db.customStatement('DROP TABLE custom_fonts');
    await db.customStatement('DROP INDEX diary_entries_day');
    await db.customStatement('PRAGMA user_version = 1');
    await db.close();

    db = AppDatabase(NativeDatabase(file));
    expect(await db.select(db.mediaBlobs).get(), isEmpty);
    expect(await db.select(db.customFonts).get(), isEmpty);
    expect(await db.select(db.mealGroups).get(), hasLength(4));
    await db.close();
    await dir.delete(recursive: true);
  }, timeout: const Timeout(Duration(seconds: 20)));
}
