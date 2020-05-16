import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CovidApiClient {
  final String _dataUrl =
      "https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-andamento-nazionale.json";
  final http.Client client;

  CovidApiClient({@required this.client}) : assert(client != null);

  Future<http.Response> getAllData() {
    return this.client.get(_dataUrl);
  }
}