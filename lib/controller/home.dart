import 'package:encelade/model/remote_register_provider.dart';
import 'package:encelade/model/types/record.dart';
import 'package:encelade/view/app/navigation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RemoteRegisterProvider _remoteRegisterProvider;
  final records = <Record>[].obs;

  HomeController(this._remoteRegisterProvider);

  void onNewDraft() {
    Get.toNamed(Routes.newDraft);
  }

  void onUpdateDraft(Record record) {
    Get.offNamed(Routes.updateDraft, arguments: record);
  }

  void onGoBack() {
    Get.back();
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
    await _remoteRegisterProvider.deleteDraft(record.id);
  }

  Future<void> onSubmitDraft(Record record) async {
    await _remoteRegisterProvider.submitDraft(record.id);
  }

  Future<void> onRefresh() async {
    records.clear();

    await for (var record in _remoteRegisterProvider.getRecordsNotCompleted()) {
      records.add(record);
    }
  }
}
