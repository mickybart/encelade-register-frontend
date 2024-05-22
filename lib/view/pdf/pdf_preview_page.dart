import 'package:encelade/controller/interfaces/i_pdf_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';

class PdfPreviewPage extends StatelessWidget {
  final IPdfController controller;

  const PdfPreviewPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pp_title'.tr),
        actions: [
          IconButton(
            onPressed: controller.onSharePdf,
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: controller.onPrinting,
            icon: const Icon(Icons.print),
          ),
        ],
      ),
      body: PdfPreview(
        build: controller.onPreview,
        initialPageFormat: controller.initialPageFormat,
        canChangePageFormat: false,
        canChangeOrientation: false,
        useActions: false,
      ),
    );
  }
}
