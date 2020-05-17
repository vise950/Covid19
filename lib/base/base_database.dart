import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseDatabase {
  String get databaseName;

  int get databaseVersion;

  String get databaseCreateQuery;

  Database _database;

  Future _initDatabase() async {
    String path = join(await getDatabasesPath(), databaseName);
    return await openDatabase(path,
        version: databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.transaction((txn) async {
      await txn.execute(databaseCreateQuery);
    });
  }

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future close() async {
    if (_database != null) await _database.close();
  }
}
