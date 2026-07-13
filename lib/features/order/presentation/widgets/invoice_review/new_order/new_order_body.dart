import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:sabaa/features/customers/presentation/widgets/add_customer_page/custom_labeled_text_filed.dart';
import 'package:sabaa/features/new_order/domain/model/order_item.dart';
import 'package:sabaa/features/new_order/presentation/controller/new_order_controller.dart';
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

    final items = selectedProducts
        .map((e) => InvoiceItemUI(
              name: e.product.productName,
              count: e.quantity,
              total: (_effectivePrice(e) * e.quantity).toCurrency(),
            ))
        .toList();

    final subtotalValue = selectedProducts.fold<double>(
      0,
      (sum, e) => sum + (_effectivePrice(e) * e.quantity),
    );

    final deliveryFee = double.tryParse(state.deliveryFee ?? '') ?? 0.0;
    final totalValue = subtotalValue + deliveryFee;

    return KeyboardActions(
      config: _iosKeyboardConfig(),
      child: SingleChildScrollView(
        child: Column(
          spacing: 12,
          children: [
            20.verticalSpace,
            if (!isReturn)
              CustomLabeledTextField(
                focusNode: _deliveryFeeFocusNode,
                label: 'delivery_fee',
                keyboardType: const TextInputType.numberWithOptions(),
                hint: 'enter_delivery_fee',
                onChanged: controller.editDeliveryFee,
              ).symmetricPadding(horizontal: 12),
            InvoiceReviewCard(
              items: items,
              subtotal: formatPrice(subtotalValue),
              deliveyFee: state.deliveryFee ?? '0',
              total: formatPrice(totalValue),
            ).symmetricPadding(horizontal: 12, vertical: 16),
            const RemarkWidget().symmetricPadding(horizontal: 12),
          ],
        ),
      ),
    );
  }
}