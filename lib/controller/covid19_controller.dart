import 'package:atividade3/model/covid_model.dart';
import 'package:flutter/cupertino.dart';

class MainController {
  String? covid;
  //campos
  String? confirmando;
  String? morte;
  String? recuperados;

  //ações
  Future<void> obterDados() async {
    //instanciar um obj

    Modelcovid r = Modelcovid();
    r = await Modelcovid.obterDados();
    confirmando = r.totalConfirmed.toString();
    morte = r.totalDeaths.toString();
    recuperados = r.totalRecovered.toString();
  }
}
