// Wrapper for DateFormat
//
// Partial overriding of DateFormat with Get.locale usage to show the date in the local format

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