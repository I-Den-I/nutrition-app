import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../db/app_database.dart';
import 'media_storage.dart';

/// Files in `<app support>/media/<key>`.
class PlatformMediaStorage implements MediaStorage {
  PlatformMediaStorage(AppDatabase _);

  Future<Directory>? _dir;

  Future<Directory> get _mediaDir => _dir ??= () async {
    final base = await getApplicationSupportDirectory();
    return Directory(p.join(base.path, 'media')).create(recursive: true);
  }();

  @override
  Future<String> save(Uint8List bytes, {required String extension}) async {
    final key = '${newId()}.$extension';
    await File(p.join((await _mediaDir).path, key)).writeAsBytes(bytes);
    return key;
  }

  @override
  Future<Uint8List?> load(String key) async {
    final f = File(p.join((await _mediaDir).path, key));
    return await f.exists() ? f.readAsBytes() : null;
  }

  @override
  Future<void> delete(String key) async {
    final f = File(p.join((await _mediaDir).path, key));
    if (await f.exists()) await f.delete();
  }
}
