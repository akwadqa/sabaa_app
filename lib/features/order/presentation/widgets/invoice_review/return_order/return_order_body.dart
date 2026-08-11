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

        final items = selectedProducts.map((e) {
          final originalPrice = e.product.amount;
          final effectivePrice = e.customRate ?? originalPrice; // ✅
          final hasCustomRate =
              e.customRate != null && e.customRate != originalPrice;

          return InvoiceItemUI(
            name: e.product.itemName,
            count: e.quantity,
            uom: e.unit,
            pricePerItem:
                effectivePrice.toDouble().toStringAsFixed(2), // ✅ new price
            total: formatPrice((effectivePrice * e.quantity).toDouble()),
            // ✅ Pass original only if price was changed → triggers strikethrough
            originalPricePerItem:
                hasCustomRate ? originalPrice.toDouble().toCurrency() : null,
          );
        }).toList();

        // ✅ Subtotal uses effective price
        final subtotal = selectedProducts.fold<double>(
          0,
          (sum, e) {
            final effectivePrice = e.customRate ?? e.product.amount;
            return sum + (effectivePrice * e.quantity);
          },
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
                isReturn: true,
              ).symmetricPadding(horizontal: 12, vertical: 16),
            ],
          ),
        );
      },
    );
  }
}
