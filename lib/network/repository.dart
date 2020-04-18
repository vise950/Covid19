import 'dart:convert';

import 'package:covid19/model/covid.dart';
import 'package:covid19/network/service.dart';

class Repository {
  Future<Covid> getDailyData() async {
    final response = await Service.getTodayData();
    if (response.statusCode >= 200 && response.statusCode < 300)
      return _parseData(response.body).first;
    else
      throw Exception("Failed to daily fetch data");
  }

  Future<List<Covid>> getAllData() async {
    final response = await Service.getAllData();
    if (response.statusCode >= 200 && response.statusCode < 300)
      return _parseData(response.body);
    else
      throw Exception("Failed to all fetch data");
  }

  List<Covid> _parseData(String responseBody) {
    final data = json.decode(responseBody).cast<Map<String, dynamic>>();
    return data.map<Covid>((json) => Covid.fromJson(json)).toList();
  }
}
