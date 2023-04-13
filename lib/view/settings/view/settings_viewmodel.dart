import 'package:cread/core/base/model/base_view_model.dart';
import 'package:cread/core/constants/enums/language_code.dart';
import 'package:cread/core/init/lang/language_manager.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/init/provider/theme_provider.dart';
part 'settings_viewmodel.g.dart';

class SettingViewModel = _SettingViewModelBase with _$SettingViewModel;

abstract class _SettingViewModelBase with Store, BaseViewModel {
  @observable
  bool isDarkMode = false;
  @observable
  String? SelectedLanguage = 'English';

  @action
  void changeLanguage(String? language) {
    switch (language) {
      case "English":
        LanguageManager.instance.changeLanguage(ctx, LanguageCodes.US);
        break;
      case "Turkish":
        LanguageManager.instance.changeLanguage(ctx, LanguageCodes.TR);
        break;
    }
    SelectedLanguage = language;
  }

  @action
  void changeTheme() {
    isDarkMode = !isDarkMode;
    final _themeProvider = Provider.of<ThemeProvider>(ctx, listen: false);
    _themeProvider.changeTheme();
  }

  @override
  void setContext(BuildContext context) => ctx = context;

  @override
  void init() {}
  @override
  void dispose() {}
}
