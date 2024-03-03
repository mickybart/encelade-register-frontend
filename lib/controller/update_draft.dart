import 'package:encelade/model/remote_register_provider.dart';
import 'package:encelade/model/types/record.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateDraftController extends GetxController {
  final RemoteRegisterProvider _remoteRegisterProvider;
  final TextEditingController _summary;
  final Record _record;
  final canUpdateDraft = false.obs;

  UpdateDraftController(this._remoteRegisterProvider, this._record)
      : _summary = TextEditingController(text: _record.summary) {
    _summary.addListener(
      () {
        canUpdateDraft.value = (_summary.text.isNotEmpty && _summary.text != _record.summary);
      },
    );
  }

  TextEditingController get summaryController => _summary;
  String get id => _record.id;

  void onGoBack() {
    Get.back();
  }

  Future<String> onUpdateDraft() async {
    await _remoteRegisterProvider.updateDraft(_record.id, _summary.text);
    return _record.id;
  }
}
