import 'dart:typed_data';

import 'package:encelade/controller/interfaces/i_pdf_controller.dart';
import 'package:encelade/pdf/details.dart';
import 'package:encelade/model/types/record.dart';
import 'package:pdf/pdf.dart';

class RecordDetailsPdfController extends IPdfController {
  final Record record;

  RecordDetailsPdfController(this.record) {
    filename = '${record.id}.pdf';
  }

  @override
  Future<Uint8List> savePdf(PdfPageFormat? format) {
    return saveRecordDetailsPdf(format, record);
  }
}
