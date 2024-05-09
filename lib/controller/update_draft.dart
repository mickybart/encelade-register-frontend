import 'package:encelade/controller/interfaces/i_record_controller.dart';
import 'package:flutter/material.dart';

class UpdateDraftController extends IRecordController {
  final TextEditingController _summary;

  UpdateDraftController(super.remoteRegisterProvider, super.record)
      : _summary = TextEditingController(text: record.summary) {
    _summary.addListener(
      () {
        validity(_summary.text.isNotEmpty && _summary.text != record.summary);
      },
    );
  }

  TextEditingController get summaryController => _summary;

  Future<void> onUpdateDraft() async {
    await onRemoteCallAction(() async {
      await remoteRegisterProvider.updateDraft(record.id, _summary.text);
    });
  }
}
