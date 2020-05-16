import 'package:covid19/database/database_helper.dart';
import 'package:covid19/model/covid.dart';

class CovidLocalRepository {
  static Future<Covid> getDailyData() async {
    return DatabaseHelper.instance.queryFirst();
  }

  static Future<List<Covid>> getAllData() {
   return DatabaseHelper.instance.queryAll();
  }
}
