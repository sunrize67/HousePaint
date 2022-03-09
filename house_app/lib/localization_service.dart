import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_app/lang/es_MX.dart';

import 'lang/ar_AE.dart';
import 'lang/en_US.dart';

class LocalizationService extends Translations {
  static final locale = Locale('en', 'US');
  static final fallBackLocale = Locale('en', 'US');

  static final langs = ['English', 'Arabic', 'Spanish'];
  static final locales = [
    Locale('en', 'US'),
    Locale('ar', 'AE'),
    Locale('es', 'MX'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'es_MX': esMX,
        'ar_AE': arAE,
      };

  void changeLocale(String lang) {
    final locale = getLocaleFromLanguaje(lang);
    Get.updateLocale(locale!);
  }

  Locale? getLocaleFromLanguaje(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
