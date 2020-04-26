import 'package:covid19/model/covid.dart';
import 'package:covid19/repository/local_repository.dart';
import 'package:covid19/repository/remote_repository.dart';
import 'package:covid19/utils/util.dart';

//todo fetch if is new date
class Repository {
  static Future<Covid> getDailyData() async {
    var isConnected = await Util.isConnected();
    if (isConnected) {
      return RemoteRepository.getDailyData();
    } else {
      return LocalRepository.getDailyData();
    }
  }

  static Future<List<Covid>> getAllData() async {
    var isConnected = await Util.isConnected();
    if (isConnected) {
      return RemoteRepository.getAllData();
    } else {
      return LocalRepository.getAllData();
    }
  }
}
