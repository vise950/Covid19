import 'package:covid19/model/network_error.dart';
import 'package:flutter/material.dart';

abstract class BaseStatelessWidget extends StatelessWidget{

  Widget buildEmpty() {
    return Center(
      child: Text("Empty"),
    );
  }

  Widget buildError(NetworkError networkError) {
    return Center(
      child: Text(
          "Error\nstatus code: ${networkError.statusCode}\nmessage: ${networkError.message}"),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}