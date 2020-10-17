import 'package:covid19/dao/covid_dao.dart';
import 'package:covid19/model/covid.dart';
import 'package:covid19/model/covid_region.dart';
import 'package:covid19/model/network_error.dart';
import 'package:covid19/utils/network_util.dart';
import 'package:covid19/utils/util.dart';
import 'package:flutter/foundation.dart';

import 'covid_api_client.dart';

class CovidRemoteRepository {
  final CovidApiClient covidApiClient;

  CovidRemoteRepository({@required this.covidApiClient}) : assert(covidApiClient != null);

  Future<List<Covid>> fetchNationDataData() async {
    final response = await this.covidApiClient.getNationData();
    if (response.statusCode != 200) {
      throw NetworkException(
          error: NetworkError(response.statusCode, response.reasonPhrase));
    }
    var data = Util.parseNationalData(response.body);
    CovidDao().insertAll(data);
    return data;
  }

  Future<List<CovidRegion>> fetchRegionalData() async {
    final response = await this.covidApiClient.getRegionalData();
    if (response.statusCode != 200) {
      throw NetworkException(
          error: NetworkError(response.statusCode, response.reasonPhrase));
    }
    var data = Util.parseRegionalData(response.body);
    CovidDao().insertAll(data);
    return data;
  }
}