import 'package:encelade/services/language.dart';
import 'package:encelade/view/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await initServices();
  runApp(const App());
}

Future<void> initServices() async {
  await Get.putAsync(() => LanguageService.build());
}
