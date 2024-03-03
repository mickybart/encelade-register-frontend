import 'package:encelade/model/remote_register_provider.dart';
import 'package:encelade/model/types/record.dart';
import 'package:get/get.dart';

class CompleteController extends GetxController {
  final RemoteRegisterProvider _remoteRegisterProvider;
  final Record _record;

  CompleteController(this._remoteRegisterProvider, this._record);

  String get id => _record.id;

  void onGoBack() {
    Get.back();
  }

  Future<void> onComplete() async {
    await _remoteRegisterProvider.complete(_record.id);
  }
}