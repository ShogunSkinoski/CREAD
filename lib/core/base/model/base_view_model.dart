import 'package:cread/core/init/navigation/navigation.dart';
import 'package:flutter/material.dart';

mixin BaseViewModel {
  late BuildContext ctx;

  final NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();
  void dispose();
}
