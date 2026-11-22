import 'dart:typed_data';

import '../db/app_database.dart';
import 'media_storage.dart';

/// Bytes in the `media_blobs` table of the browser database.
class PlatformMediaStorage implements MediaStorage {
  PlatformMediaStorage(this._db);

  final AppDatabase _db;

  @override
  Future<String> save(Uint8List bytes, {required String extension}) async {
    final key = '${newId()}.$extension';
    await _db
        .into(_db.mediaBlobs)
        .insert(MediaBlobsCompanion.insert(key: key, bytes: bytes));
    return key;
  }

  @override
  Future<Uint8List?> load(String key) async {
    final row = await (_db.select(
      _db.mediaBlobs,
    )..where((b) => b.key.equals(key))).getSingleOrNull();
    return row?.bytes;
  }

  @override
  Future<void> delete(String key) =>
      (_db.delete(_db.mediaBlobs)..where((b) => b.key.equals(key))).go();
}
