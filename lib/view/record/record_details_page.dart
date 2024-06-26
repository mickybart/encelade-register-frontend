// A Record Details page
//
// Display all informations relative to a record in the register.
//
// Features supported:
// - PDF Sharing
// - PDF Printing
// - PDF Preview

import 'package:encelade/controller/record_details.dart';
import 'package:encelade/translations/get_date_format.dart';
import 'package:encelade/view/record/widgets/record_details_state.dart';
import 'package:encelade/view/record/widgets/record_details_traces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordDetailsPage extends GetView<RecordDetailsController> {
  const RecordDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rdp_title'.tr),
        actions: [
          IconButton(
            onPressed: controller.pdf.onSharePdf,
            icon: const Icon(Icons.share),
            tooltip: 'tooltip_share_pdf'.tr,
          ),
          IconButton(
            onPressed: controller.pdf.onPrinting,
            icon: const Icon(Icons.print),
            tooltip: 'tooltip_print'.tr,
          ),
          IconButton(
            onPressed: controller.pdf.onPdfPreview,
            icon: const Icon(Icons.picture_as_pdf),
            tooltip: 'tooltip_pdf'.tr,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(controller.id),
            CardDetails(
              title: 'record_state'.tr,
              child: RecordDetailsState(state: controller.record.state),
            ),
            CardDetails(
                title: 'record_summary'.tr,
                child: Text(controller.record.summary)),
            if (controller.record.created != null)
              CardDetails(
                  title: 'record_creation_date'.tr,
                  child: Text(GetDateFormat.yMMMMd()
                      .format(controller.record.created!))),
            if (controller.record.traces.collected != null)
              CardDetails(
                title: 'record_collect'.tr,
                child: RecordDetailsTraces(
                  trace: controller.record.traces.collected!,
                ),
              ),
            if (controller.record.traces.returned != null)
              CardDetails(
                title: 'record_return'.tr,
                child: RecordDetailsTraces(
                  trace: controller.record.traces.returned!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CardDetails extends StatelessWidget {
  final String title;
  final Widget child;

  const CardDetails({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          child,
        ],
      ),
    );
  }
}
