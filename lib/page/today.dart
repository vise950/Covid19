import 'package:covid19/model/covid.dart';
import 'package:covid19/repository/repository.dart';
import 'package:covid19/utils/util.dart';
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

  Widget _getDailyDataBody(Covid covid) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _getCard("Casi totali", covid.totaleCasi, Colors.blueGrey,
                    isFull: true),
                _getCard("Totale positivi", covid.totalePositivi, Colors.blue,
                    isFull: true),
                _getCard("Totale guariti", covid.dimessiGuariti, Colors.green,
                    isFull: true),
                _getCard("Totale deceduti", covid.deceduti, Colors.red,
                    isFull: true),
              ],
            ),
          ),
          SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              _getCard("Nuovi positivi", covid.nuoviPositivi, Colors.yellow,
                  isLeft: true),
              _getCard("Variazione positivi", covid.variazionePositivi,
                  Colors.yellow,
                  isRight: true),
              _getCard("Totale ospedalizzati", covid.totaleOspedalizzati,
                  Colors.amber,
                  isLeft: true),
              _getCard("Ricoverati con sintomi", covid.ricoveratiConSintomi,
                  Colors.amber,
                  isRight: true),
              _getCard(
                  "In terapia intensiva", covid.terapiaIntensiva, Colors.orange,
                  isLeft: true),
              _getCard("In isolamento domiciliare", covid.isolamentoDomiciliare,
                  Colors.orange,
                  isRight: true),
              _getCard("Tamponi", covid.tamponi, Colors.deepOrange,
                  isLeft: true),
              _getCard("Casi testati", covid.casiTestati, Colors.deepOrange,
                  isRight: true),
            ],
          ),
          SliverToBoxAdapter(
              child: Text(
                  "Ultimo aggiornamento: ${covid.data.formatDate(StringExtension.DATE_FORMAT_WITH_HOUR)}",
                  textAlign: TextAlign.end))
        ],
      ),
    );
  }

  Widget _getCard(String label, dynamic data, Color color,
      {bool isFull = false, bool isLeft = false, bool isRight = false}) {
    return Card(
      elevation: 4,
      color: color,
      shape: _getCardShape(isFull, isLeft, isRight),
      child: _getCardContainer(label, data),
    );
  }

  ShapeBorder _getCardShape(bool isFull, bool isLeft, bool isRight) {
    if (isFull) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)));
    } else if (isLeft) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)));
    } else if (isRight) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)));
    } else {
      return RoundedRectangleBorder();
    }
  }

  Widget _getCardContainer(String label, data) {
    return Container(
        margin: EdgeInsets.all(8.0),
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("$label",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            Text("$data", style: TextStyle(color: Colors.black, fontSize: 30))
          ],
        ));
  }
}