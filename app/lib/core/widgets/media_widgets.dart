import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_ui/material_ui.dart';

import '../db/app_database.dart';
import '../db/repositories.dart';
import '../l10n/l10n.dart';
import '../theme/app_tokens.dart';

final mediaForProvider = StreamProvider.autoDispose
    .family<List<MediaData>, (MediaOwner, String)>(
      (ref, arg) => ref.watch(mediaRepositoryProvider).watchFor(arg.$1, arg.$2),
    );

final mediaBytesProvider = FutureProvider.autoDispose
    .family<Uint8List?, String>(
      (ref, key) => ref.watch(mediaRepositoryProvider).load(key),
    );

/// Image stored by [MediaStorage] under [storageKey].
class MediaImage extends ConsumerWidget {
  const MediaImage(this.storageKey, {super.key, this.fit = BoxFit.cover});

  final String storageKey;
  final BoxFit fit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bytes = ref.watch(mediaBytesProvider(storageKey)).value;
    if (bytes == null) {
      return ColoredBox(color: context.tokens.surfaceMuted);
    }
    return Image.memory(bytes, fit: fit, gaplessPlayback: true);
  }
}

/// Small square thumbnail of the first photo, or nothing.
class FirstPhotoThumb extends ConsumerWidget {
  const FirstPhotoThumb(this.owner, this.ownerId, {super.key, this.size = 44});

  final MediaOwner owner;
  final String ownerId;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final media = ref.watch(mediaForProvider((owner, ownerId))).value;
    final first = media?.firstOrNull?.localPath;
    if (first == null) return SizedBox(width: size, height: size);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(width: size, height: size, child: MediaImage(first)),
    );
  }
}

/// Swipeable photos on a detail card. Hidden when there are none.
class PhotoGallery extends ConsumerWidget {
  const PhotoGallery(this.owner, this.ownerId, {super.key});

  final MediaOwner owner;
  final String ownerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final media = ref.watch(mediaForProvider((owner, ownerId))).value ?? [];
    final keys = media.map((m) => m.localPath).nonNulls.toList();
    if (keys.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: PageView(children: [for (final k in keys) MediaImage(k)]),
        ),
      ),
    );
  }
}

/// Editable row of photos with an "add" tile. Changes apply immediately.
class PhotoEditor extends ConsumerWidget {
  const PhotoEditor(this.owner, this.ownerId, {super.key});

  final MediaOwner owner;
  final String ownerId;

  static const _size = 88.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final media = ref.watch(mediaForProvider((owner, ownerId))).value ?? [];
    final repo = ref.read(mediaRepositoryProvider);

    return SizedBox(
      height: _size,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (final m in media)
            if (m.localPath != null)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox.square(
                        dimension: _size,
                        child: MediaImage(m.localPath!),
                      ),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: GestureDetector(
                        onTap: () => repo.remove(m),
                        child: Container(
                          decoration: BoxDecoration(
                            color: t.background.withValues(alpha: 0.85),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(2),
                          child: Icon(
                            Icons.close,
                            size: 16,
                            color: t.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => _add(context, ref),
            child: Container(
              width: _size,
              height: _size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: t.border),
              ),
              child: Icon(Icons.add_a_photo_outlined, color: t.textSecondary),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _add(BuildContext context, WidgetRef ref) async {
    final picked = await pickPhoto(context);
    if (picked == null) return;
    final (bytes, ext) = picked;
    await ref
        .read(mediaRepositoryProvider)
        .addPhoto(owner, ownerId, bytes, extension: ext);
  }
}

/// Lets the user pick a photo (camera or gallery on phones, file picker
/// elsewhere). Images are downscaled to ≤1600 px by the picker.
Future<(Uint8List, String)?> pickPhoto(BuildContext context) async {
  final picker = ImagePicker();
  var source = ImageSource.gallery;
  final isPhone =
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);
  if (isPhone) {
    final l10n = context.l10n;
    final chosen = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: Text(l10n.photoCamera),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: Text(l10n.photoGallery),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
    if (chosen == null) return null;
    source = chosen;
  }
  final file = await picker.pickImage(
    source: source,
    maxWidth: 1600,
    maxHeight: 1600,
    imageQuality: 80,
  );
  if (file == null) return null;
  final bytes = await file.readAsBytes();
  final name = file.name.toLowerCase();
  final ext = name.contains('.') ? name.split('.').last : 'jpg';
  return (bytes, ext.length > 5 ? 'jpg' : ext);
}
