import 'package:covid19/model/covid.dart';
import 'package:covid19/repository/remote_repository.dart';
import 'package:covid19/repository/repository.dart';
import 'package:flutter/material.dart';

class Today extends StatefulWidget {
  Today({Key key}) : super(key: key);

  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  Future<Covid> _dailyData;

  @override
  void initState() {
    super.initState();
    _dailyData = Repository.getDailyData();
  }

  @override
  Widget build(BuildContext context) {
    Center _body = Center(child: _retrieveData());
    return Scaffold(body: _body);
  }

  FutureBuilder _retrieveData() {
    return FutureBuilder<Covid>(
      future: _dailyData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _getDailyDataBody(snapshot.data);
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
