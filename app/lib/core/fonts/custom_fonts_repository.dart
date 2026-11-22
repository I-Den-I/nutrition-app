import 'package:drift/drift.dart';
import 'package:flutter/services.dart';

import '../db/app_database.dart';
import '../media/media_storage.dart';
import 'app_fonts.dart';
import 'font_validator.dart';

/// Thrown by [CustomFontsRepository.add] when a file is rejected.
class FontRejected implements Exception {
  const FontRejected(this.reason);

  final FontCheckError reason;
}

/// User-added fonts: validated, stored under our own random key, and
/// registered with the text engine under our own family name.
class CustomFontsRepository {
  CustomFontsRepository(
    this._db,
    this._storage, {
    Future<void> Function(String family, Uint8List bytes)? register,
  }) : _register = register ?? _registerWithEngine;

  final AppDatabase _db;
  final MediaStorage _storage;
  final Future<void> Function(String family, Uint8List bytes) _register;
  final _loaded = <String>{};

  Stream<List<CustomFont>> watchAll() => (_db.select(
    _db.customFonts,
  )..orderBy([(f) => OrderingTerm.asc(f.createdAt)])).watch();

  /// Validates and stores a font file. [fileName] is only used as a
  /// fallback display name; it never becomes part of a path or query.
  Future<CustomFont> add(Uint8List bytes, {required String fileName}) async {
    final check = checkFontBytes(bytes);
    if (!check.isOk) throw FontRejected(check.error!);

    final id = newId();
    final key = await _storage.save(bytes, extension: check.extension);
    try {
      // The engine is the final judge: if it can't load the font, drop it.
      await _register(customFontFamily(id), bytes);
      _loaded.add(id);
    } catch (_) {
      await _storage.delete(key);
      throw const FontRejected(FontCheckError.notAFont);
    }
    return _db
        .into(_db.customFonts)
        .insertReturning(
          CustomFontsCompanion.insert(
            id: Value(id),
            name:
                check.name ??
                fontNameFromFileName(fileName) ??
                'Font ${id.substring(0, 4)}',
            storageKey: key,
          ),
        );
  }

  /// Registers a stored font with the engine (once per app run).
  /// Returns false if the file is missing or no longer valid.
  Future<bool> load(String id) async {
    if (_loaded.contains(id)) return true;
    final row = await (_db.select(
      _db.customFonts,
    )..where((f) => f.id.equals(id))).getSingleOrNull();
    if (row == null) return false;
    final bytes = await _storage.load(row.storageKey);
    if (bytes == null || !checkFontBytes(bytes).isOk) return false;
    try {
      await _register(customFontFamily(id), bytes);
    } catch (_) {
      return false;
    }
    _loaded.add(id);
    return true;
  }

  Future<void> delete(String id) async {
    final row = await (_db.select(
      _db.customFonts,
    )..where((f) => f.id.equals(id))).getSingleOrNull();
    if (row == null) return;
    await (_db.delete(_db.customFonts)..where((f) => f.id.equals(id))).go();
    await _storage.delete(row.storageKey);
    _loaded.remove(id);
  }

  static Future<void> _registerWithEngine(String family, Uint8List bytes) =>
      (FontLoader(
        family,
      )..addFont(Future.value(ByteData.sublistView(bytes)))).load();
}
