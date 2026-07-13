import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/main/presentation/screens/main_screen.dart';
import 'package:sabaa/features/new_order/presentation/controller/new_order_controller.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/core/utils/functions/check_role.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class InvoiceCreatedDialog extends ConsumerWidget {
  const InvoiceCreatedDialog({super.key, required this.invoice});

  final InvoiceModel invoice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(newOrderControllerProvider).value!;
    final isReturn = state.isReturn;

    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(color: Colors.transparent),
        ),
        Center(
          child: Dialog(
            backgroundColor: AppColors.white,
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
                    style: AppTextStyle.interBold22.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SvgPicture.asset(
                    Assets.icons.successCheckIcon.keyName,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    isReturn
                        ? 'return_invoice_created_successfully'.tr()
                        : 'invoice_created_successfully'.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.interRegular14.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (!isReturn)
                    checkRole(
                      ref,
                      salesMan: const SizedBox(),
                      defaultWidget: _PayNowButton(invoice: invoice),
                    ),
                  const SizedBox(height: 8),
                  _BackToHomeButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PayNowButton extends ConsumerWidget {
  const _PayNowButton({required this.invoice});

  final InvoiceModel invoice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customer = ref.read(newOrderControllerProvider).value!.customer;

    return CustomButtonWidget(
      text: 'pay_now',
      onTap: () {
        context.goNamed(AppRoutes.mainScreen);
        context.pushNamed(
          AppRoutes.orderSummaryScreen,
          extra: {
            'customer': customer,
            'invoice': invoice,
            'openPayment': true,
          },
        );
      },
      isFiled: true,
      height: 48,
      width: double.infinity,
      backgroundColor: AppColors.primary,
      radius: 8,
    );
  }
}

class _BackToHomeButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {
        ref.read(bottomNavIndexProvider.notifier).state = 0;
        context.goNamed(AppRoutes.mainScreen);
      },
      child: Text(
        'back_to_home'.tr(),
        style: AppTextStyle.interSemiBold14.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }
}