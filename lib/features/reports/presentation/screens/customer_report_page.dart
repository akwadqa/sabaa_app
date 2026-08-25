// features/reports/presentation/pages/customer_report_page.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/customers/domain/model/customer_model.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/features/order/presentation/controller/order_controller.dart';
import 'package:sabaa/features/order/presentation/pages/unified_invoice_review_page.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/invoice_pdf_actions_service.dart';
import 'package:sabaa/features/order/presentation/widgets/order_widgets/order_summary_filters_list.dart';
import 'package:sabaa/features/order/presentation/widgets/order_widgets/order_summary_invoice_card.dart';
import 'package:sabaa/features/order/presentation/widgets/order_widgets/order_summary_stat_card.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/app_empty_data_widget.dart';
import 'package:sabaa/src/core/shared_widgets/app_error_widget.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/shared_widgets/app_pagination_widget.dart';
import 'package:sabaa/src/core/shared_widgets/custom_app_bar.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

import '../../../customers/domain/model/create_customer_response/create_customer_response.dart';
import '../widgets/select_period_dialog.dart';

class CustomerReportPage extends ConsumerStatefulWidget {
  const CustomerReportPage({
    super.key,
    required this.customer,
    required this.fromDate,
    required this.toDate,
  });

  final CustomerModel customer;
  final DateTime fromDate;
  final DateTime toDate;

  @override
  ConsumerState<CustomerReportPage> createState() => _CustomerReportPageState();
}

class _CustomerReportPageState extends ConsumerState<CustomerReportPage> {
  bool _isPrinting = false;
  bool _isSharing = false;
  late final InvoicePdfActionsService _pdfActions;
  late DateTime _fromDate;
  late DateTime _toDate;
  String get _from => DateFormat('yyyy-MM-dd').format(widget.fromDate);
  String get _to => DateFormat('yyyy-MM-dd').format(widget.toDate);

  @override
  void initState() {
    super.initState();

    _pdfActions = InvoicePdfActionsService(
      ref: ref,
      context: () => context,
      isMounted: () => mounted,
      onLoadingChange: (_) {},
    );

   Future(() {
      _fetchReportData();
    });
  }

  Future<void> _printAll(List<InvoiceModel> invoices) async {
    if (_isPrinting || invoices.isEmpty) return;
    setState(() => _isPrinting = true);

    try {
      // Print first invoice as sample, or loop all if needed
      await _pdfActions.printFromHtmlById(
        documentId: invoices.first.invoiceId,
        docType: InvoiceDocType.salesInvoice,
        fromDate: _from,
        toDate: _to,
      );
    } finally {
      if (mounted) setState(() => _isPrinting = false);
    }
  }
    void _fetchReportData() {
    ref.read(orderControllerProvider.notifier).setSummaryAction('invoice');
    ref.read(orderControllerProvider.notifier).getOrderSummary(
          customerId: widget.customer.customerId!,
          page: 1,
          fromDate: _from,
          toDate: _to,
        );
  }
 Future<void> _reFilterPeriod() async {
    final period = await showDialog<({DateTime from, DateTime to})>(
      context: context,
      barrierDismissible: true,
      builder: (_) => const SelectPeriodDialog(),
    );

    if (period == null || !mounted) return;

    setState(() {
      _fromDate = period.from;
      _toDate = period.to;
    });

    _fetchReportData();
  }
  Future<void> _shareAll(List<InvoiceModel> invoices) async {
    if (_isSharing || invoices.isEmpty) return;
    setState(() => _isSharing = true);

    try {
      await _pdfActions.shareFromHtmlById(
        documentId: invoices.first.invoiceId,
        docType: InvoiceDocType.salesInvoice,
        fromDate: _from,
        toDate: _to,
      );
    } finally {
      if (mounted) setState(() => _isSharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedFilter = ref.watch(
      orderControllerProvider.select((v) => v.value!.ordersTypeFilter),
    );

    final asyncSummary = ref.watch(
          orderControllerProvider.select((v) => v.value!.orderSummary),
        ) ??
        const AsyncLoading();

    final isFilterLoading = ref.watch(
      orderControllerProvider.select((v) => v.value!.filterLoading),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomDeafultAppbar(
        title: 'reports'.tr(),
         actionButton: GestureDetector(
          onTap: _reFilterPeriod,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.navBorder),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.darkShadow,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: const Icon(
              Icons.tune_rounded,
              color: AppColors.primary,
              size: 20,
            ),
          ),
        ),
      ),
      body: asyncSummary.when(
        loading: () => const AppLoader(),
        error: (_, __) => AppErrorWidget(),
        data: (summary) => Column(
          children: [
            Expanded(
              child: AppPaginationWidget(
                enablePullDown: true,
                onRefresh: () =>
                    ref.read(orderControllerProvider.notifier).refresh(
                          customerId: widget.customer.customerId,
                        ),
                onLoading: (_) {
                  if (summary.invoices.isEmpty) return Future.value(false);
                  return ref
                      .read(orderControllerProvider.notifier)
                      .loadNextPage(widget.customer.customerId!);
                },
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        widget.customer.name ?? '',
                        style: AppTextStyle.rubikRegular12
                            .copyWith(color: AppColors.blueGrey),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${DateFormat('dd/MM/yyyy').format(widget.fromDate)}'
                        ' - '
                        '${DateFormat('dd/MM/yyyy').format(widget.toDate)}',
                        style: AppTextStyle.interRegular12
                            .copyWith(color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 24),

                      // Stats
                      Row(
                        children: [
                          OrderSummaryStatCard(
                            label: 'total_sales',
                            value: summary.totalSales.formatNumbers(),
                            color: AppColors.successGreen,
                            iconPath: Icons.trending_up,
                          ),
                          const SizedBox(width: 12),
                          OrderSummaryStatCard(
                            label: 'out_balance',
                            value: summary.outstandingBalance.toCurrency(),
                            color: AppColors.errorRed,
                            iconPath: Icons.account_balance_wallet,
                          ),
                          const SizedBox(width: 12),
                          OrderSummaryStatCard(
                            label: 'return_sales',
                            value: summary.totalReturnSales.toString(),
                            color: AppColors.warnYellow,
                            iconPath: Icons.signal_cellular_alt,
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      OrderSummaryFiltersList(
                        selectedFilter: selectedFilter,
                        customerId: widget.customer.customerId!,
                      ),

                      const SizedBox(height: 20),

                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'recent_invoices'.tr(),
                          style: AppTextStyle.rubikBold18
                              .copyWith(color: AppColors.black),
                        ),
                      ),
                      const SizedBox(height: 16),

                      if (isFilterLoading)
                        const LinearProgressIndicator(
                          color: AppColors.primary,
                          backgroundColor: AppColors.white,
                        ),

                      if (summary.invoices.isEmpty) const AppEmptyDataWidget(),

                      // ✅ Cards WITHOUT pay / return
                      ...summary.invoices.map((invoice) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: GestureDetector(
                            onTap: () {
                              context.push(
                                AppRoutes.invoiceReviewScreen,
                                extra: {
                                  'mode': InvoiceReviewMode.viewOnly,
                                  'invoiceId': invoice.invoiceId,
                                  'type': 'invoice',
                                },
                              );
                            },
                            child: OrderSummaryInvoiceCard(
                              invoice: invoice,
                              customer: widget.customer,
                              outstandingBalance: summary.outstandingBalance,
                              selectedActionIsOrder: false,
                              actions: const [], // ✅ no pay / return
                            ),
                          ),
                        );
                      }),

                      const SizedBox(height: 90), // space for bottom bar
                    ],
                  ),
                ),
              ),
            ),

            // ── Print + Share bottom bar ─────────────────────
            _ReportActionsBar(
              isPrinting: _isPrinting,
              isSharing: _isSharing,
              onPrint: () => _printAll(summary.invoices),
              onShare: () => _shareAll(summary.invoices),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReportActionsBar extends StatelessWidget {
  const _ReportActionsBar({
    required this.isPrinting,
    required this.isSharing,
    required this.onPrint,
    required this.onShare,
  });

  final bool isPrinting;
  final bool isSharing;
  final VoidCallback onPrint;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    final busy = isPrinting || isSharing;

    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
        decoration: const BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 12,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Print (outlined)
            Expanded(
              child: SizedBox(
                height: 50,
                child: OutlinedButton(
                  onPressed: busy ? null : onPrint,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: AppColors.primary,
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: isPrinting
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primary,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.print_outlined,
                                color: AppColors.primary, size: 22),
                            const SizedBox(width: 8),
                            Text(
                              'print'.tr(),
                              style: AppTextStyle.interSemiBold16
                                  .copyWith(color: AppColors.primary),
                            ),
                          ],
                        ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Share (filled)
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: busy ? null : onShare,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: isSharing
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.share_outlined,
                                color: Colors.white, size: 22),
                            const SizedBox(width: 8),
                            Text(
                              'share'.tr(),
                              style: AppTextStyle.interSemiBold16
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
