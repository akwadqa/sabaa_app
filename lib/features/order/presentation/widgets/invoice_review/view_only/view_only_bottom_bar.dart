// lib/features/order/presentation/widgets/invoice_review/view_only/view_only_bottom_bar.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/loading_button.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/view_only/delivered_button.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/core/utils/functions/check_role.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class ViewOnlyBottomBar extends ConsumerWidget {
  const ViewOnlyBottomBar({
    super.key,
    required this.onShare,
    required this.onPrint,
    required this.isLoading,
    required this.invoiceId,
  });

  final VoidCallback onShare;
  final VoidCallback onPrint;
  final bool isLoading;
  final String invoiceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDelivery =
        checkRole(ref, delivery: true, defaultWidget: false) as bool;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: isLoading
            ? const LoadingButton()
            : Row(
                spacing: 12,
                children: [
                  Expanded(
                    child: isDelivery
                        ? DeliveredButton(invoiceId: invoiceId)
                        : _PrintButton(onPrint: onPrint),
                  ),
                ],
              ),
      ),
    );
  }
}

class _PrintButton extends StatelessWidget {
  const _PrintButton({required this.onPrint});

  final VoidCallback onPrint;

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      text: '',
      onTap: onPrint,
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
            Icons.print_outlined,
            color: AppColors.white,
            size: 25,
          ),
          Text(
            'print'.tr(),
            style: AppTextStyle.interSemiBold16
                .copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}