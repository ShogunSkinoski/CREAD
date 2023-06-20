import 'package:cread/core/constants/app/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/init/navigation/navigation.dart';
part 'drawer_viewmodel.g.dart';

class DrawerViewModel = _DrawerViewModelBase with _$DrawerViewModel;

abstract class _DrawerViewModelBase with Store, BaseViewModel {
  Future<void> navigateToHomePage() async {
    await NavigationService.instance.navigateToPageClear(path: RouteName.HOME);
  }

  Future<void> navigateToProfilePage() async {
    await NavigationService.instance
        .navigateToPageClear(path: RouteName.PROFILE);
  }

  Future<void> navigateToSettingsPage() async {
    await NavigationService.instance
        .navigateToPageClear(path: RouteName.SETTINGS);
  }

  Future<void> navigateToMarketPage() async {
    await NavigationService.instance
        .navigateToPageClear(path: RouteName.MARKET);
  }

  Future<void> navigateToLibraryPage() async {
    await NavigationService.instance
        .navigateToPageClear(path: RouteName.LIBRARY);
  }

  Future<void> navigateToStoragePage() async {
    await NavigationService.instance
        .navigateToPageClear(path: RouteName.STORAGE);
  }

  @override
  void setContext(BuildContext context) => ctx = context;
  @override
  void init() {}
  @override
  void dispose() {}
}
