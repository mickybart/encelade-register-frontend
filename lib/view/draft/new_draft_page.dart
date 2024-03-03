import 'package:encelade/controller/new_draft.dart';
import 'package:encelade/view/common/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewDraftPage extends GetView<NewDraftController> {
  const NewDraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creating a new draft record'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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
                    onPressed: !controller.canCreateDraft.value
                        ? null
                        : () async {
                            try {
                              final id = await controller.onCreateDraft();
                              controller.onGoBack();
                              Get.snackbar(
                                'Draft created !',
                                'Id is $id',
                                icon: const Icon(Icons.done),
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            } on Exception catch (e) {
                              showSnackbarErrorTo('create the new draft record', e);
                            }
                          },
                    label: const Text('Create'),
                    icon: const Icon(Icons.add),
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
