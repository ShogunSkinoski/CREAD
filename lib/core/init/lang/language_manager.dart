// ignore_for_file: prefer_conditional_assignment

import 'package:cread/core/constants/enums/language_code.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageManager {
  LanguageManager._init();
  static LanguageManager? _instance;
  static LanguageManager get instance {
    if (_instance == null) {
      _instance = LanguageManager._init();
    }
    return _instance!;
  }

  Locale get enLocale => const Locale('en', 'US');
  Locale get trLocale => const Locale('tr', 'TR');

  List<Locale> get supportedLocales => [enLocale, trLocale];

  void changeLanguage(BuildContext context, LanguageCodes languageCode) {
    context.setLocale(getLocale(languageCode));
  }

  Locale getLocale(LanguageCodes languageCode) {
    switch (languageCode) {
      case LanguageCodes.TR:
        return trLocale;
      case LanguageCodes.US:
        return enLocale;
      default:
        return enLocale;
    }
  }
}
