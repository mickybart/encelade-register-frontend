import 'package:encelade/controller/signature.dart';
import 'package:encelade/view/common/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart' as sign;

class SignaturePage extends GetView<SignatureController> {
  const SignaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
                            tooltip: 'Undo',
                            autofocus: false,
                          ),
                          IconButton(
                            onPressed: controller.signatureController.redo,
                            icon: const Icon(Icons.redo),
                            tooltip: 'Redo',
                            autofocus: false,
                          ),
                          IconButton(
                            onPressed: controller.signatureController.clear,
                            icon: const Icon(Icons.clear),
                            tooltip: 'Clear',
                            autofocus: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => Wrap(
                  spacing: 16.0,
                  children: [
                    ElevatedButton.icon(
                      onPressed: controller.onGoBack,
                      icon: const Icon(Icons.cancel),
                      label: const Text('cancel'),
                    ),
                    ElevatedButton.icon(
                      onPressed: !controller.canSign.value
                          ? null
                          : () async {
                              try {
                                await controller.onSign();
                                controller.onGoBack();
                              } on Exception catch (e) {
                                showSnackbarErrorTo('sign', e);
                              }
                            },
                      icon: const Icon(Icons.draw),
                      label: const Text('sign'),
                    ),
                    ElevatedButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.draw),
                      label: const Text('sign and next'),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
