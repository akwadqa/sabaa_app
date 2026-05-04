import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/core/shared_widgets/app_toast.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';
import 'package:url_launcher/url_launcher.dart';

Future<T> retryOperation<T>(
  Future<T> Function() operation, {
  int maxAttempts = 3,
}) async {
  int attempts = 0;
  while (attempts < maxAttempts) {
    try {
      return await operation();
    } catch (e) {
      attempts++;
      Dev.logLine('Operation failed (attempt $attempts): $e');
      if (attempts >= maxAttempts) rethrow;
      // Exponential backoff
      await Future.delayed(
        Duration(milliseconds: pow(2, attempts).toInt() * 500),
      );
    }
  }
  throw Exception('Failed after $maxAttempts attempts');
}

bool isRTL(String text) {
  final rtlRegex = RegExp(r'^[\u0600-\u06FF]');
  return rtlRegex.hasMatch(text.trim());
}

// Future<void> safelyPop(BuildContext context) async {
//   FocusScope.of(context).unfocus();
//   await Future.delayed(const Duration(milliseconds: 100));
//   if (context.mounted) context.maybePop();
// }
String formatPrice(double value) {
  if (value % 1 == 0) {
    return '${value.toInt()} QAR';
  } else {
    return '${value.toStringAsFixed(2)} QAR';
  }
}
String translate(String ar, String en, BuildContext context) {
  final local = context.locale.languageCode;
  return local == 'ar' ? ar : en;
}

Future<void> openPhoneDialer(String phoneNumber) async {
  final String cleanNumber = phoneNumber.replaceAll(RegExp(r'\s+\b|\b\s'), '');

  final Uri phoneUri = Uri(scheme: 'tel', path: cleanNumber);

  try {
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(
        phoneUri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      Dev.logLine("المشغل لا يدعم فتح لوحة الاتصال");
      AppToast.errorToast("لايمكن فتح قائمه الاتصالات ، ربما لايوجد رقم للزبون");
    }
  } catch (e) {
    Dev.logLine("حدث خطأ أثناء محاولة فتح تطبيق الهاتف: $e");
  }
}