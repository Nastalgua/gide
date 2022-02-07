import 'package:flutter/material.dart';

import 'package:gide/constants/route_constants.dart';

// UIs
import 'package:gide/ui/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case homeViewRoute:
        return MaterialPageRoute(
            builder: (_) => const Home(
                  key: Key("home_page"),
                ));
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
