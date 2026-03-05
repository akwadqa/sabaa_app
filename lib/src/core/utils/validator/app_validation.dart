import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

String? Function(String?) mobileNumberValidation(BuildContext context) {
  return qValidator([
    IsRequired(context.tr('required')),
    MaxLength(8, context.tr('mustBeEightDigits')),
    MinLength(8, context.tr('mustBeEightDigits')),
    RegExpRule(
      RegExp(r'^([3567])\d+'),
      context.tr('qatariPhoneNumberValidator'),
    ),
  ]);
}
FutureOr<String?> Function(PhoneNumber?) mobileNumberValidationIntl(
  BuildContext context,
) {
    Dev.logLine("PhoneNumber");
    Dev.logLine(PhoneNumber);

  return (PhoneNumber? value) {
    Dev.logLine(value);
    final number = value?.number ?? '';

    if (number.isEmpty||value ==null) {
      return context.tr('required');
    }

    if (number.length != 8) {
      return context.tr('mustBeEightDigits');
    }

    if (!RegExp(r'^[3567]\d{7}$').hasMatch(number)) {
      return context.tr('qatariPhoneNumberValidator');
    }

    return null;
  };

  
}

String? Function(String?) nameValidation(BuildContext context) {
  return qValidator([
    IsRequired(context.tr('required')),
  ]);
}


class AppValidation {

  static String? validateRequired(String? value, BuildContext context, {String? errorKey}) {
    if (value == null || value.isEmpty) {
      return errorKey ?? context.tr("field_required");
    }
    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    int passLengthRule = 6;

    if (value == null || value.isEmpty) {
      return context.tr("please_enter_password");
    }

    if (value.length < passLengthRule) {
      return context.tr(
        "password_length_error",
        args: ['$passLengthRule'],
      );
    }

    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    String passwordValue,
    BuildContext context,
  ) {
    if (value == null || value.isEmpty) {
      return context.tr("please_enter_password");
    }

    if (value != passwordValue) {
      return context.tr("password_mismatch");
    }

    return null;
  }

  static String? validateCustomerName(String? value, BuildContext context) {
    return validateRequired(
      value,
      context,
      errorKey: context.tr("please_enter_customer_name"),
    );
  }

  static String? validateUserName(String? value, BuildContext context) {
    return validateRequired(
      value,
      context,
      errorKey: context.tr("please_enter_user_name"),
    );
  }

  static String? validateQatarId(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.tr("please_enter_qatar_id");
    }

    if (value.length != 11) {
      return context.tr("invalid_qatar_id");
    }

    return null;
  }

  static String? validateQatarPhone(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.tr("please_enter_phone_number");
    }

    if (value.length != 8) {
      return context.tr("invalid_phone_number");
    }

    return null;
  }
}