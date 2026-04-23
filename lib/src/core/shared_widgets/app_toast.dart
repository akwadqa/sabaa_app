import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:toastification/toastification.dart';

class AppToast {
  static void errorToast(String message) {
    if (message.isEmpty) {
      message = 'Error , please try again later';
    }
    message = message.replaceAll('Exception:', '').trim();

    if (message.contains('null')) message = 'Error , please try again later';

    toastification.dismissAll();

    toastification.show(
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.bottomCenter,
      type: ToastificationType.error,
      showProgressBar: false,
      style: ToastificationStyle.minimal,
      description: Text(message),
    );
  }

  static void successToast(String message) {
    toastification.dismissAll();
    toastification.show(
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.bottomCenter,
      primaryColor: AppColors.green,
      showProgressBar: false,
      style: ToastificationStyle.flat,
      type: ToastificationType.success,
      description: Text(message),
    );
  }

}
