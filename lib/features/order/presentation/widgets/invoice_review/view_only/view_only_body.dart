import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/new_order/presentation/widgets/invoice_widgets/invoice_review_card.dart';
import 'package:sabaa/features/order/presentation/controller/invoice_details_controller.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/view_only/invoice_info_header.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/core/utils/functions/helper_methods.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class ViewOnlyBody extends ConsumerWidget {
  const ViewOnlyBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(invoiceDetailsControllerProvider);

    return asyncState.when(
      loading: () => const Center(child: AppLoader()),
      error: (e, _) => _ErrorView(),
      data: (state) {
        final items = state.items
            .map((e) => InvoiceItemUI(
                  name: e.itemName,
                  count: e.qty,
                        uom: e.uom, // ✅ unit from SelectedItem
              pricePerItem: e.amount.toStringAsFixed(2),
                  total: formatPrice(e.amount.toDouble()),
                ))
            .toList();

        return SingleChildScrollView(
          child: Column(
            children: [
              20.verticalSpace,
              InvoiceInfoHeader(
                invoiceId: state.invoiceId,
                customerName: state.customerName,
                date: state.postingDate,
                status: state.status,
              ).symmetricPadding(horizontal: 12),
              const SizedBox(height: 12),
              InvoiceReviewCard(
                items: items,
                subtotal: formatPrice(state.subtotal),
                deliveyFee: formatPrice(state.deliveryFee),
                total: formatPrice(state.total),
              ).symmetricPadding(horizontal: 12, vertical: 16),
            ],
          ),
        );
      },
    );
  }
}

class _ErrorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: AppColors.errorRed, size: 48),
          const SizedBox(height: 12),
          Text(
            'failed_to_load_invoice'.tr(),
            style: AppTextStyle.interRegular14
                .copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}