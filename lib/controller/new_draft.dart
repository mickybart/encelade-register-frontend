import 'package:encelade/controller/interfaces/i_remote_register_controller.dart';
import 'package:flutter/material.dart';

class NewDraftController extends IRemoteRegisterController {
  final _summary = TextEditingController();

  NewDraftController(super.remoteRegisterProvider) {
    _summary.addListener(
      () {
        validity(_summary.text.isNotEmpty);
      },
    );
  }

  TextEditingController get summaryController => _summary;

  Future<void> onCreateDraft() async {
    await onRemoteCallAction(() async {
      await remoteRegisterProvider.newDraft(_summary.text);
    });
  }
}
