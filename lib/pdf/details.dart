import 'dart:typed_data';

import 'package:encelade/model/types/record.dart';
import 'package:encelade/model/types/record_state.dart';
import 'package:encelade/model/types/traces.dart';
import 'package:encelade/view/record/styles/record_style.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Uint8List> saveRecordDetailsPdf(PdfPageFormat? format, Record record) async {
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
          'State',
          _recordDetailsState(record.state),
        ),
        ..._sectionDetails(
          'Summary',
          Paragraph(text: record.summary),
        ),
        if (record.created != null)
          ..._sectionDetails(
            'Creation date',
            Paragraph(text: DateFormat.yMMMMd().format(record.created!)),
          ),
        if (record.traces.collected != null)
          ..._sectionDetails(
            'Collect',
            _recordDetailsTraces(record.traces.collected!),
          ),
        if (record.traces.returned != null)
          ..._sectionDetails(
            'Return',
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
      Text('*Signed by PQRS', style: const TextStyle(color: PdfColors.blue)),
    ],
  ]);
}

Widget _recordDetailsTraces(Trace trace) {
  final dateFormat = DateFormat.jm();

  return Column(
    children: [
      Text(
        'Client',
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
              Text('Inside at:'),
              Text(trace.inside == null
                  ? '-'
                  : dateFormat.format(trace.inside!)),
            ],
          ),
          TableRow(children: [
            Text('Name:'),
            Text(trace.client == null ? '-' : trace.client!.name),
          ]),
          TableRow(children: [
            Text('Signature:'),
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
            Text('Outside at:'),
            Text(trace.outside == null
                ? '-'
                : dateFormat.format(trace.outside!)),
          ]),
        ],
      ),
      SizedBox(height: 8.0),
      Text(
        'PQRS',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Table(
        columnWidths: const <int, TableColumnWidth>{
          0: FixedColumnWidth(150),
          1: FlexColumnWidth(),
        },
        children: [
          TableRow(children: [
            Text('Name:'),
            Text(trace.pqrs == null ? '-' : trace.pqrs!.name),
          ]),
          TableRow(children: [
            Text('Signature:'),
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
      Text('CONFIDENTIAL',
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
      child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
          style: Theme.of(context)
              .defaultTextStyle
              .copyWith(color: PdfColors.grey)));
}
