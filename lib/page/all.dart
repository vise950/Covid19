import 'package:covid19/base/base_stateless_widget.dart';
import 'package:covid19/bloc/covid_bloc.dart';
import 'package:covid19/bloc/covid_state.dart';
import 'package:covid19/model/covid.dart';
import 'package:covid19/utils/extension.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class All extends BaseStatelessWidget {

  @override
  Widget build(BuildContext context) {
    Container _body = Container(child: BlocBuilder<CovidBloc, CovidState>(
      builder: (context, state) {
        if (state is CovidEmpty) {
          return buildEmpty();
        } else if (state is CovidLoading) {
          return buildLoading();
        } else if (state is CovidLoaded) {
          return _getAllDataBody(state.covid.reverse());
        } else if (state is CovidError) {
          return buildError(state.error);
        }
      },
    ));

    return Scaffold(body: _body);
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