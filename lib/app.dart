import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/app.dart';
import 'shared/config/constants.dart';
import 'shared/strings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'views/splash.dart';

import 'shared/config/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Get.put(AppController(), tag: 'app_controller');
    return GetMaterialApp(
      title: 'UNHCR',
      translations: Strings(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      locale: Locale(app.language),
      theme: ThemeData(
          fontFamily: AppConstants.kFontFamily,
          primaryColor: AppColors.kPrimary,
          scaffoldBackgroundColor: Colors.white),
      home: const Splash(),
    );
  }
}
