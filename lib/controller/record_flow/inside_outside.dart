import 'dart:async';

import 'package:encelade/controller/interfaces/i_record_controller.dart';
import 'package:encelade/model/types/record_state.dart';
import 'package:get/get.dart';

class InsideOutsideController extends IRecordController {
  late final Timer _timer;
  final time = DateTime.now().toLocal().obs;

  InsideOutsideController(super.remoteRegisterProvider, super.record) {
    validity(true); // always valid; driven by the time !
  }

  @override
  void onInit() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => time.value = DateTime.now().toLocal(),
    );
    super.onInit();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  String get title {
    switch (record.state) {
      case RecordState.created:
      case RecordState.collectPqrsSignature:
        /*
         * next step: client is inside office to collect or return products
         */
        return 'Client inside office at ?';
      case RecordState.collectClientSignature:
      case RecordState.returnClientSignature:
        /*
         * next step: client goes out of office after collected or returned products
         */
        return 'Client outside office at ?';
      default:
        throw Exception('not allowed for this record state !');
    }
  }

  Future<void> _onSetIt() async {
    switch (record.state) {
      case RecordState.created:
        /*
         * next step: client is inside office to collect products
         */
        return await remoteRegisterProvider.collectClientInside(record.id, time.value);
      case RecordState.collectPqrsSignature:
        /*
         * next step: client is inside office to return products
         */
        return await remoteRegisterProvider.returnClientInside(record.id, time.value);
      case RecordState.collectClientSignature:
        /*
         * next step: client goes out of office with collected products
         */
        return await remoteRegisterProvider.collectClientOutside(record.id, time.value);
      case RecordState.returnClientSignature:
        /*
         * next step: client goes out of office after having returned products
         */
        return await remoteRegisterProvider.returnClientOutside(record.id, time.value);
      default:
        throw Exception('not allowed for this record state !');
    }
  }

  Future<void> onSetIt() async {
    await onRemoteCallAction(_onSetIt);
  }
}
