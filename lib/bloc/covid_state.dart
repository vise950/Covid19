import 'package:covid19/model/covid.dart';
import 'package:covid19/model/network_error.dart';
import 'package:flutter/foundation.dart';

abstract class CovidState {
  const CovidState();
}

class CovidEmpty extends CovidState {}

class CovidLoading extends CovidState {}

class CovidLoaded extends CovidState {
  final List<Covid> covid;

  const CovidLoaded({@required this.covid}) : assert(covid != null);
}

class CovidError extends CovidState {
  final NetworkError error;

  const CovidError({this.error}) : assert(error != null);
}