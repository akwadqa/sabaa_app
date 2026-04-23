import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/features/order/presentation/controller/order_controller.dart';
import 'package:sabaa/features/order/presentation/widgets/order_summary_filter_chip.dart';
import 'package:sabaa/features/order/presentation/widgets/order_summary_filters_list.dart';
import 'package:sabaa/features/order/presentation/widgets/order_summary_invoice_card.dart';
import 'package:sabaa/features/order/presentation/widgets/order_summary_stat_card.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/shared_widgets/custom_app_bar.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({super.key, required this.customerId});
  final String customerId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomDeafultAppbar(title: 'order_summary'.tr()),
      body: _OrderSummaryPageContent(customerId: customerId),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}

class _OrderSummaryPageContent extends ConsumerStatefulWidget {
  const _OrderSummaryPageContent({super.key, required this.customerId});
  final String customerId;

  @override
  ConsumerState<_OrderSummaryPageContent> createState() =>
      _OrderSummaryPageContentState();
}

class _OrderSummaryPageContentState
    extends ConsumerState<_OrderSummaryPageContent> {
  @override
  void initState() {
    super.initState();
    Future(() => ref
        .read(orderControllerProvider.notifier)
        .getOrderSummary(widget.customerId));
  }

  @override
  Widget build(BuildContext context) {
    final selectedFilter = ref.watch(
        orderControllerProvider.select((val) => val.value!.ordersTypeFilter));

    final controller = ref.watch(
            orderControllerProvider.select((val) => val.value!.orderSummary)) ??
        AsyncLoading();

    return controller.when(
      data: (orderSummary) => _buildBody(selectedFilter, orderSummary),
      loading: () => const AppLoader(),
      error: (e, st) => Center(child: Text('error_loading_data'.tr())),
    );

    // return _buildBody(selectedFilter);
  }

  Widget _buildBody(String selectedFilter, OrderSummaryModel orderSummary) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Shop Subtitle
          Text(
            'Al Dibaj Supermarket',
            style:
                AppTextStyle.rubikRegular12.copyWith(color: AppColors.blueGrey),
          ),
          const SizedBox(height: 24),

          // Stat Cards
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OrderSummaryStatCard(
                label: 'total_sales',
                value: orderSummary.totalSales.toString(),
                color: AppColors.successGreen,
                iconPath: Icons.trending_up,
              ),
              OrderSummaryStatCard(
                label: 'out_balance',
                value: orderSummary.outstandingBalance.toString(),
                color: AppColors.errorRed,
                iconPath: Icons.account_balance_wallet,
              ),
              OrderSummaryStatCard(
                label: 'return_sales',
                value: orderSummary.totalReturnSales.toString(),
                color: AppColors.warnYellow,
                iconPath: Icons.assignment_return,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Filters
          OrderSummaryFiltersList(
            selectedFilter: selectedFilter,
          ),
          const SizedBox(height: 24),

          // Recent Invoices Header
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'recent_invoices'.tr(),
              style: AppTextStyle.rubikBold18.copyWith(color: AppColors.black),
            ),
          ),
          const SizedBox(height: 18),

          ...List.from(orderSummary.invoices.map((invoice) {
            return Column(
              children: [
                OrderSummaryInvoiceCard(
                  date: invoice.postingDate,
                  id: invoice.invoiceId,
                  amount: invoice.grandTotal.toString(),
                  status: invoice.status,
                  actions:
                      invoice.status == 'paid' ? ['return'] : ['return', 'pay'],
                ),
                if (orderSummary.invoices.last != invoice)
                  const SizedBox(height: 18),
              ],
            );
          }).toList()),

          // Invoices List
          // const OrderSummaryInvoiceCard(
          //   id: 'SIV\\37446\\2025',
          //   amount: '400 QAR',
          //   status: 'paid',
          //   actions: ['return', 'pay'],
          // ),
          // const SizedBox(height: 18),
          // const OrderSummaryInvoiceCard(
          //   id: 'SIV\\99821\\2024',
          //   amount: '400 QAR',
          //   status: 'return',
          // ),
          // const SizedBox(height: 18),
          // const OrderSummaryInvoiceCard(
          //   id: 'SIV\\37446\\2025',
          //   amount: '400 QAR',
          //   status: 'partly_paid',
          //   actions: ['return', 'pay'],
          // ),
          // const SizedBox(height: 18),
          // const OrderSummaryInvoiceCard(
          //   id: 'SIV\\37446\\2025',
          //   amount: '400 QAR',
          //   status: 'paid',
          //   actions: ['return'],
          // ),
          // const SizedBox(height: 18),
          // const OrderSummaryInvoiceCard(
          //   id: 'SIV\\37446\\2025',
          //   amount: '400 QAR',
          //   status: 'unpaid',
          //   actions: ['return', 'pay'],
          // ),
          // const SizedBox(height: 18),
          // const OrderSummaryInvoiceCard(
          //   id: 'SIV\\37446\\2025',
          //   amount: '400 QAR',
          //   status: 'return',
          // ),
        ],
      ),
    );
  }
}
