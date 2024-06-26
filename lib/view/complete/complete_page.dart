// A Completed page
//
// Used to confirm that the record is verified and conform. This is the end of the flow.
//
// Features supported:
// - Final validation by submitting the record

import 'package:encelade/controller/record_flow/complete.dart';
import 'package:encelade/view/common/widgets/scadfold_record_flow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletePage extends GetView<CompleteController> {
  const CompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldRecordFlow(
      controller: controller,
      appBar: AppBar(
        title: Text('cp_title'.tr),
      ),
      primaryAction: RecordFlowAction(
        'cp_verified'.tr,
        'cp_verified_progress'.tr,
        Icons.verified,
        'cp_sset_verified'.tr,
        controller.onComplete,
      ),
      spacer: false,
      children: [
        Text(controller.id),
        const Expanded(
          child: Center(
            child: Icon(
              Icons.verified,
              size: 64.0,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
