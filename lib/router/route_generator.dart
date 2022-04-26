import 'package:flutter/material.dart';

import 'package:gide/core/constants/route_constants.dart';

// UIs
import 'package:gide/screens/home/home.dart';
import 'package:gide/screens/auth/page/login_page.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case homeViewRoute:
        return MaterialPageRoute(
            builder: (_) => const Home(
                  key: Key("home_page"),
                )
            
            //LoginPage()
            
            
            );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text("Unknown route. Check the route path again."),
        ),
      );
    });
  }
}
