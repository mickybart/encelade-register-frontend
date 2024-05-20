import 'package:encelade/controller/record_details.dart';
import 'package:encelade/view/record/widgets/record_details_state.dart';
import 'package:encelade/view/record/widgets/record_details_traces.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RecordDetailsPage extends GetView<RecordDetailsController> {
  const RecordDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          IconButton(
            onPressed: controller.pdf.onSharePdf,
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: controller.pdf.onPrinting,
            icon: const Icon(Icons.print),
          ),
          if (kDebugMode)
            IconButton(
              onPressed: controller.pdf.onPdfPreview,
              icon: const Icon(Icons.picture_as_pdf),
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
              title: 'State',
              child: RecordDetailsState(state: controller.record.state),
            ),
            CardDetails(
                title: 'Summary', child: Text(controller.record.summary)),
            if (controller.record.created != null)
              CardDetails(
                  title: 'Creation date',
                  child: Text(
                      DateFormat.yMMMMd().format(controller.record.created!))),
            if (controller.record.traces.collected != null)
              CardDetails(
                title: 'Collect',
                child: RecordDetailsTraces(
                  trace: controller.record.traces.collected!,
                ),
              ),
            if (controller.record.traces.returned != null)
              CardDetails(
                title: 'Return',
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
