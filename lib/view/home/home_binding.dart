import 'package:encelade/controller/home.dart';
import 'package:encelade/services/language.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(Get.find<LanguageService>()),
    );
  }
}
