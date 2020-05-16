import 'package:covid19/model/covid.dart';
import 'package:covid19/repository/covid_local_repository.dart';
import 'package:covid19/repository/covid_remote_repository.dart';
import 'package:covid19/utils/preferences_helper.dart';
import 'package:covid19/utils/util.dart';
import 'package:flutter/foundation.dart';

class CovidRepository {

  final CovidRemoteRepository remoteRepository;
  final CovidLocalRepository localRepository;

  CovidRepository({@required this.remoteRepository, this.localRepository})
      : assert(remoteRepository != null && localRepository != null);

  Future<List<Covid>> getData(bool forced) async {
    var isConnected = await Util.isConnected();
    var updateNeeded = await Util.refreshNeeded();

    if (forced) {
      return remoteRepository.fetchData();
    }

    if (isConnected && updateNeeded) {
      PreferencesHelper.setLastUpdate();
      return remoteRepository.fetchData();
    } else {
      return localRepository.getAllData();
    }
  }
}