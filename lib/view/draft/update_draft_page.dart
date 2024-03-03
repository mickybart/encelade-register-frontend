import 'package:encelade/controller/update_draft.dart';
import 'package:encelade/view/common/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateDraftPage extends GetView<UpdateDraftController> {
  const UpdateDraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Updating a draft record'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(controller.id),
            TextField(
              controller: controller.summaryController,
              decoration: const InputDecoration(
                labelText: 'Summary',
              ),
              minLines: 10,
              maxLines: 10,
            ),
            const Spacer(),
            Obx(
              () => Wrap(
                spacing: 16,
                children: [
                  ElevatedButton.icon(
                    onPressed: controller.onGoBack,
                    icon: const Icon(Icons.cancel),
                    label: const Text('Cancel'),
                  ),
                  ElevatedButton.icon(
                    onPressed: !controller.canUpdateDraft.value
                        ? null
                        : () async {
                            try {
                              final id = await controller.onUpdateDraft();
                              controller.onGoBack();
                              Get.snackbar(
                                'Draft updated !',
                                id,
                                icon: const Icon(Icons.done),
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            } on Exception catch (e) {
                              showSnackbarErrorTo('update the draft record', e);
                            }
                          },
                    label: const Text('Update'),
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
