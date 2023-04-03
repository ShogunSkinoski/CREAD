import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  RouteSettings get routeSettings => ModalRoute.of(this)!.settings;
}
