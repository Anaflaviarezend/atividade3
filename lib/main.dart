import 'package:atividade3/controller/covid19_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Buscador de CEP',
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: MainView(),
  ));
}

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  //instanciar  o controller
  MainController controller = MainController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Coronavírus")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image(image: AssetImage("assets/images/COVID.jpg")),
              ElevatedButton.icon(
                  onPressed: () async {
                    await controller.obterDados();
                    setState(() {});
                  },
                  icon: const Icon(Icons.search),
                  label: const Text("ATUALIZAR")),
              Text("Confirmandos ${controller.confirmando}"),
              Text("Mortes ${controller.morte}"),
              Text("Recuperados ${controller.recuperados}"),
            ],
          ),
        ),
      ),
    );
  }
}
