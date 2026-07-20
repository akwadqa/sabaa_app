import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/new_order/presentation/widgets/invoice_widgets/invoice_review_card.dart';
import 'package:sabaa/features/return_invoice/presentation/controller/return_order_controller.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/core/utils/functions/helper_methods.dart';

class ReturnOrderBody extends ConsumerWidget {
  const ReturnOrderBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(returnOrderControllerProvider);

    return state.when(
      loading: () => const Center(child: AppLoader()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (returnState) {
        final selectedProducts = returnState.selectedItems.values.toList();

        final items = selectedProducts
            .map((e) => InvoiceItemUI(
                  name: e.product.itemName,
                  count: e.quantity,
                        uom: e.unit, // ✅ unit from SelectedItem
              pricePerItem: e.product.amount.toCurrency(),
                  total: formatPrice((e.product.amount * e.quantity).toDouble()),
                ))
            .toList();

        final subtotal = selectedProducts.fold<double>(
          0,
          (sum, e) => sum + (e.product.amount * e.quantity),
        );

        return SingleChildScrollView(
          child: Column(
            children: [
              20.verticalSpace,
              InvoiceReviewCard(
                items: items,
                subtotal: formatPrice(subtotal),
                deliveyFee: '0',
                total: formatPrice(subtotal),
              ).symmetricPadding(horizontal: 12, vertical: 16),
            ],
          ),
        );
      },
    );
  }
}