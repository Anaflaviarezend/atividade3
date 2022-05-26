import 'dart:convert';

import 'package:http/http.dart' as http;

class Modelcovid {
  int? totalConfirmed;
  int? totalDeaths;
  int? totalRecovered;

  Modelcovid({this.totalConfirmed, this.totalDeaths, this.totalRecovered});

  Modelcovid.fromJson(Map<String, dynamic> json) {
    totalConfirmed = json['TotalConfirmed'];
    totalDeaths = json['TotalDeaths'];
    totalRecovered = json['TotalRecovered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TotalConfirmed'] = this.totalConfirmed;
    data['TotalDeaths'] = this.totalDeaths;
    data['TotalRecovered'] = this.totalRecovered;
    return data;
  }

  static Future<Modelcovid> obterDados() async {
    var url = Uri.parse('https://api.covid19api.com/world/total');
    var resposta = await http.get(url);
    var json = jsonDecode(resposta.body);
    return Modelcovid.fromJson(json);
  }
}
