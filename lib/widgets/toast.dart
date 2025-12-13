import 'package:agile/styles/appText.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showLoginSuccessToast(BuildContext context) {
  double _responsive(num) {
    final width = MediaQuery.widthOf(context);
    return (width / 360) * num;
  }

  toastification.show(
    type: ToastificationType.success,
    style: ToastificationStyle.flat,
    description: Text(
      "Login successful!",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    icon: const Icon(Icons.check_circle, color: Colors.black),
    backgroundColor: Colors.green.withOpacity(0.2),
    foregroundColor: Colors.black,
    borderSide: BorderSide(color: Colors.green, width: 1),
    padding: EdgeInsets.symmetric(
      horizontal: _responsive(16),
      vertical: _responsive(12),
    ),
    borderRadius: BorderRadius.circular(10),
    autoCloseDuration: const Duration(seconds: 3),
    showProgressBar: true,
    progressBarTheme: ProgressIndicatorThemeData(
      linearTrackColor: Colors.green,
      color: Colors.white.withOpacity(0.4),
    ),
    alignment: Alignment.topRight,
  );
}

void showLoginErrorToast(BuildContext context) {
  double _responsive(num) {
    final width = MediaQuery.widthOf(context);
    return (width / 360) * num;
  }

  toastification.show(
    title: Text("Login Failed", style: TextStyle(fontWeight: FontWeight.bold)),
    description: Text("Kindly check the login details once again"),
    icon: const Icon(Icons.error, color: Colors.black),
    backgroundColor: Colors.red.withOpacity(0.2),
    foregroundColor: Colors.black,
    padding: EdgeInsets.symmetric(
      horizontal: _responsive(16),
      vertical: _responsive(12),
    ),
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.red, width: 1),
    autoCloseDuration: const Duration(seconds: 3),
    showProgressBar: true,
    progressBarTheme: ProgressIndicatorThemeData(
      linearTrackColor: Colors.red,
      color: Colors.white.withOpacity(0.4),
    ),
    alignment: Alignment.topRight,
  );
}

void termsAndCondition(BuildContext context) {
    double _responsive(num) {
      final width = MediaQuery.widthOf(context);
      return (width / 360) * num;
    }

    toastification.show(
      title: Text(
        "Terms & Policy",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: Text("Kindly agree with the terms and policy to sign up"),
      icon: const Icon(Icons.error, color: Colors.black),
      backgroundColor: Colors.red.withOpacity(0.2),
      foregroundColor: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: _responsive(16),
        vertical: _responsive(12),
      ),
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.red, width: 1),
      autoCloseDuration: const Duration(seconds: 3),
      showProgressBar: true,
      progressBarTheme: ProgressIndicatorThemeData(
        linearTrackColor: Colors.red,
        color: Colors.white.withOpacity(0.4),
      ),
      alignment: Alignment.topRight,
    );
  }