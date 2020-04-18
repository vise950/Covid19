import 'package:flutter/foundation.dart';

class Covid {
  final String data;
  final int ricoveratiConSintomi;
  final int terapiaIntensiva;
  final int totaleOspedalizzati;
  final int isolamentoDomiciliare;
  final int totalePositivi;
  final int variazionePositivi;
  final int nuoviPositivi;
  final int dimessiGuariti;
  final int deceduti;
  final int totaleCasi;
  final int tamponi;

  Covid(
      {@required this.data,
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
      @required this.tamponi});

  factory Covid.fromJson(Map<String, dynamic> json) {
    return Covid(
      data: json['data'],
      ricoveratiConSintomi: json['ricoverati_con_sintomi'],
      terapiaIntensiva: json['terapia_intensiva'],
      totaleOspedalizzati: json['totale_ospedalizzati'],
      isolamentoDomiciliare: json['isolamento_domiciliare'],
      totalePositivi: json['totale_positivi'],
      variazionePositivi: json['variazione_totale_positivi'],
      nuoviPositivi: json['nuovi_positivi'],
      dimessiGuariti: json['dimessi_guariti'],
      deceduti: json['deceduti'],
      totaleCasi: json['totale_casi'],
      tamponi: json['tamponi'],
    );
  }
}
