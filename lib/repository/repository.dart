import 'package:covid19/model/covid.dart';
import 'package:covid19/repository/local_repository.dart';
import 'package:covid19/repository/remote_repository.dart';
import 'package:covid19/utils/PreferencesHelper.dart';
import 'package:covid19/utils/util.dart';

class Repository {
  static Future<Covid> getDailyData() async {
    var isConnected = await Util.isConnected();
    var updateNeeded = await Util.refreshNeeded();
    if (isConnected && updateNeeded) {
      PreferencesHelper.setLastUpdate();
      return RemoteRepository.getDailyData();
    } else {
      return LocalRepository.getDailyData();
    }
  }

  static Future<List<Covid>> getAllData() async {
    var isConnected = await Util.isConnected();
    var updateNeeded = await Util.refreshNeeded();
    if (isConnected && updateNeeded) {
      PreferencesHelper.setLastUpdate();
      return RemoteRepository.getAllData();
    } else {
      return LocalRepository.getAllData();
    }
  }
}
