import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19/base/base_stateless_widget.dart';
import 'package:covid19/bloc/covid_bloc.dart';
import 'package:covid19/bloc/covid_state.dart';
import 'package:covid19/model/chart_data.dart';
import 'package:covid19/model/covid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Charts extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    Container _body = Container(child: BlocBuilder<CovidBloc, CovidState>(
      builder: (context, state) {
        if (state is CovidEmpty) {
          return buildEmpty();
        } else if (state is CovidLoading) {
          return buildLoading();
        } else if (state is CovidLoaded) {
          return _getChart(_createChartData(state.covid));
        } else if (state is CovidError) {
          return buildError(state.error);
        }
      },
    ));

    return Scaffold(body: _body);
  }

  Widget _getChart(List<charts.Series> series) {
    return new charts.LineChart(series, animate: true, behaviors: [
      new charts.SeriesLegend(),
      new charts.PanAndZoomBehavior()
    ]);
  }

  List<charts.Series<ChartData, int>> _createChartData(List<Covid> data) {
    List<ChartData> _totali = [];
    List<ChartData> _positivi = [];
    List<ChartData> _guariti = [];
    List<ChartData> _deceduti = [];

    charts.Series<ChartData, int> _totaliSeries;
    charts.Series<ChartData, int> _positiviSeries;
    charts.Series<ChartData, int> _guaritiSeries;
    charts.Series<ChartData, int> _decedutiSeries;

    data.asMap().forEach((index, value) => {
      _totali.add(ChartData(index, value.totaleCasi)),
      _positivi.add(ChartData(index, value.totalePositivi)),
      _guariti.add(ChartData(index, value.dimessiGuariti)),
      _deceduti.add(ChartData(index, value.deceduti))
    });

    _totaliSeries = new charts.Series<ChartData, int>(
      id: 'Totali',
      colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.blueGrey),
      domainFn: (ChartData data, _) => data.day,
      measureFn: (ChartData data, _) => data.value,
      data: _totali,
    );

    _positiviSeries = new charts.Series<ChartData, int>(
      id: 'Positivi',
      colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.blue),
      domainFn: (ChartData data, _) => data.day,
      measureFn: (ChartData data, _) => data.value,
      data: _positivi,
    );

    _guaritiSeries = new charts.Series<ChartData, int>(
      id: 'Guariti',
      colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.green),
      domainFn: (ChartData data, _) => data.day,
      measureFn: (ChartData data, _) => data.value,
      data: _guariti,
    );

    _decedutiSeries = new charts.Series<ChartData, int>(
      id: 'Deceduti',
      colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.red),
      domainFn: (ChartData data, _) => data.day,
      measureFn: (ChartData data, _) => data.value,
      data: _deceduti,
    );

    return [_totaliSeries, _positiviSeries, _guaritiSeries, _decedutiSeries];
  }
}