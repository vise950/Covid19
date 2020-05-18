import 'package:covid19/base/base_dao.dart';
import 'package:covid19/database/covid_database.dart';
import 'package:covid19/model/covid.dart';
import 'package:sqflite/sqflite.dart';

class CovidDao  implements BaseDao<Covid> {

  //Singleton instance
  CovidDao._privateConstructor();
  static final CovidDao _instance = CovidDao._privateConstructor();
  factory CovidDao() {
    return _instance;
  }

  final CovidDatabase _covidDB = CovidDatabase();

  @override
  Future insert(Covid t) async {
    final db = await _covidDB.database;
    await db.transaction((txn) async {
      await txn.insert(_covidDB.tableName, t.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  @override
  Future insertAll(List<Covid> t) async {
    final db = await _covidDB.database;
    await db.transaction((txn) async {
      var batch = txn.batch();
      for (var value in t) {
        batch.insert(_covidDB.tableName, value.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
      await batch.commit();
    });
  }

  @override
  Future update(Covid t) async {
    final db = await _covidDB.database;
    await db.transaction((txn) async {
      await txn.update(_covidDB.tableName, t.toMap(),
          where: 'id = ?',
          whereArgs: [t.id],
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  @override
  Future delete(Covid t) async {
    final db = await _covidDB.database;
    await db.transaction((txn) async {
      await txn.delete(_covidDB.tableName, where: 'id = ?', whereArgs: [t.id]);
    });
  }

  @override
  Future deleteAll() async {
    final db = await _covidDB.database;
    await db.transaction((txn) async {
      await txn.delete(_covidDB.tableName);
    });
  }

  //fixme improve with query param
  @override
  Future<Covid> query() async {
    final db = await _covidDB.database;
    var res =
        await db.query(_covidDB.tableName, orderBy: 'data DESC', limit: 1);
    return Covid.fromMap(res.first);
  }

  @override
  Future<List<Covid>> queryAll() async {
    final db = await _covidDB.database;
    var res = await db.query(_covidDB.tableName, orderBy: 'data');
    return res.map((row) => Covid.fromMap(row)).toList();
  }
}
