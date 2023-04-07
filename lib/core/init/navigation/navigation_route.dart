import 'package:cread/view/auth/splash/view/splash.dart';
import 'package:cread/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:cread/core/constants/app/route_names.dart';

import '../../../view/auth/login/view/login_view.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.LOGIN:
        return MaterialPageRoute(
          builder: (context) => LoginView(),
        );
      case RouteName.HOME:
        return MaterialPageRoute(
          builder: (context) => HomeView(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
        );
    }
  }
}
