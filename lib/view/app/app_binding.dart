import 'package:encelade/controller/language.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LanguageController());
  }
}