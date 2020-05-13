import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:covid19/model/covid.dart';
import 'package:covid19/utils/preferences_helper.dart';
import 'package:intl/intl.dart';

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
    lastUpdate = lastUpdate.add(Duration(hours: 4));
    if (lastUpdate != null) {
      var now = DateTime.now();
      var update = now.isAfter(lastUpdate);
      return update;
    }
    return true;
  }
}

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
  static const DATE_FORMAT_FOR_ID = 'yyyyMMdd';
  static const DATE_FORMAT_TEXT = 'EEEE d MMMM yyyy';
  static const DATE_FORMAT_WITH_HOUR = 'dd/MM/yyyy HH:mm';

  formatDate(String pattern) {
    if (this != null) {
      DateTime _dateTime = DateTime.parse(this);
      return DateFormat(pattern).format(_dateTime);
    }
  }

  get toID {
    if (this != null) {
      DateTime _dateTime = DateTime.parse(this);
      var id = DateFormat(DATE_FORMAT_FOR_ID).format(_dateTime);
      return int.tryParse(id);
    }
  }
}
