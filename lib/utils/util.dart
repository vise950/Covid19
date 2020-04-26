import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:covid19/model/covid.dart';
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
