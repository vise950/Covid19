import 'package:flutter/foundation.dart';

class Covid {
  int id;
  String data;
  int totaleCasi;
  int totalePositivi;
  int totaleGuariti;
  int totaleDeceduti;
  int nuoviPositivi;

  Covid(
      {@required this.id,
      @required this.data,
      @required this.totaleCasi,
      @required this.totalePositivi,
      @required this.totaleGuariti,
      @required this.totaleDeceduti,
      @required this.nuoviPositivi});

  // used for parse json response
  factory Covid.fromJson(Map<String, dynamic> map) {
    return Covid(
        id: map[idKey],
        data: map[dataKey],
        totaleCasi: map[totaleCasiKey],
        totalePositivi: map[totalePositviKey],
        totaleGuariti: map[totaleGuaritiKey],
        totaleDeceduti: map[decedutiKey],
        nuoviPositivi: map[nuoviPositiviKey]);
  }

  // map used for db read or write
  factory Covid.fromMap(Map<String, dynamic> map) {
    return Covid(
        id: null,
        data: map[dataKey],
        totaleCasi: map[totaleCasiKey],
        totalePositivi: map[totalePositviKey],
        totaleGuariti: map[totaleGuaritiKey],
        totaleDeceduti: map[decedutiKey],
        nuoviPositivi: map[nuoviPositiviKey]
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      idKey: id,
      dataKey: data,
      totaleCasiKey: totaleCasi,
      totalePositviKey: totalePositivi,
      totaleGuaritiKey: totaleGuariti,
      decedutiKey: totaleDeceduti,
      nuoviPositiviKey: nuoviPositivi
    };
  }
}

final String idKey = 'id';
final String dataKey = 'data';
final String totaleCasiKey = 'totale_casi';
final String totalePositviKey = 'totale_positivi';
final String totaleGuaritiKey = 'dimessi_guariti';
final String decedutiKey = 'deceduti';
final String nuoviPositiviKey = 'nuovi_positivi';