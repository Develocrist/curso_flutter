//NO PESCAR ESTE CODIGO PORQUE SE DUPLICO EN EL VISTALISTA2.DART
import 'package:flutter/material.dart';

class VistaListaScreen extends StatelessWidget {
  const VistaListaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora con Faltante'),
          elevation: 0,
          backgroundColor: Colors.indigo,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(" Demanda (D): "),
                Container(
                  width: 60,
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                  ),
                ),
                const Text("Costo Orden (K)"),
                Container(
                  width: 60,
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Mantención (H): "),
                Container(
                  width: 60,
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                  ),
                ),
                const Text("Costo unitario (i): "),
                Container(
                  width: 60,
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                  ),
                )
              ]),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.amber,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  child: Column(
                    children: const <Widget>[
                      Icon(Icons.calculate_outlined),
                      Text('Calcular')
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: const Color.fromARGB(255, 52, 28, 236),
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  child: Column(
                    children: const <Widget>[
                      Icon(Icons.cleaning_services_outlined),
                      Text('Limpiar')
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 1, 1),
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  child: Column(
                    children: const <Widget>[
                      Icon(Icons.info_outline),
                      Text('Formulas')
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
