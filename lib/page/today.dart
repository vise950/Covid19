import 'package:covid19/base/base_stateless_widget.dart';
import 'package:covid19/bloc/covid_bloc.dart';
import 'package:covid19/bloc/covid_state.dart';
import 'package:covid19/model/covid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Today extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    Container _body = Container(child: BlocBuilder<CovidBloc, CovidState>(
      builder: (context, state) {
        if (state is CovidEmpty) {
          return buildEmpty();
        } else if (state is CovidLoading) {
          return buildLoading();
        } else if (state is CovidLoaded) {
          return _getDailyDataBody(context, state.covid.last);
        } else if (state is CovidError) {
          return buildError(state.error);
        }
        return null;
      },
    ));

    return Scaffold(body: _body, backgroundColor: Colors.white70);
  }

  Widget _getDailyDataBody(BuildContext context, Covid covid) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [SizedBox(height: 160), _getCards(context, covid)],
        ));
  }

  Widget _getCards(BuildContext context, Covid covid) {
    final double _height = MediaQuery.of(context).size.height;
    return Column(children: [
      SizedBox(
        height: 180,
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: _height / 600,
          shrinkWrap: true,
          children: <Widget>[
            _getCard("AAAA", "10000", Colors.blue, context),
            _getCard("AAAA", "10000", Colors.blue, context),
          ],
        ),
      ),
      SizedBox(
        height: 180,
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: _height / 600,
          shrinkWrap: true,
          children: <Widget>[
            _getCard("AAAA", "10000", Colors.blue, context),
            _getCard("AAAA", "10000", Colors.blue, context),
            _getCard("AAAA", "10000", Colors.blue, context),
          ],
        ),
      ),
    ]);
  }

  Widget _getCard(
      String label, dynamic data, Color color, BuildContext context) {
    return Container(
        width: 30,
        child: Card(
          elevation: 4,
          color: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          // child: _getCardContainer(context, label, data),
        ));
  }

  Widget _getCardContainer(BuildContext context, String label, data) {
    final _size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.all(8.0),
        height: 80,
        width: _size.width / 2 - _size.width / 12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("$label",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("$data", style: TextStyle(color: Colors.black, fontSize: 30))
          ],
        ));
  }
}