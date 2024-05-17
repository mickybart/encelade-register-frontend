import 'dart:typed_data';

import 'package:encelade/controller/interfaces/i_pdf_controller.dart';
import 'package:encelade/pdf/history.dart';
import 'package:encelade/model/types/record.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';

class HistoryPdfController extends IPdfController {
  List<Record> records = [];
  List<DateTime> _range = [];

  HistoryPdfController();

  @override
  PdfPageFormat get initialPageFormat => PdfPageFormat.letter.landscape;

  set range(List<DateTime> value) {
    final dateFormat = DateFormat('yyyyMMdd');

    _range = value;
    filename = 'history-${dateFormat.format(value[0])}-to-${dateFormat.format(value[1])}.pdf';
  }

  @override
  Future<Uint8List> savePdf(PdfPageFormat? format) {
    return saveHistoryPdf(format, records, _range);
  }
}
