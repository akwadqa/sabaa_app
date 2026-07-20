import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/new_order/presentation/widgets/order_widgets/free_item_toggle.dart';
import 'package:sabaa/features/new_order/presentation/widgets/order_widgets/new_order_section_header_widget.dart';
import 'package:sabaa/features/order/presentation/pages/unified_invoice_review_page.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

import '../controller/new_order_controller.dart';
import '../widgets/order_widgets/order_card/order_item_card.dart';

class InvoiceSummaryPage extends ConsumerWidget {
  const InvoiceSummaryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newOrderControllerProvider).value!;

    final items = state.selectedItems.values.toList();
    final isReturn = state.isReturn; // ✅

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(context, isReturn),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: CustomButtonWidget(
            text: isReturn ? "confirm_return" : "confirm_order", // ✅
            onTap: () {
              context.push(AppRoutes.invoiceReviewScreen, extra: {
                'mode': InvoiceReviewMode.newOrder,
              });
              // context.push(AppRoutes.invoiceReviewPage);
            },
            isFiled: true,
            height: 48,
            width: double.infinity,
            backgroundColor:
                isReturn ? AppColors.accent : AppColors.primary, // ✅
            radius: 8,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          spacing: 20,
          children: [
            NewOrderSectionHeaderWidget(
              titleKey: isReturn ? 'return_items' : 'invoice_items', // ✅
              count: state.selectedItems.length,
              isReturn: isReturn, // ✅
            ),
            Expanded(
              child: ListView(
                // padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                children: items.map((selected) {
                  final item = selected.product;

                  return OrderItemCard(
                          item: item,

                          // OrderItem(
                          //   id: item.itemCode,
                          //   name: item.productName,
                          //   sku: item.itemCode,
                          //   price: '${item.price.toStringAsFixed(2)} QAR',
                          //   isReturn: false,
                          // ),
                          allowEditPrice: isReturn,
                          customRate: selected.customRate,
                          quantity: selected.quantity,
                          selectedUnit: selected.unit,
                          showFreeToggle: !isReturn,
                          freeQuantity: selected.freeQuantity,
                          onFreeQuantityChanged: (freeQty) {
                            ref
                                .read(newOrderControllerProvider.notifier)
                                .updateFreeQuantity(item.itemCode, freeQty);
                          },
                          isSelected: true,
                          onRateChanged: (rate) {
                            ref
                                .read(newOrderControllerProvider.notifier)
                                .updateRate(item.itemCode, rate);
                          },
                          onIncrement: () => ref
                              .read(newOrderControllerProvider.notifier)
                              .increment(item),
                          onDecrement: () => ref
                              .read(newOrderControllerProvider.notifier)
                              .decrement(item.itemCode),
                          onDelete: () => ref
                              .read(newOrderControllerProvider.notifier)
                              .toggleItem(item),
                          onUnitChanged: (unit) => ref
                              .read(newOrderControllerProvider.notifier)
                              .updateUnit(item.itemCode, unit))
                      .onlyPadding(bottom: 20);
                }).toList(),

// children: items.map((selected) {
//   final item = selected.product;

//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       OrderItemCard(
//         item: item,
//         allowEditPrice: isReturn,
//         customRate: selected.customRate,
//         quantity: selected.quantity,
//         selectedUnit: selected.unit,
//         isSelected: true,
//         onRateChanged: (rate) {
//           ref
//               .read(newOrderControllerProvider.notifier)
//               .updateRate(item.itemCode, rate);
//         },
//         onIncrement: () => ref
//             .read(newOrderControllerProvider.notifier)
//             .increment(item),
//         onDecrement: () => ref
//             .read(newOrderControllerProvider.notifier)
//             .decrement(item.itemCode),
//         onDelete: () => ref
//             .read(newOrderControllerProvider.notifier)
//             .toggleItem(item),
//         onUnitChanged: (unit) => ref
//             .read(newOrderControllerProvider.notifier)
//             .updateUnit(item.itemCode, unit),
//       ),

//       // ✅ Free Items Toggle — only for normal orders, not returns

//       const SizedBox(height: 20),
//     ],
//   );
// }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(context, bool isReturn) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
      ),
      title: Text(
        isReturn ? 'return_summary'.tr() : 'invoice_summary'.tr(), // ✅
        style: AppTextStyle.interBold20.copyWith(color: AppColors.dark),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, color: AppColors.navBorder),
      ),
    );
  }
}
