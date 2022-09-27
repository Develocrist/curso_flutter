import 'dart:math';

import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora",
      home: MyCalculator(),
    );
    // Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Calculadora básica EOQ'),
    //   ),
    //   body: const Center(
    //     child: Text('Pantalla donde va la calculadora basicaaaa'),
    //   ),
    // );
  }
}

class MyCalculator extends StatefulWidget {
  State<StatefulWidget> createState() => Calculadora();
}

class Calculadora extends State<MyCalculator> {
  final controllerDemanda = TextEditingController();
  final controllerOrden = TextEditingController();
  final controllerCostoUnitario = TextEditingController();
  final controllerMantencion = TextEditingController();
  final controllerDias = TextEditingController();
  final my_form_key = GlobalKey<FormState>();

  String mostrarCantidadOptima = "";
  String mostrarNumOrdenes = "";
  String tiempoReorden = "";
  String campoPuntoReorden = "";

  String costoOrden = "";
  String costoMantencion = "";
  String costoTotal = "";

  //formula para realizar la operacion aritmetica
  void OperacionMatematica() {
    double demanda = double.parse(controllerDemanda.text);
    double orden = double.parse(controllerOrden.text);
    double costoUnitario = double.parse(controllerCostoUnitario.text);
    double costoMantencion = double.parse(controllerMantencion.text);
    double diasTrabajados = double.parse(controllerDias.text);

    //formula cantidad optima
    double cantidadOptima = sqrt((2 * demanda * orden) / costoMantencion);
    String r = cantidadOptima.toStringAsFixed(0);

    //formula numero esperado de ordenes
    double numOrdenes = demanda / cantidadOptima;
    String ordenes = numOrdenes.toStringAsFixed(0);

    //formula tiempo de reorden
    double reOrden = diasTrabajados / numOrdenes;
    String ord = reOrden.toStringAsFixed(0);

    //formula punto de reorden
    double puntoReorden = ((demanda / diasTrabajados) * reOrden);
    String ptoReorden = puntoReorden.toStringAsFixed(0);

    //formula costos
    double totalCostoOrden = ((demanda / cantidadOptima) * orden);
    String tcostoOrden = totalCostoOrden.toStringAsFixed(0);

    double totalCostoMantener = ((cantidadOptima / 2) * costoMantencion);
    String tcostoMantener = totalCostoMantener.toStringAsFixed(0);

    double totalCostoTotal = (demanda * costoUnitario) +
        ((demanda / cantidadOptima) * orden) +
        ((cantidadOptima / 2) * costoMantencion);

    String tcostoTotal = totalCostoTotal.toStringAsFixed(0);

    setState(() {
      mostrarCantidadOptima = 'Cantidad optima de pedido: $r unidades';
      mostrarNumOrdenes = 'Numero de ordenes: $ordenes ';
      tiempoReorden = "Tiempo de reorden: $ord";
      campoPuntoReorden = "Punto de reorden: $ptoReorden";

      costoOrden = "Costo total orden:  $tcostoOrden";
      //costoMantencion = "Costo total mantención: $tcostoMantener" as double;
      costoTotal = "El costo total es de: $tcostoTotal";
    });
  }

  void limpiaCampos() {
    setState(() {
      controllerCostoUnitario.text = "";
      controllerOrden.text = "";
      controllerDemanda.text = "";
      controllerMantencion.text = "";
      controllerDias.text = "";
    });
  }

//parte visual
  @override
  Widget build(BuildContext context) {
    final logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Calculadora EOQ'),
      ),
      body: ListView(key: my_form_key, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(" Demanda (D): "),
            Container(
              width: 60,
              height: 50,
              child: TextFormField(
                controller: controllerDemanda,
                validator: (value) {
                  if (value!.isEmpty) return "Ingresa la demanda";
                },
                keyboardType: TextInputType.number,
              ),
            ),
            const Text("Costo Orden (K): "),
            Container(
              width: 60,
              height: 50,
              child: TextFormField(
                controller: controllerOrden,
                validator: (value) {
                  if (value!.isEmpty) return "Ingresa el costo de orden";
                },
                keyboardType: TextInputType.number,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("Mantención (H): "),
            Container(
              width: 60,
              height: 50,
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controllerMantencion,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Ingresar costo de mantencion";
                    }
                  }),
            ),
            const Text("Costo unitario (i): "),
            Container(
              width: 60,
              height: 50,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controllerCostoUnitario,
                validator: (value) {
                  if (value!.isEmpty) return "Ingresa el costo unitario";
                },
              ),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Dias trabajados: "),
              Container(
                width: 60,
                height: 50,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controllerDias,
                  validator: (value) {
                    if (value!.isEmpty) return "Ingresa la cantidad de dias";
                  },
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: OperacionMatematica,
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
                onPressed: limpiaCampos,
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
        ),
        Container(
          height: 50,
          width: 30,
          decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFFFE2E64), Color(0xFFfF7818)]),
          ),
          //creamos el resultado del textformfield
          child: Center(
            child: Text(
              mostrarCantidadOptima,
              style: const TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        ),
        Container(
          height: 50,
          width: 30,
          decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFFFE2E64), Color(0xFFfF7818)]),
          ),
          //creamos el resultado del textformfield
          child: Center(
            child: Text(
              mostrarNumOrdenes,
              style: const TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        ),
        Container(
          height: 50,
          width: 30,
          decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFFFE2E64), Color(0xFFfF7818)]),
          ),
          //creamos el resultado del textformfield
          child: Center(
            child: Text(
              tiempoReorden,
              style: const TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        ),
        Container(
          height: 50,
          width: 30,
          decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFFFE2E64), Color(0xFFfF7818)]),
          ),
          //creamos el resultado del textformfield
          child: Center(
            child: Text(
              costoOrden,
              style: const TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        ),
        Container(
          height: 50,
          width: 30,
          decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFFFE2E64), Color(0xFFfF7818)]),
          ),
          //creamos el resultado del textformfield
          child: Center(
            child: Text(
              costoTotal,
              style: const TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ]),
    );
  }
}
