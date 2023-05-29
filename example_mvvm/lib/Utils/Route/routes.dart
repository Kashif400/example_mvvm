import 'package:example_mvvm/Utils/Route/routes_name.dart';
import 'package:example_mvvm/View/home_screen.dart';
import 'package:example_mvvm/View/login_screen.dart';
import 'package:flutter/material.dart';

import '../../View/signup_screen.dart';
import '../../View/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen());

      case RouteName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());

      case RouteName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());

      case RouteName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignUpScreen());

      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(
                  body: Center(
                    child: Text('No Route Defined'),
                  ),
                ));
    }
  }
}
