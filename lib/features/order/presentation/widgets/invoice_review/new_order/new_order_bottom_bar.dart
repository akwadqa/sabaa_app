// lib/features/order/presentation/widgets/invoice_review/new_order/new_order_bottom_bar.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/new_order/presentation/controller/new_order_controller.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/loading_button.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/new_order/invoice_created_dialog.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
import 'package:slider_button/slider_button.dart';

class NewOrderBottomBar extends ConsumerWidget {
  const NewOrderBottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newOrderControllerProvider).value!;
    final isReturn = state.isReturn;

    final isValid = isReturn
        ? true
        : (state.deliveryFee?.isNotEmpty ?? false);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 16,
          horizontal: 40,
        ),
        child: state.isSubmitting
            ? const LoadingButton()
            : AbsorbPointer(
                absorbing: !isValid,
                child: _buildSlider(context, ref, isValid, isReturn),
              ),
      ),
    );
  }

  Widget _buildSlider(
    BuildContext context,
    WidgetRef ref,
    bool isValid,
    bool isReturn,
  ) {
    return SliderButton(
      useGlassEffect: true,
      alignLabel: Alignment.center,
      action: () async {
        if (!isValid) return false;

        final invoice = await ref
            .read(newOrderControllerProvider.notifier)
            .createInvoice();

        if (invoice == null || !context.mounted) return false;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => InvoiceCreatedDialog(invoice: invoice),
            );
          }
        });

        return false;
      },
      label: Text(
        isReturn ? 'swipe_to_confirm_return'.tr() : 'swipe_to_confirm'.tr(),
        style: AppTextStyle.interSemiBold14.copyWith(
          color: isReturn ? AppColors.accent : AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: _sliderIcon(isValid, isReturn),
      width: double.infinity,
      height: 64,
      radius: 18,
      backgroundColor: AppColors.sliderBackground,
      shimmer: isValid,
      baseColor: isValid ? AppColors.sliderBase : Colors.grey.shade300,
      highlightedColor: isValid
          ? (isReturn ? AppColors.accent : AppColors.sliderHighlight)
          : Colors.grey,
      buttonColor: Colors.transparent,
    );
  }

  Widget _sliderIcon(bool isValid, bool isReturn) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: isValid
              ? (isReturn
                  ? AppColors.accentGradient
                  : AppColors.primaryGradient)
              : [AppColors.blueGrey, AppColors.gray],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryShadow,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.white,
        size: 18,
      ),
    );
  }
}