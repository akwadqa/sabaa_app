import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/order/presentation/controller/order_controller.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class PaymentConfirmButton extends ConsumerWidget {
  final String invoiceId;
  final String paidAmount;
  final bool hasAmount;

  const PaymentConfirmButton({
    super.key,
    required this.invoiceId,
    required this.paidAmount,
    required this.hasAmount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(orderControllerProvider
        .select((val) => val.value!.createPaymentResponse));

    if (controller != null) {
      return controller.maybeWhen(
        loading: () => const AppLoader(),
        orElse: () => _buildButton(ref),
      );
    }

    return _buildButton(ref);
  }

  Widget _buildButton(WidgetRef ref) {
    return CustomButtonWidget(
      text: '',
      onTap: hasAmount
          ? () {
              ref.read(orderControllerProvider.notifier).createPayment(
                    invoiceId: invoiceId,
                    paidAmount: paidAmount,
                  );
            }
          : null,
      isFiled: true,
      backgroundColor: hasAmount ? AppColors.primary : const Color(0xFFA0A0A0),
      height: 48,
      width: double.infinity,
      radius: 12,
      style: AppTextStyle.rubikBold16.copyWith(color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'confirm_payment'.tr(),
            style: AppTextStyle.rubikBold16.copyWith(color: AppColors.white),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.check_circle_outline,
              color: AppColors.white, size: 14),
        ],
      ),
    ).symmetricPadding(
      horizontal: 37,
    );
  }
}
