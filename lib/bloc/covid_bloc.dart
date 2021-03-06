import 'package:covid19/bloc/covid_event.dart';
import 'package:covid19/bloc/covid_state.dart';
import 'package:covid19/model/covid.dart';
import 'package:covid19/repository/covid_repository.dart';
import 'package:covid19/utils/enum.dart';
import 'package:covid19/utils/network_util.dart';
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
        List<Covid> data = [];
        switch (event.type) {
          case DataType.national:
            data = await covidRepository.getNationalData(event.forced);
            break;
          case DataType.regional:
            data = await covidRepository.getRegionalData(event.forced);
            break;
        }
        yield CovidLoaded(covid: data);
      } on NetworkException catch (e) {
        yield CovidError(error: e.error);
      } catch (_) {
        yield CovidError();
      }
    }
  }
}