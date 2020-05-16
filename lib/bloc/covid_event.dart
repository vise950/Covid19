abstract class CovidEvent  {
  const CovidEvent();
}

class FetchData extends CovidEvent {
  final bool forced;

  const FetchData({this.forced});
}