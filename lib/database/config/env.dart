import 'package:bootcamp_flutter/database/config/scripts.dart';
import 'package:sqflite/sqflite.dart';

OpenDatabaseOptions environment() => OpenDatabaseOptions(

      version: 1,
      onCreate: (db, version) {
        scripts.forEach((_, value) async {
          await db.execute(value);
        });
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        for (var i = oldVersion + 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
        }
      },
    );
