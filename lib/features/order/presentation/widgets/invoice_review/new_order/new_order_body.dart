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

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(newOrderControllerProvider).value!;
    final controller = ref.read(newOrderControllerProvider.notifier);
    final isReturn = state.isReturn;
    final selectedLines = state.selectedLines;

// ── Group lines by itemCode to keep them together ──────────────
    final grouped = <String, List<SelectedItemLine>>{};
    final orderOfProducts = <String>[]; // preserve original order

    final tax = controller.calculateTotalTax();
    final subtotal = controller.calculateSubtotal();

    // final discount = controller.calculateDiscountAmount(subtotal);

  final deliveryFee =
      isReturn ? 0.0 : (double.tryParse(state.deliveryFee ?? '') ?? 0.0);

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

        final lineTax = line.isAllFree ? 0.0 : (uomModel.tax * paidQty);

        allInvoiceItems.add(InvoiceItemUI(
          name: line.product.productName,
          count: line.quantity,
          paidCount: paidQty,
          uom: line.unit,
          pricePerItem: price.toCurrency(withSymbol: false) ,
          total: (price * paidQty).toCurrency(withSymbol: false),
          focQuantity: line.isFocEnabled ? line.focQuantity : 0,
          focUom: line.isFocEnabled ? line.focUom : null,
          isAllFree: line.isAllFree,
          freeQuantity: line.isAllFree ? line.quantity : 0,
          itemTax: lineTax.toCurrency(withSymbol: false) , 
        ));

        if (!line.isAllFree) {
          subtotalValue += price * line.quantity;
        }
      }
    }

    final discountAmount = controller.calculateDiscountAmount(subtotalValue);
  final totalValue = isReturn
      ? (subtotalValue + tax).clamp(0, double.infinity) // return: no delivery/discount usually
      : (subtotalValue + tax + deliveryFee - discountAmount)
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
              subtotal: subtotalValue.toCurrency(withSymbol: false) ,
              tax: tax > 0 ? tax.toCurrency(withSymbol: false) : null,
              deliveyFee: deliveryFee > 0 ? formatPrice(deliveryFee) : null,
              total: formatPrice(totalValue.toDouble()),
              discountType: state.hasDiscount ? state.discountType : null,
              discountValue: state.hasDiscount ? state.discountValue : null,
              discountAmount:
                  state.hasDiscount ? formatPrice(discountAmount) : null,
              isReturn: state.isReturn,
            ).symmetricPadding(horizontal: 12, vertical: 16),
            RemarkWidget(
              isReturn: state.isReturn,
            ).symmetricPadding(horizontal: 12),
          ],
        ),
      ),
    );
  }
}
