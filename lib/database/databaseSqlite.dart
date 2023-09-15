import 'package:sqflite/sqflite.dart';
import 'package:bootcamp_flutter/database/config/env.dart';
import 'package:path/path.dart' as path;

class DatabaseSQLITE {
  static Database? database;

  static Future<Database> getInstance() async {
    if (database == null) {
      await _initDatabase();
    }

    return database!;
  }

  static Future<void> _initDatabase() async {
    final config = environment();

    await openDatabase(
      path.join(await getDatabasesPath(), 'database.db'),
      version: config.version,
      onCreate: config.onCreate,
      onUpgrade: config.onUpgrade,
      onDowngrade: config.onDowngrade,
      onOpen: config.onOpen,
      onConfigure: config.onConfigure,
      readOnly: config.readOnly,
      singleInstance: config.singleInstance,
    );
  }
}
