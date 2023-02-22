


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:foodbash/screens/createScreen.dart';
import 'package:foodbash/screens/homeScreen.dart';
import 'package:foodbash/screens/locationScreen.dart';

import '../screens/loginScreen.dart';
import '../screens/ursnf.dart';


class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is: ${settings.name}');
    switch (settings.name) {
      case '/loginpage':
        return LoginScreen.route();
      case '/usernotfound':
        return UserNotFound.route();
      case '/create':
        return CreateScreen.route();
      case '/location':
        return LocationScreen.route();
      case '/home':
        return HomeScreen.route();

      default:
        return _errorRoute();
    }
  }


  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(body: Text('Error'),),
        settings: const RouteSettings(name: '/error')
    );
  }
}