import 'dart:ui';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

enum Language {
  english,
  french,
}

class LanguageController extends GetxController {
  final language = Rx<Language>(Language.english);

  // static Future<LanguageController> build() async {
  //   await initializeDateFormatting();
  //   return LanguageController();
  // }

  @override
  void onInit() {
    // must be await
    initializeDateFormatting();
    super.onInit();
  }

  void onLanguageChange(Language? value) async {
    language.value = value ?? Language.english;

    switch (language.value) {
      case Language.english:
        await Get.updateLocale(const Locale('en', 'CA'));
        break;
      case Language.french:
        await Get.updateLocale(const Locale('fr', 'CA'));
        break;
    }
  }
}