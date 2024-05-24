import 'package:encelade/services/language.dart';
import 'package:encelade/view/app/navigation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final LanguageService _lang;

  HomeController(this._lang);

  String get language => _lang.language.value;
  Function(String? value) get onLanguageChange => _lang.onLanguageChange;

  void onRegister() {
    Get.toNamed(Routes.register);
  }
}