import 'dart:typed_data';

import 'package:encelade/view/app/navigation.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

abstract class IPdfController extends GetxController {
  final shareInProgress = false.obs;
  final printingInProgress = false.obs;
  String filename = 'document.pdf';

  IPdfController();

  PdfPageFormat get initialPageFormat => PdfPageFormat.letter.portrait;

  Future<Uint8List> savePdf(PdfPageFormat? format);

  Future<Uint8List> onPreview(PdfPageFormat format) async {
    return savePdf(format);
  }

  Future<void> onPrinting() async {
    printingInProgress(true);

    try {
      await Printing.layoutPdf(
        onLayout: savePdf,
      );
    } finally {
      printingInProgress(false);
    }
  }

  Future<void> onSharePdf() async {
    shareInProgress(true);

    try {
      final result = await Printing.sharePdf(
        bytes: await savePdf(null),
        filename: filename,
      );
      if (!result) {
        throw Exception('An issue occured during sharing !');
      }
    } finally {
      shareInProgress(false);
    }
  }

  void onPdfPreview() {
    Get.toNamed(Routes.pdf, arguments: this);
  }
}
