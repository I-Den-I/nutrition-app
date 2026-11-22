import 'package:uuid/uuid.dart';

const _uuid = Uuid();

/// New time-ordered UUID v7 for a row id. Generated on the client so rows
/// created offline on different devices never collide.
String newId() => _uuid.v7();
