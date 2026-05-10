import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:sabaa/src/core/utils/validator/app_validation.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

import '../../../../src/core/shared_widgets/arabic_number_input_formatter.dart';

class LoginPageNumberField extends ConsumerStatefulWidget {
  const LoginPageNumberField(
    this.fullPhoneController, {
    super.key,
    required this.onChange,
  });

  final TextEditingController? fullPhoneController;
  final void Function(PhoneNumber?)? onChange;

  // final GlobalKey<FormState> formKey;

  @override
  ConsumerState<LoginPageNumberField> createState() =>
      _LoginPageNumberFieldState();
}

class _LoginPageNumberFieldState extends ConsumerState<LoginPageNumberField> {
  late final TextEditingController _nationalController;
  @override
  void initState() {
    super.initState();
    _nationalController = TextEditingController();
  }

  @override
  void dispose() {
    _nationalController.dispose();
    super.dispose();
  }

  void _updateFullPhone(String countryCode) {
    final number = _nationalController.text;
    final full = '$countryCode$number';
    widget.fullPhoneController?.value = TextEditingValue(
      text: full.replaceAll('+', ''),
      selection: TextSelection.collapsed(offset: full.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: IntlPhoneField(
        autovalidateMode: AutovalidateMode.onUnfocus,
        invalidNumberMessage: context.tr('invalidNumber'),
        controller: _nationalController,
        initialCountryCode: 'QA',
        onSaved: (newValue) {
          _updateFullPhone(newValue?.countryCode ?? "");
        },
        onChanged: widget.onChange,
        // (phone) {

        // ref
        //     .read(signInControllerProvider.notifier)
        //     .changePhoneNumber(phone.number);

        //   //     .checkPhoneFilled(phone.number.isNotEmpty);
        // },
        onCountryChanged: (country) {
          _updateFullPhone('+${country.dialCode}');
        },
        validator: mobileNumberValidationIntl(context),
        // disableLengthCheck: true,
        dropdownIcon: Icon(
          Icons.arrow_drop_down_rounded,
          color: AppColors.black,
        ),
        cursorColor: AppColors.primary,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          ArabicNumberInputFormatter(),
        ],
        flagsButtonPadding: EdgeInsets.fromLTRB(16, 16, 0, 16),
        dropdownIconPosition: IconPosition.trailing,
        dropdownTextStyle: AppTextStyle.interRegular14.copyWith(
          color: AppColors.black,
        ),
        keyboardType: TextInputType.phone,
        style: AppTextStyle.interRegular14.copyWith(color: AppColors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grayBorder),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grayBorder),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: '000-000-00',
          hintStyle: AppTextStyle.interRegular14.copyWith(
            color: AppColors.grayBorder,
          ),
        ),
      ),
    );
  }
}
