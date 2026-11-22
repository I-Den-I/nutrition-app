import 'dart:typed_data';

import '../db/app_database.dart';
import 'media_storage_io.dart'
    if (dart.library.js_interop) 'media_storage_web.dart'
    as impl;

/// Stores media bytes on the device and returns a key that goes into
/// `media.local_path`.
///
/// Native platforms write files into the app support folder; the web keeps
/// bytes in the `media_blobs` table (browsers have no writable file system).
abstract interface class MediaStorage {
  factory MediaStorage(AppDatabase db) = impl.PlatformMediaStorage;

  Future<String> save(Uint8List bytes, {required String extension});
  Future<Uint8List?> load(String key);
  Future<void> delete(String key);
}
