import 'package:drift/drift.dart';

import '../db/app_database.dart';
import 'media_storage.dart';

/// Photos (and later videos) attached to products and dishes.
class MediaRepository {
  MediaRepository(this._db, this._storage);

  final AppDatabase _db;
  final MediaStorage _storage;

  Stream<List<MediaData>> watchFor(MediaOwner owner, String ownerId) =>
      (_db.select(_db.media)
            ..where(
              (m) =>
                  m.ownerType.equalsValue(owner) &
                  m.ownerId.equals(ownerId) &
                  m.deletedAt.isNull(),
            )
            ..orderBy([
              (m) => OrderingTerm.asc(m.sortOrder),
              (m) => OrderingTerm.asc(m.createdAt),
            ]))
          .watch();

  Future<void> addPhoto(
    MediaOwner owner,
    String ownerId,
    Uint8List bytes, {
    required String extension,
  }) async {
    final key = await _storage.save(bytes, extension: extension);
    final count =
        await (_db.selectOnly(_db.media)
              ..addColumns([_db.media.id.count()])
              ..where(
                _db.media.ownerType.equalsValue(owner) &
                    _db.media.ownerId.equals(ownerId),
              ))
            .map((r) => r.read(_db.media.id.count()))
            .getSingle();
    await _db
        .into(_db.media)
        .insert(
          MediaCompanion.insert(
            ownerType: owner,
            ownerId: ownerId,
            kind: MediaKind.photo,
            localPath: Value(key),
            sortOrder: Value(count ?? 0),
          ),
        );
  }

  Future<void> remove(MediaData m) async {
    final now = DateTime.now();
    await (_db.update(_db.media)..where((x) => x.id.equals(m.id))).write(
      MediaCompanion(deletedAt: Value(now), updatedAt: Value(now)),
    );
    if (m.localPath != null) await _storage.delete(m.localPath!);
  }

  /// Removes every photo of an owner, e.g. when a new product form that
  /// already had photos attached is cancelled.
  Future<void> removeAllFor(MediaOwner owner, String ownerId) async {
    final all = await watchFor(owner, ownerId).first;
    for (final m in all) {
      await remove(m);
    }
  }

  Future<Uint8List?> load(String key) => _storage.load(key);
}
