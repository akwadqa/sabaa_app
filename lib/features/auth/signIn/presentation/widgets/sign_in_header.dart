import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      spacing: 10,
      children: [
        20.verticalSpace,
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.all(Radius.circular(8))
              ),
          child: Assets.icons.truckIc.svg(),
        ),
        // Text(
        //   'login'.tr(),
        //   textAlign: TextAlign.center,
        //   style: textTheme.headlineLarge!.copyWith(
        //     color: AppColors.primary,
        //     fontWeight: FontWeight.w900,
        //   ),
        // ),
        // 10.verticalSpace,
        Text(
          'sabaa'.tr(),
          textAlign: TextAlign.start,
          style: AppTextStyle.interBold30,
          // style: textTheme.displaySmall!.copyWith(
          //   color: AppColors.black,
          //   fontWeight: FontWeight.w800,
          // ),
        ),
        Text(
          'field_operations_portal'.tr(),
          textAlign: TextAlign.start,
          style: AppTextStyle.interRegular16,
          // style: textTheme.displaySmall!.copyWith(
          //   color: AppColors.black,
          //   fontWeight: FontWeight.w800,
          // ),
        ),
      ],
    ).onlyPadding(bottom: 10);
  }
}
