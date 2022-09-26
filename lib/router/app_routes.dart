import 'package:flutter/material.dart';

import 'package:eoq_calculator1/models/models.dart';
import 'package:eoq_calculator1/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'listview2';

  static final menuOptions = <MenuOptions>[
    MenuOptions(
        route: 'alert',
        icon: Icons.calculate_outlined,
        name: 'Calculadora EOQ',
        screen: const AlertScreen()), //pantalla de calculadora
    MenuOptions(
        route: 'listview1',
        icon: Icons.list_alt_outlined,
        name: 'Calculadora EOQ con Faltante',
        screen: const VistaListaScreen()), //pantalla con posible uso
    // MenuOptions(
    //     route: 'listview2',
    //     icon: Icons.calculate_outlined,
    //     name: 'Pantalla adicional 2',
    //     screen:
    //         const VistaLista2Screen()), //pantalla con listas de calculadoras
    MenuOptions(
        route: 'card',
        icon: Icons.precision_manufacturing_sharp,
        name: 'Opciones',
        screen: const CardScreen()), //pantalla de opciones
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const VistaLista2Screen(),
    );
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   //CREACION DE RUTAS PARA NAVEGACION
  //   'home': (BuildContext context) => const HomeScreen(),
  //   'listview1': (BuildContext context) => const VistaListaScreen(),
  //   'listview2': (BuildContext context) => const VistaLista2Screen(),
  //   'alert': (BuildContext context) => const AlertScreen(),
  //   'card': (BuildContext context) => const CardScreen(),
  // };

}
