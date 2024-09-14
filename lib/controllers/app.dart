import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:un_vacancies/shared/services/preferences_manager.dart';

import '../shared/config/constants.dart';
import '../shared/utils/text_utils.dart';

class AppController extends GetxController {
  final _language = RxString(AppConstants.kDefaultLanguage);

  @override
  void onInit() {
    super.onInit();
    _language(PreferencesManager.getString('language') ??
        AppConstants.kDefaultLanguage);
  }

  void changeLanguage(final String lang) {
    _language(lang);
    PreferencesManager.setString('language', lang);
    Get.updateLocale(Locale(lang));
  }

  String get language => _language.value;
}
