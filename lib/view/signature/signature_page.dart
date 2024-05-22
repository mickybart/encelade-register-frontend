import 'package:encelade/controller/record_flow/signature.dart';
import 'package:encelade/view/common/widgets/scadfold_record_flow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart' as sign;

class SignaturePage extends GetView<SignatureController> {
  const SignaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldRecordFlow(
      controller: controller,
      appBar: AppBar(
        title: Text(controller.title),
      ),
      primaryAction: RecordFlowAction(
        'sg_sign'.tr,
        'sg_sign_progress'.tr,
        Icons.draw,
        'sg_sset_sign'.tr,
        controller.onSign,
      ),
      spacer: false,
      children: [
        Text(controller.id),
        TextField(
          controller: controller.nameController,
          decoration: InputDecoration(
            labelText: controller.nameLabel,
          ),
          maxLines: 1,
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                sign.Signature(
                  controller: controller.signatureController,
                  backgroundColor: Colors.grey.shade300,
                  height: 300,
                  width: 600,
                ),
                Wrap(
                  spacing: 8.0,
                  children: [
                    IconButton(
                      onPressed: controller.signatureController.undo,
                      icon: const Icon(Icons.undo),
                      tooltip: 'sg_undo'.tr,
                      autofocus: false,
                    ),
                    IconButton(
                      onPressed: controller.signatureController.redo,
                      icon: const Icon(Icons.redo),
                      tooltip: 'sg_redo'.tr,
                      autofocus: false,
                    ),
                    IconButton(
                      onPressed: controller.signatureController.clear,
                      icon: const Icon(Icons.clear),
                      tooltip: 'sg_clear'.tr,
                      autofocus: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
