import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/customers/domain/model/create_customer_response/create_customer_response.dart';
import 'package:sabaa/features/customers/domain/model/customer_model.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/features/order/presentation/controller/order_controller.dart';
import 'package:sabaa/features/order/presentation/pages/unified_invoice_review_page.dart';
import 'package:sabaa/features/order/presentation/widgets/order_widgets/invoice_payment_bottom_sheet.dart';
import 'package:sabaa/features/order/presentation/widgets/order_widgets/order_summary_filter_chip.dart';
import 'package:sabaa/features/order/presentation/widgets/order_widgets/order_summary_filters_list.dart';
import 'package:sabaa/features/order/presentation/widgets/order_widgets/order_summary_invoice_card.dart';
import 'package:sabaa/features/order/presentation/widgets/order_widgets/order_summary_stat_card.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/app_empty_data_widget.dart';
import 'package:sabaa/src/core/shared_widgets/app_error_widget.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/shared_widgets/app_pagination_widget.dart';
import 'package:sabaa/src/core/shared_widgets/custom_app_bar.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/functions/check_role.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class OrderSummaryPage extends ConsumerStatefulWidget {
  const OrderSummaryPage({
    super.key,
    required this.customer,
    this.invoice,
    this.openPayment = false,
    required this.visitId,
  });

  final CustomerModel customer;
  final InvoiceModel? invoice;
  final bool openPayment;
  final String? visitId;

  @override
  ConsumerState<OrderSummaryPage> createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends ConsumerState<OrderSummaryPage> {
  bool _opened = false;

  @override
  void initState() {
    super.initState();

    /// 🔥 open payment AFTER build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.openPayment && widget.invoice != null && !_opened) {
        _opened = true;

        _openPaymentSheet(widget.invoice!);
      }
    });
  }

  void _openPaymentSheet(InvoiceModel invoice) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return InvoicePaymentBottomSheet(
          invoice: invoice,
          outstandingBalance: invoice.outstandingAmount,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: CustomDeafultAppbar(
          title: 'order_summary'.tr(),
          actionButton: checkRole(ref,
              salesMan: widget.visitId != null
                  ? GestureDetector(
                      onTap: () {
                        context.push(AppRoutes.displayCaptureScreen,
                            extra: widget.visitId);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 8),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.navBorder),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.darkShadow,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Assets.icons.cameraIc.svg(),
                      ),
                    )
                  : null,
              vanSales: null,
              defaultWidget: null),
        ),
        body: _OrderSummaryPageContent(customer: widget.customer),
        floatingActionButton: checkRole(
          ref,
          delivery: SizedBox(),
          defaultWidget: FloatingActionButton(
            onPressed: () {
              context.push(AppRoutes.newOrderScreen, extra: widget.customer);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            backgroundColor: AppColors.primary,
            child: const Icon(Icons.add, color: AppColors.white),
          ),
        ));
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
        .getOrderSummary(customerId: widget.customer.customerId!, page: 1));
  }

  @override
  Widget build(BuildContext context) {
    final selectedFilter = ref.watch(
        orderControllerProvider.select((val) => val.value!.ordersTypeFilter));

    final controller = ref.watch(
            orderControllerProvider.select((val) => val.value!.orderSummary)) ??
        AsyncLoading();

    return controller.when(
      data: (orderSummary) =>
          _buildBody(selectedFilter, orderSummary, widget.customer),
      loading: () => const AppLoader(),
      error: (e, st) => AppErrorWidget(),
    );

    // return _buildBody(selectedFilter);
  }

  Widget _buildBody(String selectedFilter, OrderSummaryModel orderSummary,
      CustomerModel customer) {
    final isLoading = ref.watch(
        orderControllerProvider.select((val) => val.value!.filterLoading));

    return AppPaginationWidget(
      key: ValueKey<String>(selectedFilter),
      onLoading: (page) {
        if (orderSummary.invoices.isEmpty) {
          return Future.value(false);
        }
        return ref
            .read(orderControllerProvider.notifier)
            .loadNextPage(customer.customerId!);
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Shop Subtitle
            Text(
              customer.name ?? "",
              style: AppTextStyle.rubikRegular12
                  .copyWith(color: AppColors.blueGrey),
            ),
            const SizedBox(height: 30),

            // Stat Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 20,
              children: [
                OrderSummaryStatCard(
                  label:checkRole(ref, defaultWidget: 'total_sales',delivery: "payment_collected") ,
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
              customerId: widget.customer.customerId!,
            ),
            const SizedBox(height: 24),

            // Recent Invoices Header
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'recent_invoices'.tr(),
                style:
                    AppTextStyle.rubikBold18.copyWith(color: AppColors.black),
              ),
            ),
            const SizedBox(height: 18),
            if (isLoading)
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: LinearProgressIndicator(
                  color: AppColors.primary,
                  backgroundColor: AppColors.white,
                ),
              ),
            if (orderSummary.invoices.isEmpty) AppEmptyDataWidget(),

            ...List.from(orderSummary.invoices.map((invoice) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.push(
                        AppRoutes.invoiceReviewScreen,
                        extra: {
                          'mode': InvoiceReviewMode.viewOnly,
                          'invoiceId': invoice.invoiceId,
                        },
                      );
// HERE
                      // context.push(AppRoutes.returnInvoiceReviewScreen,extra: {"isReturn":false});
                    },
                    child: OrderSummaryInvoiceCard(
                      invoice: invoice,
                      customer: customer,
                      // date: invoice.postingDate,
                      // id: invoice.invoiceId,
                      outstandingBalance: orderSummary.outstandingBalance,
                      // status: invoice.status,
                      actions: invoice.status == 'Paid'
                          ? ['return']
                          : ['return', 'pay'],
                    ),
                  ),
                  if (orderSummary.invoices.last != invoice)
                    const SizedBox(height: 18),
                ],
              );
            }).toList()),
          ],
        ),
      ),
    );
  }
}
