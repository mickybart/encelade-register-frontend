// Generate Record Details content in PDF

import 'dart:typed_data';

import 'package:encelade/model/types/record.dart';
import 'package:encelade/model/types/record_state.dart';
import 'package:encelade/model/types/traces.dart';
import 'package:encelade/translations/get_date_format.dart';
import 'package:encelade/view/record/styles/record_style.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Uint8List> saveRecordDetailsPdf(
    PdfPageFormat? format, Record record) async {
  final pdf = Document(title: record.id);

  pdf.addPage(
    MultiPage(
      orientation: PageOrientation.portrait,
      theme: ThemeData.withFont(
        base: await PdfGoogleFonts.openSansRegular(),
        bold: await PdfGoogleFonts.openSansBold(),
        icons: await PdfGoogleFonts.materialIcons(),
      ),
      pageFormat: format ?? PdfPageFormat.letter.portrait,
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (context) => _header(context, record.id),
      footer: (context) => _footer(context),
      build: (context) => [
        ..._sectionDetails(
          'record_state'.tr,
          _recordDetailsState(record.state),
        ),
        ..._sectionDetails(
          'record_summary'.tr,
          Paragraph(text: record.summary),
        ),
        if (record.created != null)
          ..._sectionDetails(
            'record_creation_date'.tr,
            Paragraph(text: GetDateFormat.yMMMMd().format(record.created!)),
          ),
        if (record.traces.collected != null)
          ..._sectionDetails(
            'record_collect'.tr,
            _recordDetailsTraces(record.traces.collected!),
          ),
        if (record.traces.returned != null)
          ..._sectionDetails(
            'record_return'.tr,
            _recordDetailsTraces(record.traces.returned!),
          ),
      ],
    ),
  );

  return pdf.save();
}

List<Widget> _sectionDetails(String title, Widget child) {
  return [
    Header(level: 1, text: title),
    child,
  ];
}

Widget _recordDetailsState(RecordState state) {
  final (recordIconData, recordColor, recordFriendlyState) =
      recordStylePdf(state);

  return Row(children: [
    Icon(recordIconData, size: 16.0, color: recordColor),
    SizedBox(width: 8.0),
    Text(recordFriendlyState, style: TextStyle(color: recordColor)),
    if (state == RecordState.collectPqrsSignature) ...[
      SizedBox(width: 8.0),
      Text('state_signed_pqrs_alt'.tr, style: const TextStyle(color: PdfColors.blue)),
    ],
  ]);
}

Widget _recordDetailsTraces(Trace trace) {
  final dateFormat = GetDateFormat.jm();

  return Column(
    children: [
      Text(
        'record_client'.tr,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Table(
        columnWidths: const <int, TableColumnWidth>{
          0: FixedColumnWidth(150),
          1: FlexColumnWidth(),
        },
        children: [
          TableRow(
            children: [
              Text('record_inside_at'.tr),
              Text(trace.inside == null
                  ? '-'
                  : dateFormat.format(trace.inside!)),
            ],
          ),
          TableRow(children: [
            Text('record_name'.tr),
            Text(trace.client == null ? '-' : trace.client!.name),
          ]),
          TableRow(children: [
            Text('record_signature'.tr),
            trace.client == null
                ? Text('-')
                : SvgImage(
                    svg: trace.client!.svgSignature,
                    height: 50.0,
                    width: 100.0,
                    alignment: Alignment.topLeft,
                  ),
          ]),
          TableRow(children: [
            Text('record_outside_at'.tr),
            Text(trace.outside == null
                ? '-'
                : dateFormat.format(trace.outside!)),
          ]),
        ],
      ),
      SizedBox(height: 8.0),
      Text(
        'record_pqrs'.tr,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Table(
        columnWidths: const <int, TableColumnWidth>{
          0: FixedColumnWidth(150),
          1: FlexColumnWidth(),
        },
        children: [
          TableRow(children: [
            Text('record_name'.tr),
            Text(trace.pqrs == null ? '-' : trace.pqrs!.name),
          ]),
          TableRow(children: [
            Text('record_signature'.tr),
            trace.pqrs == null
                ? Text('-')
                : SvgImage(
                    svg: trace.pqrs!.svgSignature,
                    height: 50.0,
                    width: 100.0,
                    alignment: Alignment.topLeft,
                  ),
          ]),
        ],
      ),
    ],
  );
}

Widget _header(Context context, String title) {
  return Container(
    margin: const EdgeInsets.only(bottom: 1.0 * PdfPageFormat.cm),
    child: Row(children: [
      Text(title,
          style: Theme.of(context)
              .defaultTextStyle
              .copyWith(color: PdfColors.grey)),
      Spacer(),
      Text('pdf_confidential'.tr,
          style: Theme.of(context)
              .defaultTextStyle
              .copyWith(color: PdfColors.red)),
    ]),
  );
}

Widget _footer(Context context) {
  return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
      child: Text(
          'pdf_footer_page'.trParams({
            'number': context.pageNumber.toString(),
            'count': context.pagesCount.toString()
          }),
          style: Theme.of(context)
              .defaultTextStyle
              .copyWith(color: PdfColors.grey)));
}
