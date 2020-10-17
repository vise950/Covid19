import 'package:covid19/utils/enum.dart';

abstract class CovidEvent {
  const CovidEvent();
}

class FetchData extends CovidEvent {
  final bool forced;
  final DataType type;

  const FetchData({this.forced, this.type});
}