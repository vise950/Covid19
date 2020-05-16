import 'package:covid19/model/covid.dart';
import 'package:covid19/repository/covid_local_repository.dart';
import 'package:covid19/repository/covid_remote_repository.dart';
import 'package:covid19/utils/preferences_helper.dart';
import 'package:covid19/utils/util.dart';
import 'package:flutter/foundation.dart';

class CovidRepository {
//  static Future<Covid> getDailyData() async {
//    var isConnected = await Util.isConnected();
//    var updateNeeded = await Util.refreshNeeded();
//    if (isConnected && updateNeeded) {
//      PreferencesHelper.setLastUpdate();
//      var data = await RemoteRepository.getAllData();
//      return data.last;
//    } else {
//      return LocalRepository.getDailyData();
//    }
//  }
//
//  static Future<List<Covid>> getAllData() async {
//    var isConnected = await Util.isConnected();
//    var updateNeeded = await Util.refreshNeeded();
//    if (isConnected && updateNeeded) {
//      PreferencesHelper.setLastUpdate();
//      return RemoteRepository.getAllData();
//    } else {
//      return LocalRepository.getAllData();
//    }
//  }

  final CovidRemoteRepository remoteRepository;

  CovidRepository({@required this.remoteRepository}) : assert(remoteRepository != null);

   Future<List<Covid>> getData() {
     return remoteRepository.fetchData();
   }
}