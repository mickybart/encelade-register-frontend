import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbarErrorTo(String to, Exception e) {
  Get.snackbar(
    'Error',
    'Sorry, we are not able to $to due to the following error:\n\n$e',
    icon: const Icon(Icons.error),
    isDismissible: true,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 5),
  );
}
