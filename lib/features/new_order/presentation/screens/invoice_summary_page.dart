import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/new_order/domain/model/order_item.dart';
import 'package:sabaa/features/new_order/presentation/controller/new_order_state.dart';
import 'package:sabaa/features/new_order/presentation/widgets/order_widgets/new_order_section_header_widget.dart';
import 'package:sabaa/features/new_order/presentation/widgets/order_widgets/order_card/item_line_card.dart';
import 'package:sabaa/features/order/presentation/pages/unified_invoice_review_page.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

import '../../../../src/core/shared_widgets/app_toast.dart';
import '../controller/new_order_controller.dart';
import '../widgets/order_widgets/order_card/order_item_card.dart';

class InvoiceSummaryPage extends ConsumerWidget {
  const InvoiceSummaryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newOrderControllerProvider).value!;
    final items = state.selectedItems.values.toList();
    final isReturn = state.isReturn;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(context, isReturn),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: CustomButtonWidget(
            text: isReturn ? "confirm_return" : "confirm_order",
            onTap: () {
              final validationError = _validateLines(state);
              if (validationError != null) {
                AppToast.errorToast(validationError); // ✅ use your toast
                return;
              }
              context.push(AppRoutes.invoiceReviewScreen, extra: {
                'mode': InvoiceReviewMode.newOrder,
              });
            },
            isFiled: true,
            height: 48,
            width: double.infinity,
            backgroundColor: isReturn ? AppColors.accent : AppColors.primary,
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
              titleKey: isReturn ? 'return_items' : 'invoice_items',
              count: state.selectedItems.length,
              isReturn: isReturn,
            ),
            Expanded(
              child: ListView(
                children: _buildGroupedLines(context, ref, state, isReturn),
              ),
            ),
            // Expanded(
            //   child: ListView(
            //     children: items.map((selected) {
            //       final item = selected.product;

            //       return OrderItemCard(
            //         item: item,
            //         allowEditPrice: isReturn,
            //         customRate: selected.customRate,
            //         quantity: selected.quantity,
            //         selectedUnit: selected.unit,
            //         showFreeToggle: !isReturn,
            //         isFocEnabled: selected.isFocEnabled,
            //         focUom: selected.focUom,
            //         focQuantity: selected.focQuantity,
            //         isAllFree: selected.isAllFree,
            //         extraUomLines: selected.extraUomLines,
            //         onAllFreeToggle: (value) {
            //           ref
            //               .read(newOrderControllerProvider.notifier)
            //               .toggleAllFree(item.itemCode, value: value);
            //         },
            //         onFocToggle: (isEnabled) {
            //           ref
            //               .read(newOrderControllerProvider.notifier)
            //               .toggleFoc(item.itemCode, value: isEnabled);
            //         },
            //         onFocUomChanged: (uom) {
            //           ref
            //               .read(newOrderControllerProvider.notifier)
            //               .updateFocUom(item.itemCode, uom);
            //         },
            //         onFocQuantityChanged: (freeQty) {
            //           ref
            //               .read(newOrderControllerProvider.notifier)
            //               .updateFocQuantity(item.itemCode, freeQty);
            //         },
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
            //       ).onlyPadding(bottom: 20);
            //     }).toList(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildGroupedLines(
    BuildContext context,
    WidgetRef ref,
    NewOrderState state,
    bool isReturn,
  ) {
    final widgets = <Widget>[];

    // ── Preserve insertion order ───────────────────────────────
    final grouped = <String, List<SelectedItemLine>>{};
    final order = <String>[];

    for (final line in state.selectedLines) {
      final code = line.product.itemCode;
      if (!grouped.containsKey(code)) {
        order.add(code);
        grouped[code] = [];
      }
      grouped[code]!.add(line);
    }

    for (final itemCode in order) {
      final productLines = grouped[itemCode]!;
      final product = productLines.first.product;

      // ── All lines for this product, stacked ────────────────
      for (int i = 0; i < productLines.length; i++) {
        final line = productLines[i];
        final isLastLine = i == productLines.length - 1;

        widgets.add(
          ItemLineCard(
            key: ValueKey(line.lineId),
            line: line,
            canDelete: productLines.length > 1,
            isOnlyLine: productLines.length == 1,
          ).onlyPadding(bottom: isLastLine ? 0 : 8), // tight between lines
        );
      }

      // ── "Add line" button directly after last line ─────────
      if (!isReturn) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 20),
            child: GestureDetector(
              onTap: () => ref
                  .read(newOrderControllerProvider.notifier)
                  .addLineForItem(product),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.25),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add_circle_outline_rounded,
                      size: 15,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'add_uom_line'.tr(),
                      style: AppTextStyle.interSemiBold12
                          .copyWith(color: AppColors.primary),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }

    return widgets;
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
        isReturn ? 'return_summary'.tr() : 'invoice_summary'.tr(),
        style: AppTextStyle.interBold20.copyWith(color: AppColors.dark),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, color: AppColors.navBorder),
      ),
    );
  }

  /// Returns error message string if invalid, null if all good
  String? _validateLines(NewOrderState state) {
    // ── Group lines to check total qty per itemCode+uom ──────────
    final grouped = <String, Map<String, int>>{}; // itemCode → uom → totalQty

    for (final line in state.selectedLines) {
      grouped.putIfAbsent(line.product.itemCode, () => {});
      grouped[line.product.itemCode]![line.unit] =
          (grouped[line.product.itemCode]![line.unit] ?? 0) + line.quantity;
    }

    for (final line in state.selectedLines) {
      // ── Check main line UOM stock ─────────────────────────────
      final uomModel = line.product.uoms.firstWhere(
        (u) => u.uom == line.unit,
        orElse: () => line.product.uoms.first,
      );
      final totalStock = uomModel.availableStock;

      // ✅ Block if UOM has 0 stock at all
      if (totalStock == 0 && !line.isAllFree) {
        return '${line.product.productName} (${line.unit}) — ${'has_no_stock'.tr()}';
      }

      // ✅ Block if combined qty across duplicate lines exceeds stock
      final totalSelected = grouped[line.product.itemCode]?[line.unit] ?? 0;
      if (totalSelected > totalStock && !line.isAllFree) {
        return '${line.product.productName} (${line.unit}): '
            '${'selected'.tr()} $totalSelected / '
            '${'available'.tr()} $totalStock';
      }

      // ── Check FOC UOM stock ───────────────────────────────────
      if (line.isFocEnabled && line.focQuantity > 0) {
        final focUom = line.focUom ?? line.unit;
        final focUomModel = line.product.uoms.firstWhere(
          (u) => u.uom == focUom,
          orElse: () => line.product.uoms.first,
        );

        if (focUomModel.availableStock == 0) {
          return '${line.product.productName} FOC ($focUom) — ${'has_no_stock'.tr()}';
        }
      }
    }

    return null; // ✅ All valid
  }
}
