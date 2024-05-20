import 'package:encelade/controller/record_flow/update_draft.dart';
import 'package:encelade/view/common/widgets/scadfold_record_flow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateDraftPage extends GetView<UpdateDraftController> {
  const UpdateDraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldRecordFlow(
      controller: controller,
      appBar: AppBar(
        title: const Text('Updating a draft record'),
      ),
      primaryAction: RecordFlowAction(
        'update',
        'updating...',
        Icons.edit,
        'update the draft ${controller.id}',
        controller.onUpdateDraft,
      ),
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
      ],
    );
  }
}
