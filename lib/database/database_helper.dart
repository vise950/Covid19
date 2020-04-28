import 'package:covid19/model/covid.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "Covid.db";
  static final _databaseVersion = 1;

  static final _tableName = 'covid';

  static Database _database;
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // make this a singleton class
  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.transaction((txn) async {
      await txn.execute('''
          CREATE TABLE $_tableName (
            data TEXT NOT NULL,
            ricoverati_con_sintomi INTEGER NOT NULL,
            terapia_intensiva INTEGER NOT NULL,
            totale_ospedalizzati INTEGER NOT NULL,
            isolamento_domiciliare INTEGER NOT NULL,
            totale_positivi INTEGER NOT NULL,
            variazione_totale_positivi INTEGER NOT NULL,
            nuovi_positivi INTEGER NOT NULL,
            dimessi_guariti INTEGER NOT NULL,
            deceduti INTEGER NOT NULL,
            totale_casi INTEGER NOT NULL,
            tamponi INTEGER NOT NULL
          )
          ''');
    });
  }

  Future close() async {
    await _database.close();
  }

  Future insert(Covid row) async {
    Database db = await database;
    await db.transaction((txn) async {
      await txn.insert(_tableName, row.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future insertAll(List<Covid> rows) async {
    Database db = await database;
    await db.transaction((txn) async {
      var batch = txn.batch();
      for (var value in rows) {
        batch.insert(_tableName, value.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
      await batch.commit();
    });
  }

  Future update(Covid row) async {
    Database db = await database;
    await db.transaction((txn) async {
      await txn.update(_tableName, row.toMap(),
          where: 'data = ?',
          whereArgs: [row.data],
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future<Covid> queryFirst() async {
    Database db = await database;
    var res = await db.query(_tableName, orderBy: 'data DESC', limit: 1);
    return Covid.fromMap(res.first);
  }

  Future<List<Covid>> queryAll() async {
    Database db = await database;
    var res = await db.query(_tableName, orderBy: 'data');
    return res.map((row) => Covid.fromMap(row)).toList();
  }

  Future deleteAll() async {
    Database db = await database;
    await db.transaction((txn) async {
      await txn.delete(_tableName);
    });
  }
}
