import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/customers/presentation/screens/create_customer_success_page.dart';
import 'package:sabaa/features/main/presentation/screens/main_screen.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';

import '../../../../src/core/shared_widgets/custom_button_widget.dart';
import '../../../../src/resourses/font_manager/app_text_style.dart';
import '../controller/order_controller.dart';

class PaymentSuccessPage extends ConsumerWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final payment =
        ref.watch(orderControllerProvider).value!.paymentData;

    if (payment == null) {
      return const Scaffold(
        body: Center(child: Text("No payment data")),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            /// ICON
            const SuccessIcon(),

            const SizedBox(height: 20),

            Text(
              "Payment Successful!",
              style: AppTextStyle.interBold22,
            ),

            const SizedBox(height: 8),

            Text(
              "The payment has been successfully recorded.",
              textAlign: TextAlign.center,
              style: AppTextStyle.interRegular14.copyWith(
                color: AppColors.textSecondary,
              ),
            ),

            const SizedBox(height: 24),

            /// CARD
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                border: BorderDirectional(
                  start: BorderSide(color: AppColors.primary, width: 6),
                ),
              ),
              child: Column(
                children: [
                  Text("AMOUNT PAID"),

                  const SizedBox(height: 10),

                  Text(
                    payment.paidAmount.toCurrency(),
                    style: AppTextStyle.interBold22
                        .copyWith(color: AppColors.primary),
                  ),

                  const Divider(height: 30),

                  _row("Invoice", payment.paymentId),
                  _row("Customer", payment.partyName),
                  // _row("Paid Amount", payment.paidAmount.toCurrency()),
                  _row("Payment Type", payment.paymentType),
                  _row("Payment Method", payment.modeOfPayment),
                ],
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomButtonWidget(
                text: "Done",
                onTap: () {
                  ref.read(bottomNavIndexProvider.notifier).state = 0;
                  context.goNamed(AppRoutes.mainScreen);
                },
                isFiled: true,
                backgroundColor: AppColors.primary, height: 50, width: double.infinity,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}