import 'package:encelade/controller/inside_outside.dart';
import 'package:encelade/view/common/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InsideOutsidePage extends GetView<InsideOutsideController> {
  const InsideOutsidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.jm();

    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            Center(
              child: Wrap(
                spacing: 16,
                children: [
                  ElevatedButton.icon(
                    onPressed: controller.onGoBack,
                    icon: const Icon(Icons.cancel),
                    label: const Text('cancel'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      try {
                        await controller.onSetIt();
                        controller.onGoBack();
                      } on Exception catch (e) {
                        showSnackbarErrorTo('timestamp', e);
                      }
                    },
                    icon: const Icon(Icons.today), // TODO: during onPressed await: const SizedBox.square(dimension: 16.0, child: CircularProgressIndicator(strokeWidth: 2.0))
                    label: const Text(
                      'set it',
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.today),
                    label: const Text(
                      'set it and next',
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
