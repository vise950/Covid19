import 'dart:io';

import 'package:covid19/app.dart';
import 'package:covid19/repository/covid_api_client.dart';
import 'package:covid19/repository/covid_local_repository.dart';
import 'package:covid19/repository/covid_remote_repository.dart';
import 'package:covid19/repository/covid_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting(Platform.localeName);
  Intl.defaultLocale = Platform.localeName;

  final CovidRepository covidRepository = CovidRepository(
    remoteRepository: CovidRemoteRepository(
          covidApiClient: CovidApiClient(client: http.Client())),
      localRepository: CovidLocalRepository());

  return runApp(CovidApp(
    covidRepository: covidRepository,
  ));
}