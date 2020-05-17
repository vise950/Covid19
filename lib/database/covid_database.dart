import 'package:covid19/base/base_database.dart';

class CovidDatabase extends BaseDatabase {
  final tableName = 'covid';

  @override
  String get databaseName => "Covid.db";

  @override
  int get databaseVersion => 1;

  @override
  String get databaseCreateQuery => '''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY,
            data TEXT,
            ricoverati_con_sintomi INTEGER,
            terapia_intensiva INTEGER,
            totale_ospedalizzati INTEGER,
            isolamento_domiciliare INTEGER,
            totale_positivi INTEGER,
            variazione_totale_positivi INTEGER,
            nuovi_positivi INTEGER,
            dimessi_guariti INTEGER,
            deceduti INTEGER,
            totale_casi INTEGER,
            tamponi INTEGER,
            casi_testati INTEGER
          )
          ''';
}