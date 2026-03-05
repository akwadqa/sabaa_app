import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';

class SocialLoginButton extends StatelessWidget {
  final Widget Function(Color color) iconBuilder;
  final Color iconColor;
  final String text;

  const SocialLoginButton._({
    required this.iconBuilder,
    required this.iconColor,
    required this.text,
  });

  SocialLoginButton.email()
      : this._(
          iconBuilder: (color) => Icon(
            Icons.email_outlined,
            color: color,
          ),
          iconColor: AppColors.primary,
          text: 'continue_with_email',
        );



  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFEFF0F6)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconBuilder(iconColor),
          8.horizontalSpace,
          Text(
            text.tr(),
            style: textTheme.bodyLarge!.copyWith(
              color: AppColors.gray02,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
