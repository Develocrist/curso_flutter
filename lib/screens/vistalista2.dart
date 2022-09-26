import 'package:flutter/material.dart';

import 'package:eoq_calculator1/router/app_routes.dart';

class VistaLista2Screen extends StatelessWidget {
  final options = const [
    'Calculadora EOQ Básica',
    'Calculadora EOQ con faltante',
    'Opciones'
  ];

  const VistaLista2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Calculadora'),
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: ListView.separated(
        itemBuilder: (context, i) => ListTile(
          title: Text(menuOptions[i].name),
          leading: Icon(menuOptions[i].icon),
          onTap: () {
            Navigator.pushNamed(context, menuOptions[i].route);

            //codigo comentado para complementar el de main.dart para la navegacion
            // final route = MaterialPageRoute(
            //   builder: (context) => const AlertScreen(),
            // );
            // Navigator.push(context, route);
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: menuOptions.length,
      ),
    );
  }
}
