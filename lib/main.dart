import 'package:cread/core/constants/app/app_constants.dart';
import 'package:cread/core/init/lang/language_manager.dart';
import 'package:cread/core/init/provider/application_provider.dart';
import 'package:flutter/material.dart';
import 'package:cread/core/init/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'core/init/navigation/navigation.dart';
import 'core/init/navigation/navigation_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ...ApplicationProvider.instance.dependItems,
      ],
      child: EasyLocalization(
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: AppConstants.LANG_ASSET_PATH,
        fallbackLocale: LanguageManager.instance.trLocale,
        child: MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<ThemeProvider>().currentTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
