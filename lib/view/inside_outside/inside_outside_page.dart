import 'package:encelade/controller/record_flow/inside_outside.dart';
import 'package:encelade/view/common/widgets/scadfold_record_flow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InsideOutsidePage extends GetView<InsideOutsideController> {
  const InsideOutsidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.jm();

    return ScaffoldRecordFlow(
      controller: controller,
      appBar: AppBar(
        title: Text(controller.title),
      ),
      spacer: false,
      primaryAction: RecordFlowAction(
        'set it',
        'setting it...',
        Icons.today,
        'set the timestamp',
        controller.onSetIt,
      ),
      children: [
        Text(controller.id),
        Expanded(
          child: Center(
            child: Obx(
              () => Text(
                dateFormat.format(controller.time.value),
                style: const TextStyle(fontSize: 32.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
