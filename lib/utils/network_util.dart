import 'package:covid19/model/network_error.dart';
import 'package:flutter/foundation.dart';

class NetworkException extends Error {
  final NetworkError error;

  NetworkException({@required this.error}) : assert(error != null);
}