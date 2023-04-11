import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customSnackBar({
  required String type,
  required String title,
  required String message,
}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: type == 'error' ? Colors.red : Colors.green,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
  );
}
