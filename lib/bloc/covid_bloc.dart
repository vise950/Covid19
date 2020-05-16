import 'package:covid19/bloc/covid_event.dart';
import 'package:covid19/bloc/covid_state.dart';
import 'package:covid19/model/covid.dart';
import 'package:covid19/repository/covid_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  final CovidRepository covidRepository;

  CovidBloc({@required this.covidRepository}) : assert(covidRepository != null);

  @override
  CovidState get initialState => CovidEmpty();

  @override
  Stream<CovidState> mapEventToState(CovidEvent event) async* {
    if (event is FetchData) {
      yield CovidLoading();
      try {
        final List<Covid> data = await covidRepository.getData();
        yield CovidLoaded(covid: data);
      } catch (_) {
        yield CovidError();
      }
    }
  }
}
