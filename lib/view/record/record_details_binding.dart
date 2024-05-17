import 'package:encelade/controller/interfaces/i_pdf_controller.dart';
import 'package:encelade/controller/pdf/record_details_pdf.dart';
import 'package:encelade/controller/record_details.dart';
import 'package:encelade/model/remote_register_provider.dart';
import 'package:encelade/model/types/record.dart';
import 'package:get/get.dart';

class RecordDetailsBinding extends Bindings {
  static String pdfTag = 'record';

  @override
  void dependencies() {
    final Record record = Get.arguments;

    Get.put<IPdfController>(RecordDetailsPdfController(record), tag: pdfTag);

    Get.put(
      RecordDetailsController(
        Get.find<RemoteRegisterProvider>(),
        record,
        Get.find<IPdfController>(tag: pdfTag) as RecordDetailsPdfController,
      ),
    );
  }
}