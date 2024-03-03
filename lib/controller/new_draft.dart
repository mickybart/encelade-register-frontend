import 'package:encelade/model/remote_register_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewDraftController extends GetxController {
  final RemoteRegisterProvider _remoteRegisterProvider;
  final _summary = TextEditingController();
  final canCreateDraft = false.obs;

  NewDraftController(this._remoteRegisterProvider) {
    _summary.addListener(() { canCreateDraft.value = _summary.text.isNotEmpty; });
  }

  TextEditingController get summaryController => _summary;

  void onGoBack() {
    Get.back();
  }

  Future<String> onCreateDraft() async {
    return await _remoteRegisterProvider.newDraft(_summary.text);
  }
}
