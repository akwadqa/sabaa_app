import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/new_order/presentation/widgets/invoice_widgets/invoice_review_card.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/shared_widgets/app_toast.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
import 'package:slider_button/slider_button.dart';

import '../../../../src/core/shared_widgets/custom_button_widget.dart';
import '../controller/new_order_controller.dart';
import '../widgets/swipe_confirm_button.dart';

class InvoiceReviewPage extends ConsumerWidget {
  const InvoiceReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newOrderControllerProvider).value!;

    final selectedProducts = state.selectedItems.values.toList();

    // 🔥 Map to UI model
    final items = selectedProducts.map((e) {
      final selected = state.selectedItems[e.product.itemCode];
      final total = e.product.price * (selected?.quantity ?? 0);

      return InvoiceItemUI(
        name: e.product.productName,
        count: selected?.quantity ?? 0,
        total: '${total.toStringAsFixed(0)} QAR',
      );
    }).toList();

    // 🔥 Calculations
    final subtotalValue = selectedProducts.fold<double>(
      0,
      (sum, e) =>
          sum +
          (e.product.price *
              (state.selectedItems[e.product.itemCode]?.quantity ?? 0)),
    );

    final taxValue = subtotalValue * 0.15;
    final totalValue = subtotalValue + taxValue;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(context),
      bottomNavigationBar: Consumer(
        builder: (context, ref, _) {
          final state = ref.watch(newOrderControllerProvider).value!;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: state.isSubmitting
                ? _LoadingButton()
                : SliderButton(
                  useGlassEffect: true,
                    action: () async {
                      final success = await ref
                          .read(newOrderControllerProvider.notifier)
                          .createInvoice();

                      if (success) {
                        _showSuccessDialog(context);
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
                        gradient: const LinearGradient(
                                  colors: AppColors.primaryGradient,

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
  baseColor: AppColors.sliderBase,
  highlightedColor: AppColors.sliderHighlight,
  buttonColor: Colors.transparent,
                  ).symmetricPadding(horizontal: 25),
          );
        },
      ),
      body: InvoiceReviewCard(
        items: items,
        subtotal: '${subtotalValue.toStringAsFixed(0)} QAR',
        tax: '15%',
        total: '${totalValue.toStringAsFixed(0)} QAR',
      ).symmetricPadding(horizontal: 12, vertical: 16),
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

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
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
                Icon(Icons.check_circle, color: AppColors.primary, size: 100),

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
              text: "back_to_home",
              onTap: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
              } ,
              isFiled: true,
              height: 48,
              width: double.infinity,
              backgroundColor:  AppColors.primary ,
              radius: 8,
            
            ),
              
              ],
            ),
          ),
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
