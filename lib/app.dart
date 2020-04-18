import 'package:covid19/page/home.dart';
import 'package:flutter/material.dart';

class CovidApp extends StatelessWidget {
  final appTitle = "AgriVeneto Flutter";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: appTitle,
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.blue[700],
            primaryColorDark: Colors.blue[900],
            accentColor: Colors.amberAccent),
        home: Home());
  }
}
