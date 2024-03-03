import 'package:encelade/controller/home.dart';
import 'package:encelade/model/types/record_state.dart';
import 'package:encelade/view/common/snackbar.dart';
import 'package:encelade/view/home/bottom_sheet_button.dart';
import 'package:encelade/view/home/record_tile.dart';
import 'package:encelade/model/types/record.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key, required this.appTitle});

  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
        actions: [
          IconButton(
            onPressed: () async {
              try {
                await controller.onRefresh();
              } on Exception catch (e) {
                showSnackbarErrorTo('refresh the list', e);
              }
            },
            icon: const Icon(Icons.refresh),
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
                onTap: _onListItemTap,
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

  void _onListItemTap(Record record) {
    debugPrint(record.id);
    switch (record.state) {
      case RecordState.draft:
        Get.bottomSheet(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BottomSheetButton.icon(
                  icon: const Icon(Icons.edit),
                  label: const Text('edit'),
                  onPressed: () => controller.onUpdateDraft(record),
                ),
                BottomSheetButton.icon(
                  icon: const Icon(Icons.done),
                  label: const Text('submit'),
                  onPressed: () async {
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
                  icon: const Icon(Icons.delete_forever),
                  label: const Text('delete permanently'),
                  onPressed: () async {
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
                    onPressed: () => controller.onGoBack(),
                    icon: const Icon(Icons.cancel),
                    label: const Text('cancel'),
                  ),
                )
              ],
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
