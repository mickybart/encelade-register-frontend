import 'package:encelade/controller/home.dart';
import 'package:encelade/model/types/record_state.dart';
import 'package:encelade/view/common/icon_progress.dart';
import 'package:encelade/view/common/snackbar.dart';
import 'package:encelade/view/home/bottom_sheet_button.dart';
import 'package:encelade/view/home/record_tile.dart';
import 'package:encelade/model/types/record.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key, required this.appTitle}) {
    _onWatch();
  }

  final String appTitle;

  Future<void> _onWatch() async {
    try {
      await controller.onWatch();
    } on Exception catch (e) {
      showSnackbarErrorTo('sync records', e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
        actions: [
          Obx(
            () => IconButton(
              onPressed: controller.isSyncActive
                  ? controller.onStopWatchRequest
                  : _onWatch,
              icon: controller.isSyncActive
                  ? const Icon(Icons.sync)
                  : controller.isSyncError
                      ? const Icon(
                          Icons.sync_problem,
                          color: Colors.red,
                        )
                      : const Icon(Icons.sync_disabled),
            ),
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.records.isEmpty) {
            return const Center(
              child: Text('No records...'),
            );
          } else {
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: controller.records.length,
              itemBuilder: (context, index) => RecordTile(
                record: controller.records[index],
                onTap: (record) => _onListItemTap(record, controller),
              ),
              separatorBuilder: (context, index) => const Divider(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.onNewDraft,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onListItemTap(Record record, HomeController controller) {
    switch (record.state) {
      case RecordState.draft:
        Get.bottomSheet(
          PopScope(
            canPop: false,
            onPopInvoked: controller.onPop,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BottomSheetButton.icon(
                      icon: const Icon(Icons.edit),
                      label: const Text('edit'),
                      onPressed: controller.actionInProgress
                          ? null
                          : () => controller.onUpdateDraft(record),
                    ),
                    BottomSheetButton.icon(
                      icon: controller.submitInProgress.isFalse
                          ? const Icon(Icons.done)
                          : const IconProgress(),
                      label: controller.submitInProgress.isFalse
                          ? const Text('submit')
                          : const Text('submitting...'),
                      onPressed: controller.actionInProgress
                          ? null
                          : () async {
                              try {
                                await controller.onSubmitDraft(record);
                                controller.onGoBack();
                              } on Exception catch (e) {
                                showSnackbarErrorTo('submit the draft', e);
                              }
                            },
                    ),
                    const Divider(),
                    BottomSheetButton.icon(
                      icon: controller.deleteInProgress.isFalse
                          ? const Icon(Icons.delete_forever)
                          : const IconProgress(
                              color: Colors.red,
                            ),
                      label: controller.deleteInProgress.isFalse
                          ? const Text('delete permanently')
                          : const Text('deleting...'),
                      onPressed: controller.actionInProgress
                          ? null
                          : () async {
                              try {
                                await controller.onDeleteDraft(record);
                                controller.onGoBack();
                              } on Exception catch (e) {
                                showSnackbarErrorTo('delete the draft', e);
                              }
                            },
                      color: Colors.red,
                    ),
                    const Spacer(),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: controller.onCancel,
                        icon: const Icon(Icons.cancel),
                        label: const Text('cancel'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: Get.theme.dialogBackgroundColor,
        );
        break;
      case RecordState.created:
      case RecordState.collectPqrsSignature:
      case RecordState.collectClientSignature:
      case RecordState.returnClientSignature:
        controller.onClientInsideOutside(record);
        break;
      case RecordState.collectClientInside:
      case RecordState.collectClientOutside:
      case RecordState.returnClientInside:
      case RecordState.returnClientOutside:
        controller.onSignature(record);
        break;
      case RecordState.returnPqrsSignature:
        controller.onComplete(record);
        break;
      case RecordState.completed:
      case RecordState.unspecified:
        // nothing todo for both
        // TODO: disable onTap
        break;
    }
  }
}
