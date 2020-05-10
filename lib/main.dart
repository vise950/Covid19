import 'dart:io';

import 'package:covid19/app.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting(Platform.localeName);
  Intl.defaultLocale = Platform.localeName;

  return runApp(CovidApp());
}