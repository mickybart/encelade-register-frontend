import 'package:encelade/controller/interfaces/i_record_controller.dart';
import 'package:encelade/controller/pdf/record_details_pdf.dart';

class RecordDetailsController extends IRecordController {
  final RecordDetailsPdfController pdf;

  RecordDetailsController(super.remoteRegisterProvider, super.record, this.pdf);
}