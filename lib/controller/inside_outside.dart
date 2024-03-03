import 'dart:async';

import 'package:encelade/model/remote_register_provider.dart';
import 'package:encelade/model/types/record.dart';
import 'package:encelade/model/types/record_state.dart';
import 'package:get/get.dart';

class InsideOutsideController extends GetxController {
  final RemoteRegisterProvider _remoteRegisterProvider;
  final Record _record;
  late final Timer _timer;
  final time = DateTime.now().toLocal().obs;

  InsideOutsideController(this._remoteRegisterProvider, this._record);

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
    switch (_record.state) {
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

  String get id => _record.id;

  void onGoBack() {
    Get.back();
  }

  Future<void> onSetIt() async {
    switch (_record.state) {
      case RecordState.created:
        /*
         * next step: client is inside office to collect products
         */
        return await _remoteRegisterProvider.collectClientInside(_record.id, time.value);
      case RecordState.collectPqrsSignature:
        /*
         * next step: client is inside office to return products
         */
        return await _remoteRegisterProvider.returnClientInside(_record.id, time.value);
      case RecordState.collectClientSignature:
        /*
         * next step: client goes out of office with collected products
         */
        return await _remoteRegisterProvider.collectClientOutside(_record.id, time.value);
      case RecordState.returnClientSignature:
        /*
         * next step: client goes out of office after having returned products
         */
        return await _remoteRegisterProvider.returnClientOutside(_record.id, time.value);
      default:
        throw Exception('not allowed for this record state !');
    }
  }
}
