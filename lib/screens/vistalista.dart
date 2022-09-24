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
          title: const Text('Lista Calculadora'),
        ),
        body: ListView(
          children: [
            ...options
                .map((calculadoras) => ListTile(
                      title: Text(calculadoras),
                      leading: const Icon(Icons.calculate_outlined),
                      trailing: const Icon(Icons.arrow_circle_right_outlined),
                      onTap: () {},
                    ))
                .toList(),
            const Divider(),
          ],
        ));
  }
}
