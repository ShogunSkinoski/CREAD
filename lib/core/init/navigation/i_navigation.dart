import 'package:flutter/material.dart';

abstract class INavigationService {
  Future<dynamic> navigateToPage({required String path, Object? data});

  Future<dynamic> navigateToPageClear({required String path, Object? data});

  void navigatePop();

  T? getRouteArgs<T>(BuildContext context);
}
