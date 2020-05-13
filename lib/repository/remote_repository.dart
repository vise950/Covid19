import 'package:covid19/database/database_helper.dart';
import 'package:covid19/model/covid.dart';
import 'package:covid19/network/service.dart';
import 'package:covid19/utils/util.dart';

class RemoteRepository {
  static Future<List<Covid>> getAllData() async {
    final response = await Service.getAllData();
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = Util.parseData(response.body);
      DatabaseHelper.instance.insertAll(data);
      return data;
    } else
      throw Exception("Failed to all fetch data");
  }
}