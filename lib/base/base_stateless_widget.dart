import 'package:flutter/material.dart';

abstract class BaseStatelessWidget extends StatelessWidget{

  Widget buildEmpty() {
    return Center(
      child: Text("Empty"),
    );
  }

  Widget buildError() {
    return Center(
      child: Text("Error"),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}