import 'package:encelade/services/language.dart';
import 'package:encelade/translations/messages.dart';
import 'package:encelade/view/app/navigation.dart';
import 'package:encelade/view/complete/complete_binding.dart';
import 'package:encelade/view/complete/complete_page.dart';
import 'package:encelade/view/history/history_binding.dart';
import 'package:encelade/view/history/history_page.dart';
import 'package:encelade/view/home/home_binding.dart';
import 'package:encelade/view/home/home_page.dart';
import 'package:encelade/view/inside_outside/inside_outside_binding.dart';
import 'package:encelade/view/inside_outside/inside_outside_page.dart';
import 'package:encelade/view/draft/new_draft_binding.dart';
import 'package:encelade/view/draft/update_draft_binding.dart';
import 'package:encelade/view/draft/update_draft_page.dart';
import 'package:encelade/view/register/register_binding.dart';
import 'package:encelade/view/draft/new_draft_page.dart';
import 'package:encelade/view/register/register_page.dart';
import 'package:encelade/view/pdf/pdf_preview_page.dart';
import 'package:encelade/view/record/record_details_binding.dart';
import 'package:encelade/view/record/record_details_page.dart';
import 'package:encelade/view/signature/signature_binding.dart';
import 'package:encelade/view/signature/signature_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  static const String appTitle = 'Encelade Suite';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      translations: Messages(),
      //locale: Get.deviceLocale, // Set by LanguageService before running App
      fallbackLocale: LanguageService.defaultLocale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: LanguageService.supportedLocales,
      initialRoute: Routes.home,
      // initialBinding: AppBinding(),
      getPages: [
        GetPage(
          name: Routes.home,
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: Routes.register,
          page: () => RegisterPage(),
          binding: RegisterBinding(),
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
        GetPage(
          name: Routes.details,
          page: () => const RecordDetailsPage(),
          binding: RecordDetailsBinding(),
        ),
        GetPage(
          name: Routes.pdf,
          page: () => PdfPreviewPage(controller: Get.arguments),
        ),
      ],
    );
  }
}
