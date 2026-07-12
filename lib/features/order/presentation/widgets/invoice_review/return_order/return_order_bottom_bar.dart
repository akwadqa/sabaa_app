// lib/features/order/presentation/widgets/invoice_review/return_order/return_order_bottom_bar.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/loading_button.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/return_order/return_created_dialog.dart';
import 'package:sabaa/features/return_invoice/presentation/controller/return_order_controller.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
import 'package:slider_button/slider_button.dart';

class ReturnOrderBottomBar extends ConsumerWidget {
  const ReturnOrderBottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(returnOrderControllerProvider).value!;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 16,
          horizontal: 40,
        ),
        child: state.isSubmitting
            ? const LoadingButton()
            : _buildSlider(context, ref),
      ),
    );
  }

  Widget _buildSlider(BuildContext context, WidgetRef ref) {
    return SliderButton(
      useGlassEffect: true,
      alignLabel: Alignment.center,
      action: () async {
        final success = await ref
            .read(returnOrderControllerProvider.notifier)
            .createReturnOrder();

        if (!success || !context.mounted) return false;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const ReturnCreatedDialog(),
            );
          }
        });

        return false;
      },
      label: Text(
        'swipe_to_confirm'.tr(),
        style: AppTextStyle.interSemiBold14.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: AppColors.primaryGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white,
          size: 18,
        ),
      ),
      width: double.infinity,
      height: 64,
      radius: 18,
      backgroundColor: AppColors.sliderBackground,
      baseColor: AppColors.sliderBase,
      highlightedColor: AppColors.sliderHighlight,
      buttonColor: Colors.transparent,
    );
  }
}