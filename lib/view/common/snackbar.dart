import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbarErrorTo(String to, Exception e) {
  Get.snackbar(
    'sset_error'.tr,
    'sset_description'.trParams({
      'to': to,
      'e': e.toString(),
    }),
    icon: const Icon(Icons.error),
    isDismissible: true,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 5),
  );
}
