import 'dart:io';
import 'dart:typed_data';

import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutrition_app/core/db/app_database.dart';
import 'package:nutrition_app/core/fonts/app_fonts.dart';
import 'package:nutrition_app/core/fonts/custom_fonts_repository.dart';
import 'package:nutrition_app/core/fonts/font_validator.dart';
import 'package:nutrition_app/core/media/media_storage.dart';

class _MemoryStorage implements MediaStorage {
  final files = <String, Uint8List>{};

  @override
  Future<String> save(Uint8List bytes, {required String extension}) async {
    final key = '${newId()}.$extension';
    files[key] = bytes;
    return key;
  }

  @override
  Future<Uint8List?> load(String key) async => files[key];

  @override
  Future<void> delete(String key) async => files.remove(key);
}

Uint8List _bundled(String path) => File(path).readAsBytesSync();

Uint8List _withMagic(int magic) {
  final b = Uint8List(64);
  ByteData.sublistView(b).setUint32(0, magic);
  return b;
}

void main() {
  final comfortaa = _bundled('assets/fonts/comfortaa/Comfortaa-Regular.ttf');

  group('checkFontBytes', () {
    test('accepts a real TrueType font and reads its name', () {
      final c = checkFontBytes(comfortaa);
      expect(c.isOk, isTrue);
      expect(c.extension, 'ttf');
      expect(c.name, contains('Comfortaa'));
    });

    test('accepts every bundled font', () {
      for (final dir in Directory(
        'assets/fonts',
      ).listSync().whereType<Directory>()) {
        for (final f in dir.listSync().whereType<File>()) {
          if (!f.path.endsWith('.ttf')) continue;
          expect(
            checkFontBytes(f.readAsBytesSync()).isOk,
            isTrue,
            reason: f.path,
          );
        }
      }
    });

    test('rejects non-font data', () {
      expect(
        checkFontBytes(
          Uint8List.fromList(
            '<script>alert(1)</script>'.codeUnits.toList()
              ..addAll(List.filled(64, 0)),
          ),
        ).error,
        FontCheckError.notAFont,
      );
      expect(checkFontBytes(Uint8List(4)).error, FontCheckError.notAFont);
    });

    test('rejects a PNG renamed to .ttf', () {
      final png = Uint8List.fromList([
        0x89,
        0x50,
        0x4E,
        0x47,
        ...List.filled(60, 0),
      ]);
      expect(checkFontBytes(png).error, FontCheckError.notAFont);
    });

    test('rejects collections and WOFF', () {
      expect(
        checkFontBytes(_withMagic(0x74746366)).error,
        FontCheckError.unsupported,
      );
      expect(
        checkFontBytes(_withMagic(0x774F4646)).error,
        FontCheckError.unsupported,
      );
      expect(
        checkFontBytes(_withMagic(0x774F4632)).error,
        FontCheckError.unsupported,
      );
    });

    test('rejects truncated fonts (table offsets out of bounds)', () {
      final cut = Uint8List.sublistView(comfortaa, 0, comfortaa.length ~/ 2);
      expect(checkFontBytes(cut).error, FontCheckError.notAFont);
    });

    test('rejects a corrupted table directory', () {
      final bad = Uint8List.fromList(comfortaa);
      // First table record: offset field → beyond the end of the file.
      ByteData.sublistView(bad).setUint32(12 + 8, 0x7FFFFFFF);
      expect(checkFontBytes(bad).error, FontCheckError.notAFont);
    });

    test('rejects files over the size limit', () {
      expect(
        checkFontBytes(Uint8List(maxFontBytes + 1)).error,
        FontCheckError.tooLarge,
      );
    });
  });

  group('names', () {
    test('strip control and bidi-override characters', () {
      expect(
        sanitizeFontName('Evil\u202Egnp.exe\u0000 Font'),
        'Evilgnp.exe Font',
      );
      expect(sanitizeFontName('  a \n\t b  '), 'a b');
      expect(sanitizeFontName('\u0007\u200F'), isNull);
      expect(sanitizeFontName('x' * 200)!.length, 60);
    });

    test('file names lose their directories and extension', () {
      expect(fontNameFromFileName('../../etc/passwd.ttf'), 'passwd');
      expect(fontNameFromFileName(r'C:\fonts\My Font.otf'), 'My Font');
    });

    test('font family ids never contain file data', () {
      expect(customFontFamily('abc'), 'custom-abc');
      expect(fontFamilyFor('custom:abc'), 'custom-abc');
      expect(fontFamilyFor('unknown'), 'Comfortaa');
      expect(fontFamilyFor(systemFontId), isNull);
    });
  });

  group('CustomFontsRepository', () {
    late AppDatabase db;
    late _MemoryStorage storage;
    late CustomFontsRepository repo;
    final registered = <String>[];

    setUp(() {
      db = AppDatabase(NativeDatabase.memory());
      storage = _MemoryStorage();
      registered.clear();
      repo = CustomFontsRepository(
        db,
        storage,
        register: (family, _) async => registered.add(family),
      );
    });
    tearDown(() => db.close());

    test('stores under a random key, not the user file name', () async {
      final f = await repo.add(comfortaa, fileName: '../../../evil.sh');
      expect(
        storage.files.keys.single,
        matches(RegExp(r'^[0-9a-f-]{36}\.ttf$')),
      );
      expect(f.storageKey, isNot(contains('evil')));
      expect(registered.single, 'custom-${f.id}');
    });

    test('rejected files are not stored', () async {
      await expectLater(
        repo.add(Uint8List(100), fileName: 'x.ttf'),
        throwsA(isA<FontRejected>()),
      );
      expect(storage.files, isEmpty);
      expect(await db.select(db.customFonts).get(), isEmpty);
    });

    test('engine failure rolls back the stored file', () async {
      final failing = CustomFontsRepository(
        db,
        storage,
        register: (_, _) async => throw Exception('bad font'),
      );
      await expectLater(
        failing.add(comfortaa, fileName: 'x.ttf'),
        throwsA(isA<FontRejected>()),
      );
      expect(storage.files, isEmpty);
    });

    test('SQL in a name is stored as plain text', () async {
      const evil = "x'); DROP TABLE products; --";
      final f = await repo.add(
        // A font without a usable name falls back to the file name.
        comfortaa,
        fileName: '$evil.ttf',
      );
      await (db.update(db.customFonts)..where((r) => r.id.equals(f.id))).write(
        const CustomFontsCompanion(name: Value(evil)),
      );
      final row = await (db.select(
        db.customFonts,
      )..where((r) => r.id.equals(f.id))).getSingle();
      expect(row.name, evil);
      expect(await db.select(db.products).get(), isEmpty); // table still there
    });

    test('delete removes the row and the file', () async {
      final f = await repo.add(comfortaa, fileName: 'a.ttf');
      await repo.delete(f.id);
      expect(storage.files, isEmpty);
      expect(await db.select(db.customFonts).get(), isEmpty);
      expect(await repo.load(f.id), isFalse);
    });
  });
}
