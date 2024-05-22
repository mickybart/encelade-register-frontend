import 'package:encelade/controller/register.dart';
import 'package:encelade/model/types/record_state.dart';
import 'package:encelade/view/common/widgets/icon_progress.dart';
import 'package:encelade/view/common/snackbar.dart';
import 'package:encelade/view/register/widgets/bottom_sheet_button.dart';
import 'package:encelade/view/record/widgets/record_tile.dart';
import 'package:encelade/model/types/record.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  RegisterPage({super.key}) {
    _onWatch();
  }

  Future<void> _onWatch() async {
    try {
      await controller.onWatch();
    } on Exception catch (e) {
      showSnackbarErrorTo('rp_sset_watch'.tr, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rp_title'.tr),
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
          IconButton(
            onPressed: controller.onHistory,
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.records.isEmpty) {
            return Center(
              child: Text('rp_empty'.tr),
            );
          } else {
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: controller.records.length,
              itemBuilder: (context, index) => RecordTile(
                record: controller.records[index],
                onTap: _hasOnTap(controller.records[index])
                    ? (record) => _onListItemTap(record)
                    : null,
                onDetailsTap: (record) => controller.onDetails(record),
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

  bool _hasOnTap(Record record) {
    switch (record.state) {
      case RecordState.completed:
      case RecordState.unspecified:
        return false;
      default:
        return true;
    }
  }

  void _onListItemTap(Record record) {
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
                      label: Text('rp_edit'.tr),
                      onPressed: controller.actionInProgress
                          ? null
                          : () => controller.onUpdateDraft(record),
                    ),
                    BottomSheetButton.icon(
                      icon: controller.submitInProgress.isFalse
                          ? const Icon(Icons.done)
                          : const IconProgress(),
                      label: controller.submitInProgress.isFalse
                          ? Text('rp_submit'.tr)
                          : Text('rp_submit_progress'.tr),
                      onPressed: controller.actionInProgress
                          ? null
                          : () async {
                              try {
                                await controller.onSubmitDraft(record);
                                controller.onGoBack();
                              } on Exception catch (e) {
                                showSnackbarErrorTo('rp_sset_submit'.tr, e);
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
                          ? Text('rp_delete'.tr)
                          : Text('rp_delete_progress'.tr),
                      onPressed: controller.actionInProgress
                          ? null
                          : () async {
                              try {
                                await controller.onDeleteDraft(record);
                                controller.onGoBack();
                              } on Exception catch (e) {
                                showSnackbarErrorTo('rp_sset_delete'.tr, e);
                              }
                            },
                      color: Colors.red,
                    ),
                    const Spacer(),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: controller.onCancel,
                        icon: const Icon(Icons.cancel),
                        label: Text('rp_cancel'.tr),
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
      default:
        break;
    }
  }
}
