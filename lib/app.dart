import 'package:covid19/bloc/covid_bloc.dart';
import 'package:covid19/page/home.dart';
import 'package:covid19/repository/covid_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidApp extends StatelessWidget {
  final CovidRepository covidRepository;

  CovidApp({Key key, @required this.covidRepository})
      : assert(covidRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Covid 19",
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.blue[700],
            primaryColorDark: Colors.blue[900],
            accentColor: Colors.amberAccent),
        home: BlocProvider(
          create: (BuildContext context) =>
              CovidBloc(covidRepository: covidRepository),
          child: Home(),
        ));
  }
}
