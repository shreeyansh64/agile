import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showLoginSuccessToast(BuildContext context) {
  toastification.show(
    type: ToastificationType.success,
    style: ToastificationStyle.flat,
    description: Text("Login successful!"),
    icon: const Icon(Icons.check_circle, color: Colors.white),
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    borderRadius: BorderRadius.circular(10),
    autoCloseDuration: const Duration(seconds: 4),
    showProgressBar: true,
    alignment: Alignment.topRight,
  );
}

void showLoginErrorToast(BuildContext context) {
  toastification.show(
    description: Text("Login Failed "),
    icon: const Icon(Icons.error, color: Colors.white),
    backgroundColor: Colors.red,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    borderRadius: BorderRadius.circular(10),
    autoCloseDuration: const Duration(seconds: 4),
    showProgressBar: true,
    alignment: Alignment.topRight,
  );
}
