import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class CustomDeafultAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool? withBackButton;
  final Widget? actionButton;
  const CustomDeafultAppbar({
    super.key,
    required this.title,
    this.withBackButton = true,
    this.actionButton,
  });

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;

    return Container(
      height: preferredSize.height + topPadding,
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (withBackButton ?? false)
                ? GestureDetector(
                    onTap: () {
                      context.pop();
                      // if (context.canPop()) {
                      //   context.pop();
                      // } else {
                      //   context.go(AppRoutes.main);
                      // }
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.cardWhite,
                      ),
                      // boxShadow: [
                      //   BoxShadow(
                      //       color: AppColors.black.withValues(alpha: .25),
                      //       blurRadius: 4)
                      // ]),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: AppColors.primary,
                      ),
                    ),
                    // child: Assets.icons.verificationArrowBackIc.svg(
                    //   width: 30,
                    // ),
                  )
                : 22.horizontalSpace,
            Center(
              child: Text(
                title,
                style: AppTextStyle.interSemiBold20.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            (actionButton != null) ? actionButton! : 22.horizontalSpace,
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
