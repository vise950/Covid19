import 'package:covid19/model/covid.dart';
import 'package:covid19/repository/repository.dart';
import 'package:covid19/utils/util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class All extends StatefulWidget {
  All({Key key}) : super(key: key);

  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<All> {
  Future<List<Covid>> _allData;

  @override
  void initState() {
    super.initState();
    _allData = Repository.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    Center _body = Center(child: _retrieveData());
    return Scaffold(body: _body);
  }

  FutureBuilder _retrieveData() {
    return FutureBuilder<List<Covid>>(
      future: _allData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _getAllDataBody(snapshot.data.reverse());
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  ListView _getAllDataBody(List<Covid> data) {
    return ListView.separated(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Center(child: _getItemList(data[index])),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget _getItemList(Covid covid) {
    return ExpandablePanel(
        header: _getHeader(covid), expanded: _getContent(covid));
  }

  Widget _getHeader(Covid covid) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          covid.data.formatDate(StringExtension.DATE_FORMAT_TEXT),
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ));
  }

  Widget _getContent(Covid covid) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getRow("Casi totali: ", covid.totaleCasi, Colors.blueGrey),
          _getRow("Totale positivi: ", covid.totalePositivi, Colors.blue),
          _getRow("Totale guariti: ", covid.dimessiGuariti, Colors.green),
          _getRow("Totale deceduti: ", covid.deceduti, Colors.red),
        ]);
  }

  Widget _getRow(String label, dynamic data, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
      child: RichText(
          text: TextSpan(
              text: "$label",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
            TextSpan(
                text: '$data', style: TextStyle(color: color, fontSize: 16))
          ])),
    );
  }
}