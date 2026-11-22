import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:sqlite3/wasm.dart';

/// Runs sqlite3 in the page itself (no workers), so it also works in
/// embedded browsers that restrict shared workers.
QueryExecutor inMemoryExecutor() => DatabaseConnection.delayed(
  Future(() async {
    final sqlite3 = await WasmSqlite3.loadFromUrl(Uri.parse('sqlite3.wasm'));
    sqlite3.registerVirtualFileSystem(InMemoryFileSystem(), makeDefault: true);
    return DatabaseConnection(WasmDatabase.inMemory(sqlite3));
  }),
).executor;
