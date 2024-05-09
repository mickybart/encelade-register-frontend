import 'package:encelade/model/remote_register_provider.dart';
import 'package:encelade/model/types/record.dart';
import 'package:encelade/view/app/navigation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RemoteRegisterProvider _remoteRegisterProvider;
  final records = <Record>[].obs;
  final submitInProgress = false.obs;
  final deleteInProgress = false.obs;

  HomeController(this._remoteRegisterProvider);

  bool get actionInProgress => submitInProgress.isTrue || deleteInProgress.isTrue;

  void onPop(bool didPop) {
    if (didPop) return;
    onGoBack();
  }

  void onGoBack() {
    if (submitInProgress.isFalse && deleteInProgress.isFalse) Get.back();
  }

  void onCancel() {
    onGoBack();
  }

  void onNewDraft() {
    Get.toNamed(Routes.newDraft);
  }

  void onUpdateDraft(Record record) {
    Get.offNamed(Routes.updateDraft, arguments: record);
  }

  void onClientInsideOutside(Record record) {
    Get.toNamed(Routes.clientInsideOutside, arguments: record);
  }

  void onSignature(Record record) {
    Get.toNamed(Routes.signature, arguments: record);
  }

  void onComplete(Record record) {
    Get.toNamed(Routes.complete, arguments: record);
  }

  Future<void> onDeleteDraft(Record record) async {
    deleteInProgress(true);
    
    try {
      await _remoteRegisterProvider.deleteDraft(record.id);
    } finally {
      deleteInProgress(false);
    }
  }

  Future<void> onSubmitDraft(Record record) async {
    submitInProgress(true);

    try {
      await _remoteRegisterProvider.submitDraft(record.id);
    } finally {
      submitInProgress(false);
    }
  }

  Future<void> onRefresh() async {
    records.clear();

    await for (var record in _remoteRegisterProvider.getRecordsNotCompleted()) {
      records.add(record);
    }
  }
}
