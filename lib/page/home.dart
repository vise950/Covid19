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
  int _selectedIndex = 0;
  final List<Widget> _children = [Today(), All(), Charts()];

  @override
  Widget build(BuildContext context) {
    fetchData(context);

    AppBar _appBar = AppBar(
      title: Text("Covid 19"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            fetchData(context, forced: true);
          },
        ),
      ],
    );
    BottomNavigationBar _bottomNavigationBar = BottomNavigationBar(items: [
      BottomNavigationBarItem(
        icon: new Icon(Icons.today),
        title: new Text('Oggi'),
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.list),
        title: new Text('Lista'),
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.pie_chart),
        title: new Text('Grafici'),
      ),
    ], currentIndex: _selectedIndex, onTap: _onItemTapped);

    return Scaffold(
      appBar: _appBar,
      body: _children.elementAt(_selectedIndex),
      bottomNavigationBar: _bottomNavigationBar,
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
