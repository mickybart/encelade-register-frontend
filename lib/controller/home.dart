import 'dart:async';

import 'package:encelade/model/remote_register_provider.dart';
import 'package:encelade/model/types/event_type.dart';
import 'package:encelade/model/types/record.dart';
import 'package:encelade/model/types/record_state.dart';
import 'package:encelade/view/app/navigation.dart';
import 'package:get/get.dart';

enum SyncStatus {
  syncOff,
  syncOffRequested,
  syncOn,
  syncError,
}

class HomeController extends GetxController {
  final RemoteRegisterProvider _remoteRegisterProvider;
  final records = <Record>[].obs;
  final submitInProgress = false.obs;
  final deleteInProgress = false.obs;
  final syncStatus = Rx(SyncStatus.syncOff);

  HomeController(this._remoteRegisterProvider);

  bool get actionInProgress =>
      submitInProgress.isTrue || deleteInProgress.isTrue;

  bool get isSyncActive =>
      syncStatus.value == SyncStatus.syncOn ||
      syncStatus.value == SyncStatus.syncOffRequested;
  bool get isSyncError => syncStatus.value == SyncStatus.syncError;

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

  void onHistory() {
    Get.toNamed(Routes.history);
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

  Future<void> _onWatch() async {
    records.clear();

    final eventStream = _remoteRegisterProvider
        .watch(_remoteRegisterProvider.getRecordsNotCompleted);

    await for (var event in eventStream) {
      // control event
      if (event.eventType == EventType.emptyEvent) {
        if (syncStatus.value == SyncStatus.syncOffRequested) {
          break; // stop the stream as requested
        } else {
          continue; // continue to read the stream
        }
      }

      if (event.record == null) {
        throw Exception("Missing record event !");
      }
      if (event.record!.id.isEmpty) {
        throw Exception("Missing id in record event !");
      }

      switch (event.eventType) {
        case EventType.emptyEvent:
          break;
        case EventType.added:
          records.add(event.record!);
          break;
        case EventType.modified:
          final index =
              records.indexWhere((element) => element.id == event.record!.id);
          if (index == -1) {
            throw Exception(
                "Missing modified record ! The stream is probably out of sync !");
          }
          if (event.record!.state == RecordState.completed) {
            // we don't want to keep the record in this controller once completed (see initial call on watch())
            records.removeAt(index);
          } else {
            records[index] = event.record!;
          }
          break;
        case EventType.deleted:
          records.removeWhere((element) => element.id == event.record!.id);
          break;
      }
    }
  }

  Future<void> onWatch() async {
    if (isSyncActive) {
      return;
    }

    syncStatus.value = SyncStatus.syncOn;

    try {
      await _onWatch();
      syncStatus.value = SyncStatus.syncOff;
    } on Exception {
      syncStatus.value = SyncStatus.syncError;
      rethrow;
    }
  }

  void onStopWatchRequest() {
    if (syncStatus.value == SyncStatus.syncOn) {
      syncStatus.value = SyncStatus.syncOffRequested;
    }
  }
}
