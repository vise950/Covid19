import 'package:covid19/app.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main(){
  initializeDateFormatting('it_IT');

  return runApp(CovidApp());
}