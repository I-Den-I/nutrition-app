import 'package:drift/drift.dart';

import 'memory_connection_io.dart'
    if (dart.library.js_interop) 'memory_connection_web.dart'
    as impl;

/// Throw-away in-memory database for demos and UI checks, enabled with
/// `--dart-define=IN_MEMORY_DB=true`. Data is lost on reload.
QueryExecutor inMemoryExecutor() => impl.inMemoryExecutor();
