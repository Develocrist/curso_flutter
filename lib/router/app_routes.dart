import 'package:flutter/material.dart';

import 'package:eoq_calculator1/models/models.dart';
import 'package:eoq_calculator1/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'listview2';

  static final menuOptions = <MenuOptions>[
    //TODO: borrar home
    MenuOptions(
        route: 'home',
        icon: Icons.holiday_village_outlined,
        name: 'List Screen',
        screen: const HomeScreen()), //pantalla principal
    MenuOptions(
        route: 'listview1',
        icon: Icons.list_alt_outlined,
        name: 'Pantalla lista 1',
        screen: const VistaListaScreen()), //pantalla con posible uso
    MenuOptions(
        route: 'listview2',
        icon: Icons.calculate_outlined,
        name: 'Pantalla lista 2',
        screen:
            const VistaLista2Screen()), //pantalla con listas de calculadoras
    MenuOptions(
        route: 'alert',
        icon: Icons.calculate_outlined,
        name: 'Calculadora',
        screen: const AlertScreen()), //pantalla de calculadora
    MenuOptions(
        route: 'card',
        icon: Icons.precision_manufacturing_sharp,
        name: 'Opciones',
        screen: const CardScreen()), //pantalla de opciones
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes(){
    Map<String, Widget Function(BuildContext)>  appRoutes = {};      
      for( final option in menuOptions){
        appRoutes.addAll({option.route: (BuildContext context) => option.screen});
      }
      return appRoutes;
    }
    
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   //CREACION DE RUTAS PARA NAVEGACION
  //   'home': (BuildContext context) => const HomeScreen(),
  //   'listview1': (BuildContext context) => const VistaListaScreen(),
  //   'listview2': (BuildContext context) => const VistaLista2Screen(),
  //   'alert': (BuildContext context) => const AlertScreen(),
  //   'card': (BuildContext context) => const CardScreen(),
  // };
  static Route <dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
