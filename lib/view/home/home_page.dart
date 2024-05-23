import 'package:encelade/controller/home.dart';
import 'package:encelade/services/language.dart';
import 'package:encelade/view/home/widgets/sub_page_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'hp_welcome'.tr,
              style: const TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            ),
            Text('hp_welcome_description'.tr),
            const SizedBox(
              height: 24.0,
            ),
            SubPageSection(
              icon: const Icon(Icons.dataset),
              label: Text('hp_register'.tr),
              description: Text('hp_register_description'.tr),
              onPressed: controller.onRegister,
            ),
            const Spacer(),
            Center(
              child: Obx(
                () => DropdownButton(
                  value: controller.language,
                  items: const [
                    DropdownMenuItem(
                      value: Language.enCa,
                      child: Text('English (Canadian)'),
                    ),
                    DropdownMenuItem(
                      value: Language.frCa,
                      child: Text('Français (Canadien)'),
                    )
                  ],
                  autofocus: false,
                  padding: const EdgeInsets.all(8.0),
                  onChanged: controller.onLanguageChange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
