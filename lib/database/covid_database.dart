import 'package:covid19/base/base_database.dart';

class CovidDatabase extends BaseDatabase {

  //Singleton instance
  CovidDatabase._privateConstructor();
  static final CovidDatabase _instance = CovidDatabase._privateConstructor();
  factory CovidDatabase() {
    return _instance;
  }

  final tableName = 'covid';

  @override
  String get databaseName => "Covid.db";

  @override
  int get databaseVersion => 1;

  @override
  String get databaseCreateQuery => '''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            data TEXT,
            totale_casi INTEGER,
            totale_positivi INTEGER,
            dimessi_guariti INTEGER,
            deceduti INTEGER,
            nuovi_positivi INTEGER,
            codice_regione INTEGER,
            denominazione_regione TEXT
          )
          ''';
}