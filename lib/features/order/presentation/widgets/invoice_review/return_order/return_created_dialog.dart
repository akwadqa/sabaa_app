// lib/features/order/presentation/widgets/invoice_review/return_order/return_created_dialog.dart

import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/main/presentation/screens/main_screen.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class ReturnCreatedDialog extends ConsumerWidget {
  const ReturnCreatedDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(color: Colors.transparent),
        ),
        Center(
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'transaction_successful'.tr(),
                    style: AppTextStyle.interBold22
                        .copyWith(color: AppColors.primary),
                  ),
                  const SizedBox(height: 20),
                  SvgPicture.asset(
                    Assets.icons.successCheckIcon.keyName,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'invoice_created_successfully'.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.interRegular14
                        .copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 24),
                  CustomButtonWidget(
                    text: 'back_to_home',
                    onTap: () {
                      ref.read(bottomNavIndexProvider.notifier).state = 0;
                      context.goNamed(AppRoutes.mainScreen);
                    },
                    isFiled: true,
                    height: 48,
                    width: double.infinity,
                    backgroundColor: AppColors.primary,
                    radius: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}