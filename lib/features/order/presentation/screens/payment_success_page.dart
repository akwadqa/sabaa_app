import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/order/domain/create_payment/create_payment_response.dart';
import 'package:sabaa/features/order/presentation/widgets/payment_success_page/payment_receipt_card.dart';
import 'package:sabaa/features/order/presentation/widgets/payment_success_page/payment_success_message.dart';
import 'package:sabaa/features/order/presentation/widgets/payment_success_page/success_icon.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class PaymentSuccessPage extends ConsumerWidget {
  final CreatePaymentResponse paymentResponse;

  const PaymentSuccessPage({super.key, required this.paymentResponse});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 45),
              const SuccessIcon(),
              const SizedBox(height: 24),
              const PaymentSuccessMessage(),
              const SizedBox(height: 30),
              PaymentReceiptCard(
                amount: paymentResponse.paidAmount.toString(),
                invoiceId: paymentResponse.paymentId,
                customerName: paymentResponse.createdBy,
                date: paymentResponse.createdAt,
                paymentMethod: paymentResponse.paymentType,
              ),
              const SizedBox(height: 30),
              CustomButtonWidget(
                text: 'done'.tr(),
                elevation: 10,
                shadowColor: AppColors.primary.withOpacity(0.3),
                backgroundColor: AppColors.primary,
                radius: 12,
                onTap: () {
                  context.go(AppRoutes.mainScreen);
                },
                isFiled: false,
                height: 48,
                width: 300,
                style:
                    AppTextStyle.rubikBold18.copyWith(color: AppColors.white),
              ),
              const SizedBox(height: 34),
            ],
          ),
        ),
      ),
    );
  }
}
