import 'package:covid19/dao/covid_dao.dart';
import 'package:covid19/model/covid.dart';

class CovidLocalRepository {

  //Singleton instance
  CovidLocalRepository._privateConstructor();
  static final CovidLocalRepository _instance = CovidLocalRepository._privateConstructor();
  factory CovidLocalRepository() {
    return _instance;
  }

  Future<List<Covid>> getAllData() {
    return CovidDao().queryAll();
  }
}