import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class DeliveredButton extends ConsumerWidget {
  const DeliveredButton({super.key, required this.invoiceId});

  final String invoiceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomButtonWidget(
      text: '',
      onTap: () async {
        // TODO: Call mark-as-delivered API
      },
      width: double.infinity,
      isFiled: true,
      height: 48,
      backgroundColor: AppColors.successGreen,
      radius: 12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          const Icon(
            Icons.check_circle_outline_rounded,
            color: AppColors.white,
            size: 25,
          ),
          Text(
            'delivered'.tr(),
            style: AppTextStyle.interSemiBold16
                .copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}