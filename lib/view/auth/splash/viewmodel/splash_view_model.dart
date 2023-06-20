import 'package:cread/core/init/navigation/navigation.dart';
import 'package:cread/view/auth/splash/model/splash_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/app/app_path.dart';
import '../../../../core/constants/app/route_names.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  List<SplashContent> splashItems = [];
  late PageController pageController;
  @observable
  int currentPage = 0;
  @action
  void setCurrentPage(int value) => currentPage = value;
  @action
  void nextPage() {
    if (currentPage < splashItems.length - 1) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
    } else {
      navigateLoginPage();
    }
  }

  @override
  void init() async {
    //get first time
    splashItems = [
      SplashContent(
        title: LocaleKeys.welcome.tr(),
        description: LocaleKeys.first_splash_description.tr(),
        splashPath: AppPath.WelcomeLottie,
      ),
      SplashContent(
        title: "",
        description: LocaleKeys.second_splash_description.tr(),
        splashPath: AppPath.ExplainingLottie,
      ),
      SplashContent(
        title: '',
        description: LocaleKeys.third_splash_description.tr(),
        splashPath: AppPath.LoginLottie,
      ),
    ];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('first_time') ?? true;
    if (isFirstTime) {
      prefs.setBool('first_time', false);
    } else {
      navigateLoginPage();
    }
  }

  initSplashItems() {}

  @override
  void dispose() {}
  @override
  void setContext(BuildContext context) => ctx = context;

  void navigateLoginPage() {
    NavigationService.instance.navigateToPageClear(path: RouteName.LOGIN);
  }
}
