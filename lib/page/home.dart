import 'package:covid19/page/all.dart';
import 'package:covid19/page/charts.dart';
import 'package:covid19/page/today.dart';
import 'package:covid19/database/database_helper.dart';
import 'package:flutter/material.dart';

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
    AppBar _appBar = AppBar(title: Text("Covid 19"));
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
    DatabaseHelper.instance.close();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
