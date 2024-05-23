import 'dart:ui';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

enum Language {
  enCa,
  frCa,
}

class LanguageService extends GetxService {
  final language = Rx<Language>(Language.enCa);

  static Future<LanguageService> build() async {
    await initializeDateFormatting();
    return LanguageService();
  }

  void onLanguageChange(Language? value) async {
    language.value = value ?? Language.enCa;

    switch (language.value) {
      case Language.enCa:
        await Get.updateLocale(const Locale('en', 'CA'));
        break;
      case Language.frCa:
        await Get.updateLocale(const Locale('fr', 'CA'));
        break;
    }
  }
}