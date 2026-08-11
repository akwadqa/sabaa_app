import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:sabaa/features/customers/presentation/widgets/add_customer_page/custom_labeled_text_filed.dart';
import 'package:sabaa/features/new_order/domain/model/order_item.dart';
import 'package:sabaa/features/new_order/presentation/controller/new_order_controller.dart';
import 'package:sabaa/features/new_order/presentation/widgets/invoice_widgets/discount_card.dart';
import 'package:sabaa/features/new_order/presentation/widgets/invoice_widgets/invoice_review_card.dart';
import 'package:sabaa/features/new_order/presentation/widgets/invoice_widgets/remark_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/core/utils/functions/helper_methods.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class NewOrderBody extends ConsumerStatefulWidget {
  const NewOrderBody({super.key});

  @override
  ConsumerState<NewOrderBody> createState() => _NewOrderBodyState();
}

class _NewOrderBodyState extends ConsumerState<NewOrderBody> {
  final FocusNode _deliveryFeeFocusNode = FocusNode();

  @override
  void dispose() {
    _deliveryFeeFocusNode.dispose();
    super.dispose();
  }

  KeyboardActionsConfig _iosKeyboardConfig() {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      nextFocus: false,
      actions: [
        KeyboardActionsItem(
          focusNode: _deliveryFeeFocusNode,
          displayDoneButton: true,
          toolbarButtons: [
            (node) => GestureDetector(
                  onTap: () => node.unfocus(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'done'.tr(),
                      style: AppTextStyle.interSemiBold14
                          .copyWith(color: AppColors.primary),
                    ),
                  ),
                ),
          ],
        ),
      ],
    );
  }

  double _effectivePrice(SelectedItem e) {
    if (e.customRate != null) return e.customRate!;
    if (e.product.uoms.isEmpty) return e.product.price;

    return e.product.uoms
        .firstWhere(
          (u) => u.uom == e.unit,
          orElse: () => e.product.uoms.first,
        )
        .price;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(newOrderControllerProvider).value!;
    final controller = ref.read(newOrderControllerProvider.notifier);
    final selectedProducts = state.selectedItems.values.toList();
    final isReturn = state.isReturn;
    final selectedLines = state.selectedLines;
// ── Group lines by itemCode to keep them together ──────────────
    final grouped = <String, List<SelectedItemLine>>{};
    final orderOfProducts = <String>[]; // preserve original order

    for (final line in selectedLines) {
      final code = line.product.itemCode;
      if (!grouped.containsKey(code)) {
        orderOfProducts.add(code);
        grouped[code] = [];
      }
      grouped[code]!.add(line);
    }
    final allInvoiceItems = <InvoiceItemUI>[];
    double subtotalValue = 0;

    for (final itemCode in orderOfProducts) {
      final lines = grouped[itemCode]!;

      for (final line in lines) {
        final uomModel = line.product.uoms.firstWhere(
          (u) => u.uom == line.unit,
          orElse: () => line.product.uoms.first,
        );
        final price = line.customRate ?? uomModel.price;
        final paidQty = line.isAllFree ? 0 : line.quantity;

        allInvoiceItems.add(InvoiceItemUI(
          name: line.product.productName,
          count: line.quantity,
          paidCount: paidQty,
          uom: line.unit,
          pricePerItem: price.toStringAsFixed(2),
          total: (price * paidQty).toCurrency(),
          focQuantity: line.isFocEnabled ? line.focQuantity : 0,
          focUom: line.isFocEnabled ? line.focUom : null,
          isAllFree: line.isAllFree,
          freeQuantity: line.isAllFree ? line.quantity : 0,
        ));

        if (!line.isAllFree) {
          subtotalValue += price * line.quantity;
        }
      }
    }

    // for (final e in selectedProducts) {
    //   final price = _effectivePrice(e);

    //   // ── Main line ────────────────────────────────────────────
    //   allInvoiceItems.add(InvoiceItemUI(
    //     name: e.product.productName,
    //     count: e.quantity,
    //     paidCount: e.isAllFree ? 0 : e.quantity,
    //     uom: e.unit,
    //     pricePerItem: price.toCurrency(),
    //     total: e.isAllFree ? '0.00' : (price * e.quantity).toCurrency(),
    //     focQuantity: e.isFocEnabled ? e.focQuantity : 0,
    //     focUom: e.isFocEnabled ? e.focUom : null,
    //     isAllFree: e.isAllFree,
    //     freeQuantity: e.isAllFree ? e.quantity : e.freeQuantity,
    //   ));

    //   // ── Extra UOM lines ──────────────────────────────────────
    //   for (final line in e.extraUomLines) {
    //     final lineUomPrice = e.product.uoms
    //         .firstWhere(
    //           (u) => u.uom == line.uom,
    //           orElse: () => e.product.uoms.first,
    //         )
    //         .price;

    //     allInvoiceItems.add(InvoiceItemUI(
    //       name: e.product.productName, // same name
    //       count: line.quantity,
    //       paidCount: line.quantity,
    //       uom: line.uom, // different UOM
    //       pricePerItem: lineUomPrice.toCurrency(),
    //       total: (lineUomPrice * line.quantity).toCurrency(),
    //       focQuantity: 0,
    //       isAllFree: false,
    //       freeQuantity: 0,
    //     ));
    //   }
    // }

// Use allInvoiceItems instead of items in InvoiceReviewCard

// ── Subtotal includes extra lines ────────────────────────────
    //  subtotalValue = selectedProducts.fold<double>(0, (sum, e) {
    //   if (e.isAllFree) return sum;
    //   final mainTotal = _effectivePrice(e) * e.quantity;
    //   final extraTotal = e.extraUomLines.fold<double>(0, (s, line) {
    //     final linePrice = e.product.uoms
    //         .firstWhere(
    //           (u) => u.uom == line.uom,
    //           orElse: () => e.product.uoms.first,
    //         )
    //         .price;
    //     return s + (linePrice * line.quantity);
    //   });
    //   return sum + mainTotal + extraTotal;
    // });

    final deliveryFee = double.tryParse(state.deliveryFee ?? '') ?? 0.0;
    final discountAmount = controller.calculateDiscountAmount(subtotalValue);
    final totalValue = (subtotalValue + deliveryFee - discountAmount)
        .clamp(0, double.infinity);

    return KeyboardActions(
      config: _iosKeyboardConfig(),
      child: SingleChildScrollView(
        child: Column(
          spacing: 12,
          children: [
            20.verticalSpace,
            if (!isReturn) ...[
              CustomLabeledTextField(
                focusNode: _deliveryFeeFocusNode,
                label: 'delivery_fee',
                keyboardType: const TextInputType.numberWithOptions(),
                hint: 'enter_delivery_fee',
                onChanged: controller.editDeliveryFee,
              ).symmetricPadding(horizontal: 12),
              if (totalValue != 0)
                DiscountCard(
                  currentType: state.discountType,
                  currentValue: state.discountValue,
                  onApply: (type, value) {
                    controller.setDiscount(type, value);
                  },
                  onRemove: () {
                    controller.removeDiscount();
                  },
                ).symmetricPadding(horizontal: 12),
            ],
            InvoiceReviewCard(
              items: allInvoiceItems,
              subtotal: formatPrice(subtotalValue),
              deliveyFee: state.deliveryFee ?? '0',
              total: formatPrice(totalValue.toDouble()),
              discountType: state.discountType,
              discountValue: state.discountValue,
              discountAmount: formatPrice(discountAmount),
              isReturn: state.isReturn,
            ).symmetricPadding(horizontal: 12, vertical: 16),
             RemarkWidget(isReturn: state.isReturn,).symmetricPadding(horizontal: 12),
          ],
        ),
      ),
    );
  }
}
