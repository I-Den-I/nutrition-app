import 'dart:convert';
import 'dart:typed_data';

import 'package:meta/meta.dart';

/// Largest font file a user may add.
const maxFontBytes = 5 * 1024 * 1024;

enum FontCheckError {
  /// Bigger than [maxFontBytes].
  tooLarge,

  /// Not a TrueType/OpenType font, or a malformed one.
  notAFont,

  /// A valid but unsupported container (font collection, WOFF/WOFF2).
  unsupported,
}

@immutable
class FontCheck {
  const FontCheck.ok({required this.extension, required this.name})
    : error = null;
  const FontCheck.error(FontCheckError this.error)
    : extension = '',
      name = null;

  final FontCheckError? error;

  /// `ttf` or `otf`, decided from the file content (never from the
  /// user's file name).
  final String extension;

  /// Display name from the font's `name` table, already sanitized.
  final String? name;

  bool get isOk => error == null;
}

const _sfntTrueType = 0x00010000;
const _sfntOpenType = 0x4F54544F; // 'OTTO'
const _sfntApple = 0x74727565; // 'true'
const _collection = 0x74746366; // 'ttcf'
const _woff = 0x774F4646; // 'wOFF'
const _woff2 = 0x774F4632; // 'wOF2'
const _headMagic = 0x5F0F3CF5;

const _requiredTables = {'cmap', 'head', 'hhea', 'hmtx', 'maxp', 'name'};

/// Checks that [bytes] is a well-formed single TrueType/OpenType font
/// before it is stored or handed to the text engine.
///
/// Every offset is bounds-checked; nothing from the file is trusted.
FontCheck checkFontBytes(Uint8List bytes) {
  if (bytes.length > maxFontBytes) {
    return const FontCheck.error(FontCheckError.tooLarge);
  }
  if (bytes.length < 12 + 16) {
    return const FontCheck.error(FontCheckError.notAFont);
  }
  final data = ByteData.sublistView(bytes);
  final version = data.getUint32(0);
  if (version == _collection || version == _woff || version == _woff2) {
    return const FontCheck.error(FontCheckError.unsupported);
  }
  if (version != _sfntTrueType &&
      version != _sfntOpenType &&
      version != _sfntApple) {
    return const FontCheck.error(FontCheckError.notAFont);
  }

  final numTables = data.getUint16(4);
  final directoryEnd = 12 + 16 * numTables;
  if (numTables == 0 || numTables > 100 || directoryEnd > bytes.length) {
    return const FontCheck.error(FontCheckError.notAFont);
  }

  final tables = <String, (int offset, int length)>{};
  for (var i = 0; i < numTables; i++) {
    final rec = 12 + 16 * i;
    final tag = String.fromCharCodes(bytes, rec, rec + 4);
    final offset = data.getUint32(rec + 8);
    final length = data.getUint32(rec + 12);
    if (offset < directoryEnd || offset + length > bytes.length) {
      return const FontCheck.error(FontCheckError.notAFont);
    }
    tables[tag] = (offset, length);
  }

  final hasOutlines =
      (tables.containsKey('glyf') && tables.containsKey('loca')) ||
      tables.containsKey('CFF ') ||
      tables.containsKey('CFF2');
  if (!tables.keys.toSet().containsAll(_requiredTables) || !hasOutlines) {
    return const FontCheck.error(FontCheckError.notAFont);
  }

  final (headOffset, headLength) = tables['head']!;
  if (headLength < 54 || data.getUint32(headOffset + 12) != _headMagic) {
    return const FontCheck.error(FontCheckError.notAFont);
  }

  final (nameOffset, nameLength) = tables['name']!;
  return FontCheck.ok(
    extension: version == _sfntOpenType ? 'otf' : 'ttf',
    name: _readName(data, nameOffset, nameLength),
  );
}

/// Full name (ID 4) or family name (ID 1); Windows Unicode preferred,
/// then Mac Roman. Returns null when nothing usable is found.
String? _readName(ByteData data, int tableOffset, int tableLength) {
  if (tableLength < 6) return null;
  final count = data.getUint16(tableOffset + 2);
  final storage = tableOffset + data.getUint16(tableOffset + 4);
  final tableEnd = tableOffset + tableLength;
  if (6 + 12 * count > tableLength) return null;

  String? best;
  var bestRank = 0;
  for (var i = 0; i < count; i++) {
    final rec = tableOffset + 6 + 12 * i;
    final platform = data.getUint16(rec);
    final nameId = data.getUint16(rec + 6);
    final length = data.getUint16(rec + 8);
    final start = storage + data.getUint16(rec + 10);
    if (nameId != 4 && nameId != 1) continue;
    if (start + length > tableEnd || length == 0 || length > 512) continue;

    String? text;
    if (platform == 3 || platform == 0) {
      if (length.isOdd) continue;
      final units = [
        for (var j = 0; j < length; j += 2) data.getUint16(start + j),
      ];
      text = String.fromCharCodes(units);
    } else if (platform == 1) {
      text = latin1.decode(
        data.buffer.asUint8List(data.offsetInBytes + start, length),
        allowInvalid: true,
      );
    }
    final clean = sanitizeFontName(text);
    if (clean == null) continue;
    final rank = (nameId == 4 ? 2 : 1) + (platform == 3 ? 2 : 0);
    if (rank > bestRank) {
      best = clean;
      bestRank = rank;
    }
  }
  return best;
}

/// Control characters plus invisible direction marks and bidi overrides,
/// which could make a name render as something else.
final _unsafeChars = RegExp(
  '[\\u0000-\\u001F\\u007F-\\u009F'
  '\\u200E\\u200F\\u202A-\\u202E\\u2066-\\u2069]',
);

/// Makes any user/file-provided text safe to show as a font name:
/// no control or bidi-override characters, single spaces, ≤ 60 chars.
String? sanitizeFontName(String? input) {
  if (input == null) return null;
  final cleaned = input
      .replaceAll(_unsafeChars, '')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();
  if (cleaned.isEmpty) return null;
  return cleaned.length > 60 ? cleaned.substring(0, 60).trim() : cleaned;
}

/// File name without directories and extension, sanitized.
String? fontNameFromFileName(String fileName) {
  final base = fileName.split(RegExp(r'[\\/]')).last;
  final dot = base.lastIndexOf('.');
  return sanitizeFontName(dot > 0 ? base.substring(0, dot) : base);
}
