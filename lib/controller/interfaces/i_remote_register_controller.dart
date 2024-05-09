import 'package:encelade/model/remote_register_provider.dart';
import 'package:get/get.dart';

abstract class IRemoteRegisterController extends GetxController {
  final RemoteRegisterProvider remoteRegisterProvider;
  final remoteCallInProgress = false.obs;
  final validity = false.obs;

  IRemoteRegisterController(this.remoteRegisterProvider);

  void onGoBack() {
    if (remoteCallInProgress.isFalse) Get.back();
  }

  void onPop(bool didPop) {
    if (didPop) return;
    onGoBack();
  }

  void onCancel() {
    onGoBack();
  }

  Future<void> onRemoteCallAction(Future<void> Function() action) async {
    remoteCallInProgress(true);

    try {
      await action();
    } finally {
      remoteCallInProgress(false);
    }
  }
}