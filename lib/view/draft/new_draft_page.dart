import 'package:encelade/controller/new_draft.dart';
import 'package:encelade/view/common/scadfold_record_flow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewDraftPage extends GetView<NewDraftController> {
  const NewDraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldRecordFlow(
      controller: controller,
      appBar: AppBar(
        title: const Text('Creating a new draft record'),
      ),
      primaryAction: RecordFlowAction(
        'Create',
        'Creating...',
        Icons.add,
        'create the draft',
        controller.onCreateDraft,
      ),
      children: [
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
