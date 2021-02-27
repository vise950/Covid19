import 'package:covid19/bloc/covid_bloc.dart';
import 'package:covid19/bloc/covid_event.dart';
import 'package:covid19/database/covid_database.dart';
import 'package:covid19/page/all.dart';
import 'package:covid19/page/charts.dart';
import 'package:covid19/page/today.dart';
import 'package:covid19/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    fetchData(context);

    return Scaffold(
      body: Today(),
      backgroundColor: Colors.white70,
    );
  }

  @override
  void dispose() {
    super.dispose();
    CovidDatabase().close();
  }

  void fetchData(BuildContext context, {bool forced = false}) {
    // ignore: close_sinks
    final covidBloc = BlocProvider.of<CovidBloc>(context);
    covidBloc.add(FetchData(forced: forced, type: DataType.national));
  }
}
