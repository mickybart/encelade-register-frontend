import 'package:encelade/controller/record_flow/new_draft.dart';
import 'package:encelade/view/common/widgets/scadfold_record_flow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewDraftPage extends GetView<NewDraftController> {
  const NewDraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldRecordFlow(
      controller: controller,
      appBar: AppBar(
        title: Text('nd_title'.tr),
      ),
      primaryAction: RecordFlowAction(
        'nd_create'.tr,
        'nd_create_progress'.tr,
        Icons.add,
        'nd_sset_create'.tr,
        controller.onCreateDraft,
      ),
      children: [
        TextField(
          controller: controller.summaryController,
          decoration: InputDecoration(
            labelText: 'nd_summary'.tr,
          ),
          minLines: 10,
          maxLines: 10,
        ),
      ],
    );
  }
}
