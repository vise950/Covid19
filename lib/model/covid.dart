import 'package:covid19/utils/extension.dart';
import 'package:flutter/foundation.dart';

class Covid {
  int id;
  String data;
  int totaleCasi;
  int totalePositivi;
  int totaleGuariti;
  int totaleDeceduti;
  int nuoviPositivi;

  Covid({
    @required this.id,
    @required this.data,
    @required this.totaleCasi,
    @required this.totalePositivi,
    @required this.totaleGuariti,
    @required this.totaleDeceduti,
    @required this.nuoviPositivi,
  });

  // used for parse json response
  factory Covid.fromJson(Map<String, dynamic> map) {
    return Covid(
      id: map['data'].toString().toID,
      data: map['data'],
      totaleCasi: map['totale_casi'],
      totalePositivi: map['totale_positivi'],
      totaleGuariti: map['dimessi_guariti'],
      totaleDeceduti: map['deceduti'],
      nuoviPositivi: map['nuovi_positivi'],
    );
  }

  // map used for db read or write
  factory Covid.fromMap(Map<String, dynamic> map) {
    return Covid(
      id: null,
      data: map['data'],
      totaleCasi: map['totale_casi'],
      totalePositivi: map['totale_positivi'],
      totaleGuariti: map['dimessi_guariti'],
      totaleDeceduti: map['deceduti'],
      nuoviPositivi: map['nuovi_positivi'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'data': data,
      'totale_casi': totaleCasi,
      'totale_positivi': totalePositivi,
      'dimessi_guariti': totaleGuariti,
      'deceduti': totaleDeceduti,
      'nuovi_positivi': nuoviPositivi,
    };
  }
}