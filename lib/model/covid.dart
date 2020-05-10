import 'package:covid19/utils/util.dart';
import 'package:flutter/foundation.dart';

class Covid {
  int id;
  String data;
  int ricoveratiConSintomi;
  int terapiaIntensiva;
  int totaleOspedalizzati;
  int isolamentoDomiciliare;
  int totalePositivi;
  int variazionePositivi;
  int nuoviPositivi;
  int dimessiGuariti;
  int deceduti;
  int totaleCasi;
  int tamponi;
  int casiTestati;

  Covid(
      {@required this.id,
      @required this.data,
      @required this.ricoveratiConSintomi,
      @required this.terapiaIntensiva,
      @required this.totaleOspedalizzati,
      @required this.isolamentoDomiciliare,
      @required this.totalePositivi,
      @required this.variazionePositivi,
      @required this.nuoviPositivi,
      @required this.dimessiGuariti,
      @required this.deceduti,
      @required this.totaleCasi,
      @required this.tamponi,
      @required this.casiTestati});

  // used for parse json response
  factory Covid.fromJson(Map<String, dynamic> map) {
    return Covid(
      id: map['data'].toString().toID,
      data: map['data'],
      ricoveratiConSintomi: map['ricoverati_con_sintomi'],
      terapiaIntensiva: map['terapia_intensiva'],
      totaleOspedalizzati: map['totale_ospedalizzati'],
      isolamentoDomiciliare: map['isolamento_domiciliare'],
      totalePositivi: map['totale_positivi'],
      variazionePositivi: map['variazione_totale_positivi'],
      nuoviPositivi: map['nuovi_positivi'],
      dimessiGuariti: map['dimessi_guariti'],
      deceduti: map['deceduti'],
      totaleCasi: map['totale_casi'],
      tamponi: map['tamponi'],
      casiTestati: map['casi_testati'],
    );
  }

  // map used for db read or write
  factory Covid.fromMap(Map<String, dynamic> map) {
    return Covid(
      data: map['data'],
      ricoveratiConSintomi: map['ricoverati_con_sintomi'],
      terapiaIntensiva: map['terapia_intensiva'],
      totaleOspedalizzati: map['totale_ospedalizzati'],
      isolamentoDomiciliare: map['isolamento_domiciliare'],
      totalePositivi: map['totale_positivi'],
      variazionePositivi: map['variazione_totale_positivi'],
      nuoviPositivi: map['nuovi_positivi'],
      dimessiGuariti: map['dimessi_guariti'],
      deceduti: map['deceduti'],
      totaleCasi: map['totale_casi'],
      tamponi: map['tamponi'],
      casiTestati: map['casi_testati'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'data': data,
      'ricoverati_con_sintomi': ricoveratiConSintomi,
      'terapia_intensiva': terapiaIntensiva,
      'totale_ospedalizzati': totaleOspedalizzati,
      'isolamento_domiciliare': isolamentoDomiciliare,
      'totale_positivi': totalePositivi,
      'variazione_totale_positivi': variazionePositivi,
      'nuovi_positivi': nuoviPositivi,
      'dimessi_guariti': dimessiGuariti,
      'deceduti': deceduti,
      'totale_casi': totaleCasi,
      'tamponi': tamponi,
      'casi_testati': casiTestati,
    };
  }
}
