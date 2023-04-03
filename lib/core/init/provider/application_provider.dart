// ignore_for_file: prefer_conditional_assignment

import 'package:cread/core/init/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../navigation/navigation.dart';

//singleton design pattern used to create instancce
class ApplicationProvider {
  ApplicationProvider._init();
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    if (_instance == null) {
      _instance = ApplicationProvider._init();
    }
    return _instance!;
  }

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
    Provider.value(value: NavigationService.instance)
  ];
}
