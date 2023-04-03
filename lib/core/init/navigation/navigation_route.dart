import 'package:cread/view/auth/splash/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:cread/core/constants/app/route_names.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
        );
    }
  }
}
