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
  final my_form_key = GlobalKey<FormState>();

  String mostrarImc = "";
  String mostrarNumOrdenes = "";

  //formula para realizar la operacion aritmetica
  void OperacionMatematica() {
    if (my_form_key.currentState!.validate()) {
      double demanda = double.parse(controllerDemanda.text);
      double orden = double.parse(controllerOrden.text);
      double costoUnitario = double.parse(controllerCostoUnitario.text);
      double costoMantencion = double.parse(controllerMantencion.text);

      double cantidadOptima = sqrt((2 * demanda * orden) / costoMantencion);
      String r = cantidadOptima.toStringAsFixed(0);
      double numOrdenes = demanda / cantidadOptima;
      String ordenes = numOrdenes.toStringAsFixed(0);

      setState(() {
        mostrarImc = 'La cantidad optima de pedido es de $r unidades';
        mostrarNumOrdenes = 'El numero de ordenes esperado es de $ordenes ';
      });
    }
  }

//parte visual
  @override
  Widget build(BuildContext context) {
    final logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora EOQ'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Form(
        key: my_form_key,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              // Container(
              //   width: 500,
              //   height: 130,
              //   decoration: const BoxDecoration(
              //       color: Color.fromARGB(255, 118, 132, 202),
              //       borderRadius: BorderRadius.only(
              //         bottomLeft: Radius.circular(80),
              //         bottomRight: Radius.circular(80),
              //       )),
              //   // child: Stack(
              //   //   children: <Widget>[
              //   //     Align(
              //   //       alignment: Alignment.center,
              //   //       child: new Image(
              //   //         width: 200.0,
              //   //         height: 150.0,
              //   //         image: new AssetImage('assets/images/iconagii2.png'),
              //   //       ),
              //   //     )
              //   //   ],
              //   // ),
              // ),

              //agregamos otro container
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(children: [
                  Container(
                    width: 220,
                    height: 80,
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 5)
                        ]),
                    child: TextFormField(
                      controller: controllerDemanda,
                      validator: (value) {
                        if (value!.isEmpty) return "Ingresa la demanda";
                      },
                      decoration: const InputDecoration(
                          hintText: "Ingresar demanda",
                          icon: Icon(Icons.account_balance_wallet_outlined,
                              color: Colors.purpleAccent)),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ]),
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(children: [
                  Container(
                    width: 220,
                    height: 80,
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 5)
                        ]),
                    child: TextFormField(
                      controller: controllerOrden,
                      validator: (value) {
                        if (value!.isEmpty) return "Ingresa el costo de orden";
                      },
                      decoration: const InputDecoration(
                          hintText: "Ingresar costo orden",
                          icon: Icon(Icons.account_balance_wallet_outlined,
                              color: Colors.purpleAccent)),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ]),
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(children: [
                  Container(
                    width: 220,
                    height: 80,
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 5)
                        ]),
                    child: TextFormField(
                      controller: controllerCostoUnitario,
                      validator: (value) {
                        if (value!.isEmpty) return "Ingresa el costo unitario";
                      },
                      decoration: const InputDecoration(
                          hintText: "Costo unitario",
                          icon: Icon(Icons.account_balance_wallet_outlined,
                              color: Colors.purpleAccent)),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ]),
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(children: [
                  Container(
                    width: 220,
                    height: 80,
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 5)
                        ]),
                    child: TextFormField(
                      controller: controllerMantencion,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Ingresar costo de mantencion";
                        }
                      },
                      decoration: const InputDecoration(
                          hintText: "Costo Mantención",
                          icon: Icon(Icons.account_balance_wallet_outlined,
                              color: Colors.purpleAccent)),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ]),
              ),
              const Divider(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    onPressed: OperacionMatematica,
                    style: TextButton.styleFrom(
                      primary: Colors.teal,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    child: Column(
                      children: const <Widget>[
                        Icon(Icons.person),
                        Text('Calcular')
                      ],
                    ),
                  ),
                  const VerticalDivider(),
                  TextButton(
                    onPressed: OperacionMatematica,
                    style: TextButton.styleFrom(
                      primary: Colors.amber,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    child: Column(
                      children: const <Widget>[
                        Icon(Icons.person),
                        Text('Calculamos')
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 40.0,
              ),
              Container(
                height: 150,
                width: 300,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFFFE2E64), Color(0xFFfF7818)]),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                //creamos el resultado del textformfield
                child: Center(
                  child: Text(
                    mostrarImc,
                    style: const TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Divider(),
              Container(
                height: 150,
                width: 300,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFFFE2E64), Color(0xFFfF7818)]),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
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
            ],
          ),
        ),
      ),
    );
  }
}
