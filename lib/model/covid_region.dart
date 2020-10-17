import 'package:covid19/model/covid.dart';
import 'package:flutter/foundation.dart';

class CovidRegion extends Covid {
  int codice;
  String denominazione;

  CovidRegion(
      {id,
      data,
      totaleCasi,
      totalePositivi,
      totaleGuariti,
      totaleDeceduti,
      nuoviPositivi,
      @required this.codice,
      @required this.denominazione})
      : super(
            id: id,
            data: data,
            totaleCasi: totaleCasi,
            totalePositivi: totalePositivi,
            totaleGuariti: totaleGuariti,
            totaleDeceduti: totaleDeceduti,
            nuoviPositivi: nuoviPositivi);

  // used for parse json response
  factory CovidRegion.fromJson(Map<String, dynamic> map) {
    return CovidRegion(
        id: map[idKey],
        data: map[dataKey],
        totaleCasi: map[totaleCasiKey],
        totalePositivi: map[totalePositviKey],
        totaleGuariti: map[totaleGuaritiKey],
        totaleDeceduti: map[decedutiKey],
        nuoviPositivi: map[nuoviPositiviKey],
        codice: map[codiceRegioneKey],
        denominazione: map[denominazioneRegioneKey]);
  }

  // map used for db read or write
  factory CovidRegion.fromMap(Map<String, dynamic> map) {
    return CovidRegion(
        id: null,
        data: map[dataKey],
        totaleCasi: map[totaleCasiKey],
        totalePositivi: map[totalePositviKey],
        totaleGuariti: map[totaleGuaritiKey],
        totaleDeceduti: map[decedutiKey],
        nuoviPositivi: map[nuoviPositiviKey],
        codice: map[codiceRegioneKey],
        denominazione: map[denominazioneRegioneKey]);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      idKey: id,
      dataKey: data,
      totaleCasiKey: totaleCasi,
      totalePositviKey: totalePositivi,
      totaleGuaritiKey: totaleGuariti,
      decedutiKey: totaleDeceduti,
      nuoviPositiviKey: nuoviPositivi,
      codiceRegioneKey: codice,
      denominazioneRegioneKey: denominazione
    };
  }
}

final String codiceRegioneKey = 'codice_regione';
final String denominazioneRegioneKey = 'denominazione_regione';
