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
                Card(
                  elevation: 4,
                  color: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Container(
                      margin: EdgeInsets.all(8.0),
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Casi totali",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 30),
                          Text("${covid.totaleCasi}",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30))
                        ],
                      )),
                ),
                Card(
                  elevation: 4,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Container(
                      margin: EdgeInsets.all(8.0),
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Totale positivi",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 30),
                          Text("${covid.totalePositivi}",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30))
                        ],
                      )),
                ),
                Card(
                  elevation: 4,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Container(
                      margin: EdgeInsets.all(8.0),
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Totale guariti",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 30),
                          Text("${covid.dimessiGuariti}",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30))
                        ],
                      )),
                ),
                Card(
                  elevation: 4,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Container(
                      margin: EdgeInsets.all(8.0),
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Totale deceduti",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 30),
                          Text("${covid.deceduti}",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30))
                        ],
                      )),
                ),
              ],
            ),
          ),
          SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Card(
                elevation: 4,
                color: Colors.yellow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Container(
                    margin: EdgeInsets.all(8.0),
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Nuovi positivi",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 30),
                        Text("${covid.nuoviPositivi}",
                            style: TextStyle(color: Colors.black, fontSize: 30))
                      ],
                    )),
              ),
              Card(
                elevation: 4,
                color: Colors.yellow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Container(
                    margin: EdgeInsets.all(8.0),
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Variazione positivi",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 30),
                        Text("${covid.variazionePositivi}",
                            style: TextStyle(color: Colors.black, fontSize: 30))
                      ],
                    )),
              ),
              Card(
                elevation: 4,
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Container(
                    margin: EdgeInsets.all(8.0),
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Totale ospedalizzati",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 30),
                        Text("${covid.totaleOspedalizzati}",
                            style: TextStyle(color: Colors.black, fontSize: 30))
                      ],
                    )),
              ),
              Card(
                elevation: 4,
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Container(
                    margin: EdgeInsets.all(8.0),
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Ricoverati con sintomi",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 30),
                        Text("${covid.ricoveratiConSintomi}",
                            style: TextStyle(color: Colors.black, fontSize: 30))
                      ],
                    )),
              ),
              Card(
                elevation: 4,
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Container(
                    margin: EdgeInsets.all(8.0),
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("In terapia intensiva",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 30),
                        Text("${covid.terapiaIntensiva}",
                            style: TextStyle(color: Colors.black, fontSize: 30))
                      ],
                    )),
              ),
              Card(
                elevation: 4,
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Container(
                    margin: EdgeInsets.all(8.0),
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("In isolamento domiciliare",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 30),
                        Text("${covid.isolamentoDomiciliare}",
                            style: TextStyle(color: Colors.black, fontSize: 30))
                      ],
                    )),
              ),
              Card(
                elevation: 4,
                color: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Container(
                    margin: EdgeInsets.all(8.0),
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Tamponi",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 30),
                        Text("${covid.tamponi}",
                            style: TextStyle(color: Colors.black, fontSize: 30))
                      ],
                    )),
              ),
              Card(
                elevation: 4,
                color: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Container(
                    margin: EdgeInsets.all(8.0),
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Casi testati",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 30),
                        Text("${covid.casiTestati}",
                            style: TextStyle(color: Colors.black, fontSize: 30))
                      ],
                    )),
              ),
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
}
