import 'package:flutter/material.dart';
import '../Screens/Homepage/UI/homepage.dart';


class RouteGenerator {

  Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case '/homepage':
        return MaterialPageRoute(
          builder: (_) => const Homepage(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
