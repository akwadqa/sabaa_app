import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/customers/domain/model/create_customer_response/create_customer_response.dart';
import 'package:sabaa/features/customers/domain/model/customer_model.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/features/order/presentation/controller/order_controller.dart';
import 'package:sabaa/features/order/presentation/widgets/order_summary_filter_chip.dart';
import 'package:sabaa/features/order/presentation/widgets/order_summary_filters_list.dart';
import 'package:sabaa/features/order/presentation/widgets/order_summary_invoice_card.dart';
import 'package:sabaa/features/order/presentation/widgets/order_summary_stat_card.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/app_error_widget.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/shared_widgets/custom_app_bar.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({super.key, required this.customer});
  final CustomerModel customer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomDeafultAppbar(title: 'order_summary'.tr()),
      body: _OrderSummaryPageContent(customer:customer),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            context.push(AppRoutes.newOrderScreen,extra: customer);

        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}

class _OrderSummaryPageContent extends ConsumerStatefulWidget {
  const _OrderSummaryPageContent({super.key, required this.customer});
  final CustomerModel customer;

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
        .getOrderSummary(widget.customer.customerId!));
  }

  @override
  Widget build(BuildContext context) {
    final selectedFilter = ref.watch(
        orderControllerProvider.select((val) => val.value!.ordersTypeFilter));

    final controller = ref.watch(
            orderControllerProvider.select((val) => val.value!.orderSummary)) ??
        AsyncLoading();

    return controller.when(
      data: (orderSummary) => _buildBody(selectedFilter, orderSummary,widget.customer),
      loading: () => const AppLoader(),
      error: (e, st) => AppErrorWidget(),
    );

    // return _buildBody(selectedFilter);
  }

  Widget _buildBody(String selectedFilter, OrderSummaryModel orderSummary, CustomerModel customer) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Shop Subtitle
          Text(
           customer.name??"" ,
            style:
                AppTextStyle.rubikRegular12.copyWith(color: AppColors.blueGrey),
          ),
          const SizedBox(height: 30),

          // Stat Cards
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 20,
            children: [
              OrderSummaryStatCard(
                label: 'total_sales',
                value: orderSummary.totalSales.formatNumbers(),
                color: AppColors.successGreen,
                iconPath: Icons.trending_up,
              ),
              OrderSummaryStatCard(
                label: 'out_balance',
                value: orderSummary.outstandingBalance.toCurrency(),
                color: AppColors.errorRed,
                iconPath: Icons.account_balance_wallet,
              ),
              OrderSummaryStatCard(
                label: 'return_sales',
                value: orderSummary.totalReturnSales.toString(),
                color: AppColors.warnYellow,
                iconPath: Icons.signal_cellular_alt,
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
                  invoice:invoice,
                  customer: customer,
                  // date: invoice.postingDate,
                  // id: invoice.invoiceId,
                  outstandingBalance: orderSummary.outstandingBalance,
                  // status: invoice.status,
                  actions:
                      invoice.status == 'Paid' ? ['return'] : ['return', 'pay'],
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
