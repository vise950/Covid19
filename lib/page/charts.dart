import 'package:covid19/model/chartData.dart';
import 'package:covid19/model/covid.dart';
import 'package:covid19/network/repository.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Charts extends StatefulWidget {
  Charts({Key key}) : super(key: key);

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
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
          var series = _createChartData(snapshot.data);
          return _getChart(series);
//          return _getAllDataBody(snapshot.data.reversed.toList());
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  List<charts.Series<ChartData, int>> _createChartData(List<Covid> data) {
    List<ChartData> _positivi = new List();
    List<ChartData> _deceduti = new List();
    List<ChartData> _guariti = new List();
    List<ChartData> _totali = new List();

    charts.Series<ChartData, int> _positiviSeries;
    charts.Series<ChartData, int> _decedutiSeries;
    charts.Series<ChartData, int> _guaritiSeries;
    charts.Series<ChartData, int> _totaliSeries;

    data.asMap().forEach((index, value) => {
          _positivi.add(ChartData(index, value.totalePositivi)),
          _deceduti.add(ChartData(index, value.deceduti)),
          _guariti.add(ChartData(index, value.dimessiGuariti)),
          _totali.add(ChartData(index, value.totaleCasi))
        });

    _positiviSeries = new charts.Series<ChartData, int>(
      id: 'Positivi',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (ChartData data, _) => data.day,
      measureFn: (ChartData data, _) => data.value,
      data: _positivi,
    );

    _decedutiSeries = new charts.Series<ChartData, int>(
      id: 'Deceduti',
      colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      domainFn: (ChartData data, _) => data.day,
      measureFn: (ChartData data, _) => data.value,
      data: _deceduti,
    );

    _guaritiSeries = new charts.Series<ChartData, int>(
      id: 'Guariti',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (ChartData data, _) => data.day,
      measureFn: (ChartData data, _) => data.value,
      data: _guariti,
    );

    _totaliSeries = new charts.Series<ChartData, int>(
      id: 'Totali',
      colorFn: (_, __) => charts.MaterialPalette.gray.shadeDefault,
      domainFn: (ChartData data, _) => data.day,
      measureFn: (ChartData data, _) => data.value,
      data: _totali,
    );

    return [_positiviSeries, _decedutiSeries, _guaritiSeries, _totaliSeries];
  }

  charts.LineChart _getChart(List<charts.Series> series) {
    return new charts.LineChart(series, animate: true);
  }
}
