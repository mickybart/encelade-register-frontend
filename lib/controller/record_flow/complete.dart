import 'package:encelade/controller/interfaces/i_record_controller.dart';

class CompleteController extends IRecordController {
  CompleteController(super.remoteRegisterProvider, super.record) {
    validity(true); // always valid; no input
  }

  Future<void> onComplete() async {
    await onRemoteCallAction(() async {
      await remoteRegisterProvider.complete(record.id);
    });
  }
}
