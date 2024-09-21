import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

@DriftDatabase(
  include: {'tables.drift'},
)
class AppDatabase extends _$AppDatabase {
  AppDatabase._(QueryExecutor e) : super(_openConnection());

  factory AppDatabase() {
    return AppDatabase._(_openConnection());
  }

  factory AppDatabase.memory() {
    return AppDatabase._(NativeDatabase.memory());
  }

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'stride_database.db',
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse("sqlite3.wasm"),
        driftWorker: Uri.parse("drift_worker.js"),
      ),
    );
  }
}
