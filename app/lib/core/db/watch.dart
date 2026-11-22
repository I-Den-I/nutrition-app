import 'package:drift/drift.dart';

/// Re-runs [load] whenever any of [tables] changes. Use for reads that
/// combine several tables and are easier to assemble in Dart than in SQL.
Stream<T> watchTables<T>(
  GeneratedDatabase db,
  Iterable<TableInfo> tables,
  Future<T> Function() load,
) async* {
  yield await load();
  await for (final _ in db.tableUpdates(TableUpdateQuery.onAllTables(tables))) {
    yield await load();
  }
}
