import 'package:encelade/controller/app.dart';
import 'package:encelade/view/app/app_binding.dart';
import 'package:encelade/view/app/navigation.dart';
import 'package:encelade/view/complete/complete_binding.dart';
import 'package:encelade/view/complete/complete_page.dart';
import 'package:encelade/view/history/history_binding.dart';
import 'package:encelade/view/history/history_page.dart';
import 'package:encelade/view/inside_outside/inside_outside_binding.dart';
import 'package:encelade/view/inside_outside/inside_outside_page.dart';
import 'package:encelade/view/draft/new_draft_binding.dart';
import 'package:encelade/view/draft/update_draft_binding.dart';
import 'package:encelade/view/draft/update_draft_page.dart';
import 'package:encelade/view/home/home_binding.dart';
import 'package:encelade/view/draft/new_draft_page.dart';
import 'package:encelade/view/home/home_page.dart';
import 'package:encelade/view/signature/signature_binding.dart';
import 'package:encelade/view/signature/signature_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends GetView<AppController> {
  const App({super.key});

  static const String appTitle = 'Encelade Project';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: Routes.home,
      initialBinding: AppBinding(),
      getPages: [
        GetPage(
          name: Routes.home,
          page: () => HomePage(appTitle: appTitle),
          binding: HomeBinding(),
        ),
        GetPage(
          name: Routes.newDraft,
          page: () => const NewDraftPage(),
          binding: NewDraftBinding(),
        ),
        GetPage(
          name: Routes.updateDraft,
          page: () => const UpdateDraftPage(),
          binding: UpdateDraftBinding(),
        ),
        GetPage(
          name: Routes.clientInsideOutside,
          page: () => const InsideOutsidePage(),
          binding: InsideOutsideBinding(),
        ),
        GetPage(
          name: Routes.signature,
          page: () => const SignaturePage(),
          binding: SignatureBinding(),
        ),
        GetPage(
          name: Routes.complete,
          page: () => const CompletePage(),
          binding: CompleteBinding(),
        ),
        GetPage(
          name: Routes.history,
          page: () => HistoryPage(),
          binding: HistoryBinding(),
        ),
      ],
    );
  }
}
