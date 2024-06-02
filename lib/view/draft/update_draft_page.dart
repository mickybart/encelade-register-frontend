// A draft updater page
//
// Used to update a draft with some inputs about products required.
//
// Features supported:
// - request summary input

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
        title: Text('udp_title'.tr),
      ),
      primaryAction: RecordFlowAction(
        'udp_update'.tr,
        'udp_update_progress'.tr,
        Icons.edit,
        'udp_sset_update'.trParams({'id': controller.id}),
        controller.onUpdateDraft,
      ),
      children: [
        Text(controller.id),
        TextField(
          controller: controller.summaryController,
          decoration: InputDecoration(
            labelText: 'udp_summary'.tr,
          ),
          minLines: 10,
          maxLines: 10,
        ),
      ],
    );
  }
}
