import 'dart:typed_data';

import 'package:encelade/model/types/record_state.dart';
import 'package:encelade/model/types/traces.dart';
import 'package:encelade/view/record/styles/record_style.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:encelade/model/types/record.dart';
import 'package:printing/printing.dart';

Future<Uint8List> saveHistoryPdf(PdfPageFormat? format, List<Record> records, List<DateTime> range) async {
  final dateFormat = DateFormat.yMMMMd();
  final startDate = dateFormat.format(range[0]);
  final endDate = dateFormat.format(range[1]);
  final title = 'History: $startDate - $endDate';

  final pdf = Document(title: title);

  // Rendering records
  final recordsForPdf = <TableRow>[];
  for (final record in records) {
    recordsForPdf.add(_separation());
    recordsForPdf.add(_record(record));
  }

  pdf.addPage(
    MultiPage(
      orientation: PageOrientation.landscape,
      theme: ThemeData.withFont(
        base: await PdfGoogleFonts.openSansRegular(),
        bold: await PdfGoogleFonts.openSansBold(),
        icons: await PdfGoogleFonts.materialIcons(),
      ),
      pageFormat: format ?? PdfPageFormat.letter.landscape,
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (context) => _header(context, title),
      footer: (context) => _footer(context),
      build: (context) => [
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                Text('Created'),
                Text('Summary'),
                Text('Hours', style: const TextStyle(color: PdfColors.blue)),
                Text('Client', style: const TextStyle(color: PdfColors.blue)),
                Text('PQRS', style: const TextStyle(color: PdfColors.blue)),
                Text('Hours',
                    style: const TextStyle(color: PdfColors.lightGreen)),
                Text('Client',
                    style: const TextStyle(color: PdfColors.lightGreen)),
                Text('PQRS',
                    style: const TextStyle(color: PdfColors.lightGreen)),
                Text('State'),
              ],
            ),
            ...recordsForPdf,
          ],
        ),
      ],
    ),
  );

  return pdf.save();
}

TableRow _separation() {
  return TableRow(children: [
    Divider(),
    Divider(),
    Divider(),
    Divider(),
    Divider(),
    Divider(),
    Divider(),
    Divider(),
    Divider(),
  ]);
}

TableRow _record(Record record) {
  return TableRow(
    children: [
      // Creation date
      Text(record.created != null
          ? DateFormat.yMMMMd().format(record.created!)
          : '-'),
      // Summary
      Text(record.summary),
      // Collect: Client inside and outside
      _insideOutside(record.traces.collected),
      // Collect: client name and signature
      _signer(record.traces.collected?.client),
      // Collect: PQRS name and signature
      _signer(record.traces.collected?.pqrs),
      // Return: Client inside and outside
      _insideOutside(record.traces.returned),
      // Return: client name and signature
      _signer(record.traces.returned?.client),
      // Return: PQRS name and signature
      _signer(record.traces.returned?.pqrs),
      // State
      _state(record.state),
    ],
  );
}

Widget _state(RecordState state) {
  final (recordIconData, recordColor, _) = recordStylePdf(state);

  return Icon(recordIconData, size: 16.0, color: recordColor);
}

Widget _signer(Signer? signer) {
  if (signer == null) {
    return Text('-');
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(signer.name),
      SvgImage(
        svg: signer.svgSignature,
        height: 25.0,
        width: 50.0,
        alignment: Alignment.topLeft,
      ),
    ],
  );
}

Widget _insideOutside(Trace? trace) {
  if (trace == null) {
    return Text('-');
  }

  final dateFormat = DateFormat.jm();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(trace.inside == null ? '-' : dateFormat.format(trace.inside!)),
      Text(trace.outside == null ? '-' : dateFormat.format(trace.outside!)),
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
