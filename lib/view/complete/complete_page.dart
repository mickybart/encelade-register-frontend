import 'package:encelade/controller/complete.dart';
import 'package:encelade/view/common/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletePage extends GetView<CompleteController> {
  const CompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Last verifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            Center(
              child: Wrap(
                spacing: 16.0,
                children: [
                  ElevatedButton.icon(
                    onPressed: controller.onGoBack,
                    icon: const Icon(Icons.cancel),
                    label: const Text('cancel'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      try {
                        await controller.onComplete();
                        controller.onGoBack();
                      } on Exception catch (e) {
                        showSnackbarErrorTo('complete', e);
                      }
                    },
                    icon: const Icon(Icons.verified,),
                    label: const Text(
                      'verified and conform',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
