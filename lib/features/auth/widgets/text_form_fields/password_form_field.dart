import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/core/utils/validator/app_validation.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
import 'package:sabaa/src/resourses/font_manager/font_manager.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({super.key, this.onSaved, required this.passwordController});
  final void Function(String?)? onSaved;
 final TextEditingController passwordController;
  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  // final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr("password"),
          style:
              AppTextStyle.interSemiBold16,
        ).onlyPadding(start: 8),
        8.verticalSpace,
        TextFormField(
          controller: widget.passwordController,
          obscureText: _obscurePassword,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            hintText: "password".tr(),
                hintStyle: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(fontSize: 14, color: AppColors.grey600),
            prefixIcon: Assets.icons.lockIc.svg(
              width: 18,
              height: 18,
              fit: BoxFit.scaleDown,
            ),
            // 👇 Suffix eye icon
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                size: 25,
                color: AppColors.bodyColor,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
          onChanged: widget.onSaved,
          validator: (pass) => AppValidation.validatePassword(pass, context),
        ),
      ],
    );
  }
}
