import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:covid19/model/covid.dart';
import 'package:covid19/model/covid_region.dart';
import 'package:covid19/utils/preferences_helper.dart';

class Util {
  static List<Covid> parseNationalData(String responseBody) {
    final data = json.decode(responseBody).cast<Map<String, dynamic>>();
    return data.map<Covid>((json) => Covid.fromJson(json)).toList();
  }

  static List<Covid> parseRegionalData(String responseBody) {
    final data = json.decode(responseBody).cast<Map<String, dynamic>>();
    return data.map<CovidRegion>((json) => CovidRegion.fromJson(json)).toList();
  }

  static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile;
  }

  static Future<bool> refreshNeeded() async {
    var lastUpdate = await PreferencesHelper.getLastUpdate();
    lastUpdate = lastUpdate.add(Duration(hours: 4));
    if (lastUpdate != null) {
      var now = DateTime.now();
      var update = now.isAfter(lastUpdate);
      return update;
    }
    return true;
  }
}