import 'package:encelade/controller/language.dart';
import 'package:encelade/view/app/navigation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final LanguageController _lang;

  HomeController(this._lang);

  Language get language => _lang.language.value;
  Function(Language? value) get onLanguageChange => _lang.onLanguageChange;

  void onRegister() {
    Get.toNamed(Routes.register);
  }
}