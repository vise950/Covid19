import 'package:covid19/database/database_helper.dart';
import 'package:covid19/model/covid.dart';

class LocalRepository {
  static Future<Covid> getDailyData() async {
    return DatabaseHelper.instance.queryRecent();
  }

  static Future<List<Covid>> getAllData() {
   return DatabaseHelper.instance.queryAll();
  }
}
