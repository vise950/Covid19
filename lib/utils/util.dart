import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:covid19/model/covid.dart';
import 'package:covid19/utils/PreferencesHelper.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Util {

  static List<Covid> parseData(String responseBody) {
    final data = json.decode(responseBody).cast<Map<String, dynamic>>();
    return data.map<Covid>((json) => Covid.fromJson(json)).toList();
  }

  static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile;
  }

  static Future<bool> refreshNeeded() async {
    var lastUpdate = await PreferencesHelper.getLastUpdate();
    lastUpdate = lastUpdate.add(Duration(hours: 12));
    if (lastUpdate != null) {
      var now = DateTime.now();
      var update = now.isAfter(lastUpdate);
      return update;
    }
    return true;
  }
}

//fixme not visible
extension ListExtension on List<dynamic> {
  List reverse() {
    if (this != null)
      return this.reversed.toList();
    else
      return List();
  }
}

extension StringExtension on String {
  static const DATE_FORMAT = 'dd/MM/yyyy';

  get formatDate {
    if (this != null) {
      DateTime _dateTime = DateTime.parse(this);
      return DateFormat(DATE_FORMAT).format(_dateTime);
    }
  }
}
