import 'package:covid19/model/covid.dart';
import 'package:covid19/repository/repository.dart';
import 'package:covid19/utils/util.dart';
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
          return _getAllDataBody(snapshot.data.reversed.toList());
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
          child: Center(child: _getListItem(data[index])),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Column _getListItem(Covid covid) {
    return Column(children: <Widget>[
      Text('Data: ${covid.data.formatDate}'),
      Text('Casi totali: ${covid.totaleCasi}'),
      Text('Totale positivi: ${covid.totalePositivi}'),
      Text('Totale deceduti: ${covid.deceduti}'),
      Text('Totale guariti: ${covid.dimessiGuariti}'),
    ]);
  }
}
