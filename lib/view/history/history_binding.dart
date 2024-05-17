import 'package:encelade/controller/history.dart';
import 'package:encelade/controller/interfaces/i_pdf_controller.dart';
import 'package:encelade/controller/pdf/history_pdf.dart';
import 'package:encelade/model/remote_register_provider.dart';
import 'package:get/get.dart';

class HistoryBinding extends Bindings {
  static String pdfTag = 'history';

  @override
  void dependencies() {
    Get.put<IPdfController>(HistoryPdfController(), tag: pdfTag);
    Get.put(
      HistoryController(
        Get.find<RemoteRegisterProvider>(),
        Get.find<IPdfController>(tag: pdfTag) as HistoryPdfController,
      ),
    );
  }
}
