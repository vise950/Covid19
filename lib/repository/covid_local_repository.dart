import 'package:covid19/database/database_helper.dart';
import 'package:covid19/model/covid.dart';

class CovidLocalRepository {
  const CovidLocalRepository();

  Future<List<Covid>> getAllData() {
    return DatabaseHelper.instance.queryAll();
  }
}