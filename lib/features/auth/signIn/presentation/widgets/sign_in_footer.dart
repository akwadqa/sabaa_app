import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return  Align(
      alignment: AlignmentGeometry.bottomEnd,
      child: GestureDetector(
        onTap: () {
          // context.pushReplacement(AppRoutes.mainScreen);
        },
        child: Text(
                  'forget_password'.tr(),
                  style: textTheme.bodyLarge!.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
      ),
    );}
}
