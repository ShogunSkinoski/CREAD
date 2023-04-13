import 'package:cread/view/auth/splash/view/splash.dart';
import 'package:cread/view/home/home_view.dart';
import 'package:cread/view/market/view/market_view.dart';
import 'package:cread/view/profile/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:cread/core/constants/app/route_names.dart';

import '../../../view/auth/login/view/login_view.dart';
import '../../../view/auth/register/view/register_view.dart';
import '../../../view/settings/view/settings_view.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.LOGIN:
        //animation
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => LoginView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(0.0, 1.0);
            var end = Offset.zero;
            var tween = Tween(begin: begin, end: end);
            var offsetAnimation = animation.drive(tween);
            return child;
          },
        );
      case RouteName.REGISTER:
        return MaterialPageRoute(
          builder: (context) => RegisterView(),
        );
      case RouteName.HOME:
        return MaterialPageRoute(
          builder: (context) => HomeView(),
        );
      case RouteName.MARKET:
        return MaterialPageRoute(
          builder: (context) => MarketView(),
        );
      case RouteName.PROFILE:
        return MaterialPageRoute(
          builder: (context) => ProfileView(),
        );
      case RouteName.SETTINGS:
        return MaterialPageRoute(
          builder: (context) => SettingsView(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
        );
    }
  }
}
