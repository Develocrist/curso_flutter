import 'package:flutter/material.dart';

import 'package:eoq_calculator1/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pantalla Principal'),
        ),
        body: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                const Text('Intento de Aplicación 12'),
                MaterialButton(
                  minWidth: 200.0,
                  height: 40.0,
                  onPressed: () {
                    //CODIGO DE NAVEGACION ENTRE VENTANAS CUANDO NO SE TIENEN LAS RUTAS, IGUAL ES COMPLICADO
                    /* final route = MaterialPageRoute(
                      builder: (context) => const VistaLista2Screen(),
                    );
                    Navigator.push(context, route); */
                    //ahora el que se usa con las rutas creadas
                    //Navigator.pushNamed(context, 'listview2'); no funciono, despues se revisa
                  },
                  color: Colors.lightBlue,
                  child: const Text('Ingresar',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ));
  }
}
