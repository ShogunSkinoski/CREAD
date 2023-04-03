import 'package:cread/core/init/navigation/i_navigation.dart';
import 'package:cread/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class NavigationService implements INavigationService {
  NavigationService._init();
  //eager singleton
  static final NavigationService _instance = NavigationService._init();

  static NavigationService get instance => _instance;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  bool Function(Route<dynamic> route) get removeAllOldRoutes =>
      (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({required String path, Object? data}) async {
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
  }

  @override
  void navigatePop() {
    navigatorKey.currentState!.pop();
  }

  @override
  T? getRouteArgs<T>(BuildContext context) {
    return context.routeSettings.arguments as T?;
  }
}
