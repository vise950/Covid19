import 'package:covid19/model/covid.dart';
import 'package:covid19/model/covid_region.dart';
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

  Future<List<Covid>> getNationalData(bool forced) async {
    var isConnected = await Util.isConnected();
    var updateNeeded = await Util.refreshNeeded();

    if (forced) {
      return remoteRepository.fetchNationDataData();
    }

    if (isConnected && updateNeeded) {
      PreferencesHelper.setLastUpdate();
      return remoteRepository.fetchNationDataData();
    } else {
      return localRepository.getNationData();
    }
  }

  Future<List<CovidRegion>> getRegionalData(bool forced) async {
    var isConnected = await Util.isConnected();
    var updateNeeded = await Util.refreshNeeded();

    if (forced) {
      return remoteRepository.fetchRegionalData();
    }

    if (isConnected && updateNeeded) {
      PreferencesHelper.setLastUpdate();
      return remoteRepository.fetchRegionalData();
    } else {
      return localRepository.getRegionalData();
    }
  }
}