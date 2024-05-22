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
        title: Text('c_title'.tr),
      ),
      primaryAction: RecordFlowAction(
        'c_verified'.tr,
        'c_verified_progress'.tr,
        Icons.verified,
        'c_sset_verified'.tr,
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
