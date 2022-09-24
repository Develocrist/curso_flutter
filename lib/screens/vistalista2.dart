import 'package:eoq_calculator1/screens/alert_screen.dart';
import 'package:flutter/material.dart';

class VistaLista2Screen extends StatelessWidget {
  final options = const [
    'Calculadora EOQ Básica',
    'Calculadora EOQ con faltante',
    'Opciones'
  ];

  const VistaLista2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Calculadora duplicado'),
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(options[index]),
          leading: const Icon(
            Icons.calculate_outlined,
            color: Colors.indigo,
          ),
          trailing: const Icon(Icons.arrow_circle_right_outlined),
          onTap: () {
            Navigator.pushNamed(context, 'card');

            //codigo comentado para complementar el de main.dart para la navegacion
            // final route = MaterialPageRoute(
            //   builder: (context) => const AlertScreen(),
            // );
            // Navigator.push(context, route);
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
