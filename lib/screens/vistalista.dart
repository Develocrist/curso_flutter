//NO PESCAR ESTE CODIGO PORQUE SE DUPLICO EN EL VISTALISTA2.DART
import 'package:flutter/material.dart';

class VistaListaScreen extends StatelessWidget {
  final options = const [
    'Calculadora EOQ Básica',
    'Calculadora EOQ con faltante',
    'Opciones'
  ];

  const VistaListaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora con Faltante'),
        ),
        body: ListView(children: <Widget>[
          const Text('Aqui deberia ir una calculadora con faltante'),
        ]));
  }
}
