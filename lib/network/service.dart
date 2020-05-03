import 'dart:async';

import 'package:http/http.dart' as http;

const BASE_URL =
    "https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/";
const String ALL_DATA_URL =
    "${BASE_URL}dpc-covid19-ita-andamento-nazionale.json";

class Service {
  static Future<http.Response> getAllData() {
    return http.get(ALL_DATA_URL);
  }
}
