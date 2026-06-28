import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/customers/presentation/widgets/add_customer_page/custom_labeled_text_filed.dart';
import 'package:sabaa/features/main/presentation/screens/main_screen.dart';
import 'package:sabaa/features/new_order/presentation/widgets/invoice_widgets/invoice_review_card.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/shared_widgets/app_toast.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/core/utils/functions/helper_methods.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
import 'package:slider_button/slider_button.dart';

import '../../../../src/core/shared_widgets/custom_button_widget.dart';
import '../controller/new_order_controller.dart';

class InvoiceReviewPage extends ConsumerWidget {
  const InvoiceReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newOrderControllerProvider).value!;
    final controller = ref.read(newOrderControllerProvider.notifier);

    final selectedProducts = state.selectedItems.values.toList();

    // 🔥 Map to UI model
    final items = selectedProducts.map((e) {
      final selected = state.selectedItems[e.product.itemCode];
      // final total = e.product.price * (selected?.quantity ?? 0);
      final selectedUnit = selected?.unit ?? e.product.uoms.first.uom;

      final price = e.product.uoms
          .firstWhere(
            (u) => u.uom == selectedUnit,
            orElse: () => e.product.uoms.first,
          )
          .price;

      final qty = selected?.quantity ?? 0;

      final total = price * qty;
      return InvoiceItemUI(
        name: e.product.productName,
        count: qty,
        total: total.toCurrency(),
      );
    }).toList();

    // 🔥 Calculations
    final subtotalValue = selectedProducts.fold<double>(
      0,
      (sum, e) {
        final selected = state.selectedItems[e.product.itemCode];

        final unit = selected?.unit ?? e.product.uoms.first.uom;

        final price = e.product.uoms
            .firstWhere(
              (u) => u.uom == unit,
              orElse: () => e.product.uoms.first,
            )
            .price;

        final qty = selected?.quantity ?? 0;

        return sum + (price * qty);
      },
    );

    final deliveryFee = double.parse(state.deliveryFee ?? "0");
    final totalValue = subtotalValue + deliveryFee;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(context),
      bottomNavigationBar: Consumer(
        builder: (context, ref, _) {
          final state = ref.watch(newOrderControllerProvider).value!;
          final isValid = state.deliveryFee != null &&
              (state.deliveryFee?.isNotEmpty ?? false);
          return SafeArea(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 16, horizontal: 40),
              child: state.isSubmitting
                  ? _LoadingButton()
                  : AbsorbPointer(
                      absorbing: !isValid,
                      child: SliderButton(
                        useGlassEffect: true,
                        alignLabel: Alignment.center,
                        action: () async {
                          if (!isValid) return false;
                          final controller =
                              ref.read(newOrderControllerProvider.notifier);

                          final invoice = await controller.createInvoice();

                          if (invoice != null) {
                            await _showSuccessDialog(context, ref, invoice);
                          }

                          // return success;
                        },
                        label: Text(
                          "swipe_to_confirm".tr(),
                          style: AppTextStyle.interSemiBold14.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2,
                          ),
                        ),
                        icon: Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: isValid
                                  ? AppColors.primaryGradient
                                  : [AppColors.blueGrey, AppColors.gray],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryShadow,
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
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
                        shimmer: isValid,
                        baseColor: isValid
                            ? AppColors.sliderBase
                            : Colors.grey.shade300,
                        highlightedColor:
                            isValid ? AppColors.sliderHighlight : Colors.grey,
                        buttonColor: Colors.transparent,
                      ),
                    ),
            ),
          );
        },
      ),
      body: Column(
        spacing: 12,
        children: [
          20.verticalSpace,
          CustomLabeledTextField(
            label: 'delivery_fee',
            hint: 'enter_delivery_fee',
            // controller: _nameController,
            onChanged: (value) => controller.editDeliveryFee(value),
          ).symmetricPadding(horizontal: 12),
          InvoiceReviewCard(
            items: items,
            subtotal: formatPrice(subtotalValue),
            deliveyFee: state.deliveryFee ?? "0",
            total: formatPrice(totalValue),
          ).symmetricPadding(horizontal: 12, vertical: 16),
        ],
      ),
    );
  }
  // ── AppBar ─────────────────────────────────────────────────────────────────

  PreferredSizeWidget _buildAppBar(context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
      ),
      title: Text(
        'invoice_review'.tr(),
        style: AppTextStyle.interBold20.copyWith(color: AppColors.dark),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, color: AppColors.navBorder),
      ),
    );
  }

  Future<void> _showSuccessDialog(
      BuildContext context, WidgetRef ref, InvoiceModel? invoice) async {
    final state = ref.watch(newOrderControllerProvider).value!;
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Stack(          children: [
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
                        "transaction_successful".tr(),
                        style: AppTextStyle.interBold22.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// ICON
                      SvgPicture.asset(
                        Assets.icons.successCheckIcon.keyName,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 20),

                      Text(
                        "invoice_created_successfully".tr(),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.interRegular14.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),

                      const SizedBox(height: 24),
                      CustomButtonWidget(
                        text: "pay_now",
                        onTap: () {
                          // int count = 0;
                          // Navigator.popUntil(context, (route) {
                          //   return count++ == 4;
                          // });

                          // Navigator.popUntil(context, (route) {
                          //   return route.settings.name ==
                          //       AppRoutes.customerDetailsScreen;
                          // });
                          context.goNamed(AppRoutes.mainScreen); // ✅ best

                          context.pushNamed(
                            AppRoutes.orderSummaryScreen,
                            extra: {
                              'customer': state.customer,
                              'invoice': invoice,
                              'openPayment': true,
                            },
                          );
                          // ref.read(bottomNavIndexProvider.notifier).state = 0;
                          // Navigator.popUntil(context,
                          //     (route) => route == AppRoutes.orderSummaryScreen);
                        },
                        isFiled: true,
                        height: 48,
                        width: double.infinity,
                        backgroundColor: AppColors.primary,
                        radius: 8,
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          ref.read(bottomNavIndexProvider.notifier).state = 0;

                          context.goNamed(AppRoutes.mainScreen); // ✅ best
                        },
                        child: Text(
                          "back_to_home".tr(),
                          style: AppTextStyle.interSemiBold14.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _LoadingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLoader(),
            const SizedBox(width: 12),
            Text(
              "processing".tr(),
              style: AppTextStyle.interSemiBold14.copyWith(
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
