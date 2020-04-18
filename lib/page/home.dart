import 'package:covid19/model/covid.dart';
import 'package:covid19/network/repository.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Covid> _dailyData;
  Future<List<Covid>> _allData;

  @override
  void initState() {
    super.initState();
    _dailyData = Repository().getDailyData();
    _allData = Repository().getAllData();
  }

  @override
  Widget build(BuildContext context) {
    AppBar _appBar = AppBar(title: Text("Covid 19"));
    Center _body = Center(child: _retrieveData());
    return Scaffold(appBar: _appBar, body: _body);
  }

  FutureBuilder _retrieveData() {
    return FutureBuilder(
      future: Future.wait([_dailyData,_allData]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _getDailyDataBody(snapshot.data[0]);
          //todo
//          return _getAllDataBody(snapshot.data[1]);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  Column _getDailyDataBody(Covid covid) {
    return Column(
      children: <Widget>[
        RichText(
            text: TextSpan(
                text: 'Casi totali: ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
              TextSpan(
                  text: '${covid.totaleCasi}',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 18))
            ])),
        RichText(
            text: TextSpan(
                text: 'Totale positivi: ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
              TextSpan(
                  text: '${covid.totalePositivi}',
                  style: TextStyle(color: Colors.blue, fontSize: 18))
            ])),
        RichText(
            text: TextSpan(
                text: 'Nuovi casi: ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
              TextSpan(
                  text: '${covid.nuoviPositivi}',
                  style: TextStyle(color: Colors.blue, fontSize: 18))
            ])),
        RichText(
            text: TextSpan(
                text: 'Totale positivi: ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
              TextSpan(
                  text: '${covid.variazionePositivi}',
                  style: TextStyle(color: Colors.blue, fontSize: 18))
            ])),
        RichText(
            text: TextSpan(
                text: 'Totale deceduti: ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
              TextSpan(
                  text: '${covid.deceduti}',
                  style: TextStyle(color: Colors.red, fontSize: 18))
            ])),
        RichText(
            text: TextSpan(
                text: 'Totale guariti: ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
              TextSpan(
                  text: '${covid.dimessiGuariti}',
                  style: TextStyle(color: Colors.green, fontSize: 18))
            ]))
      ],
    );
  }
}
