import 'package:encelade/controller/complete.dart';
import 'package:encelade/view/common/scadfold_record_flow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletePage extends GetView<CompleteController> {
  const CompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldRecordFlow(
      controller: controller,
      appBar: AppBar(
        title: const Text('Last verifications'),
      ),
      primaryAction: RecordFlowAction(
        'verified and conform',
        'completing...',
        Icons.verified,
        'complete',
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
