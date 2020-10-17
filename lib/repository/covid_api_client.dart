import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CovidApiClient {
  static String _baseUrl =
      "https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/";
  final String _nationalUrl =
      "${_baseUrl}dpc-covid19-ita-andamento-nazionale.json";
  final String _regionalUrl = "${_baseUrl}dpc-covid19-ita-regioni-latest.json";

  final http.Client client;

  CovidApiClient({@required this.client}) : assert(client != null);

  Future<http.Response> getNationData() {
    return this.client.get(_nationalUrl);
  }

  Future<http.Response> getRegionalData() {
    return this.client.get(_regionalUrl);
  }
}