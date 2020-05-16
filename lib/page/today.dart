import 'package:covid19/base/base_stateless_widget.dart';
import 'package:covid19/bloc/covid_bloc.dart';
import 'package:covid19/bloc/covid_state.dart';
import 'package:covid19/model/covid.dart';
import 'package:covid19/utils/extension.dart';
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
          return _getDailyDataBody(state.covid.last);
        } else if (state is CovidError) {
          return buildError();
        }
      },
    ));

    return Scaffold(body: _body);
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
