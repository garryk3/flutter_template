import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:psychology_tests/data/interfaces/interfaces.dart';
import 'package:psychology_tests/infrastructure/utils/utils.dart';

const String testDrop = '''
  DROP TABLE settings;
''';

const String createSettingsTable = '''
  CREATE TABLE IF NOT EXISTS settings (
    id  INTEGER PRIMARY KEY AUTOINCREMENT,
    startTime TEXT
  )
''';

class DbService extends GetxService implements IDatabase {
  final String _dbFileName = 'library.db';
  final int version;

  Database? _db;

  DbService(this.version);

  bool get isOpened => _db?.isOpen ?? false;

  @override
  Future<void> initialize() async {
    await open();
  }

  @override
  Future<void> open() async {
    if (isOpened) {
      return;
    }

    var databasesPath = await getDatabasesPath();
    var dbFilePath = join(await getDatabasesPath(), _dbFileName);
    try {
      var status = await Permission.storage.request();
      if (status == PermissionStatus.granted) {
        await Directory(databasesPath).create(recursive: true);
      }
    } catch (error) {
      logger.e(error);
    }
    _db = await openDatabase(
      dbFilePath,
      // onCreate: (db, version) {
      //   print('onCreate!!!');
      //   return db.execute(createAppTables);
      // },
      onOpen: (db) {
        db.execute(createSettingsTable);
      },
      version: 1,
    );
  }

  @override
  Future<List<Map<String, dynamic>>>? query(
    String table, {
    bool? distinct,
    List<String>? columns,
    String? where,
    List<dynamic>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) {
    return _db?.query(
      table,
      distinct: distinct,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
      groupBy: groupBy,
      having: having,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );
  }

  @override
  Future<int>? insert(
    String table,
    Map<String, dynamic> values,
  ) {
    return _db?.insert(table, values);
  }

  @override
  Future<int>? update(
    String table,
    Map<String, dynamic> values, {
    String? where,
    List<dynamic>? whereArgs,
  }) {
    return _db?.update(
      table,
      values,
      whereArgs: whereArgs,
      where: where,
    );
  }

  @override
  Future<void>? execute(String sql, [List<dynamic>? arguments]) {
    return _db?.execute(sql, arguments);
  }

  @override
  Future<int>? delete(String table, {String? where, List<dynamic>? whereArgs}) {
    return _db?.delete(
      table,
      where: where,
      whereArgs: whereArgs,
    );
  }

  @override
  Future<List<Map<String, Object?>>>? rawQuery(
    String sql, [
    List<Object?>? arguments,
  ]) {
    return _db?.rawQuery(sql);
  }

  @override
  Future<void> close() async {
    // test
    _db?.execute(testDrop);
    await _db?.close();
  }

  @override
  Future<void> onClose() async {
    await close();
  }
}
