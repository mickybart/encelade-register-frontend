import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GetDateFormat extends DateFormat {
  GetDateFormat([String? newPattern, String? locale]) : super(newPattern, locale ?? Get.locale?.toLanguageTag());

  factory GetDateFormat.yMMMMd([dynamic locale]) {
    return GetDateFormat('yMMMMd', locale);
  }

  factory GetDateFormat.jm([dynamic locale]) {
    return GetDateFormat('jm', locale);
  }
}