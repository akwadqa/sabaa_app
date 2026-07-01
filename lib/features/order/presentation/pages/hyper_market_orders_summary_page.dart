import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/customers/domain/model/create_customer_response/create_customer_response.dart';
import 'package:sabaa/features/order/domain/hyper_market_order_summary/hyper_market_order_summary_model.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/features/order/presentation/controller/hyper_market_order_controller.dart';
import 'package:sabaa/features/order/presentation/widgets/hyper_market_order_summary_page/hyper_market_filter_bottom_sheet.dart';
import 'package:sabaa/features/order/presentation/widgets/hyper_market_order_summary_page/stat_card.dart';
import 'package:sabaa/features/order/presentation/widgets/hyper_market_order_summary_page/stock_item_card.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/app_error_widget.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/shared_widgets/custom_app_bar.dart';
import 'package:sabaa/src/infrastructure/api/endpoint/services_urls.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class HyperMarketOrdersSummaryScreen extends ConsumerStatefulWidget {
  const HyperMarketOrdersSummaryScreen(
      {super.key,
      this.visitId,
      required this.customer,
      this.invoice,
      required this.openPayment});
  final String? visitId;
  final CustomerModel customer;
  final InvoiceModel? invoice;
  final bool openPayment;

  @override
  ConsumerState<HyperMarketOrdersSummaryScreen> createState() =>
      _HyperMarketOrdersSummaryScreenState();
}

class _HyperMarketOrdersSummaryScreenState
    extends ConsumerState<HyperMarketOrdersSummaryScreen> {
  @override
  void initState() {
    Future(() => ref
        .read(hyperMarketOrderControllerProvider.notifier)
        .getHyperMarketOderSummary(widget.customer.name ?? ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(hyperMarketOrderControllerProvider
        .select((val) => val.value!.hyperMarketOrdersSummaryResponse));
    return Scaffold(
        backgroundColor: const Color(0xffF7F9FC),
        // تخصيص الـ AppBar ليطابق تفاصيل هيدر التصميم
        appBar: CustomDeafultAppbar(
          title: 'order_summary'.tr(),
          actionButton: widget.visitId != null
              ? GestureDetector(
                  onTap: () {
                    context.push(AppRoutes.displayCaptureScreen,
                        extra: widget.visitId);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
        ),
        body: controller.when(
          data: (orderSummary) => _buildBody(context, orderSummary),
          loading: () => const AppLoader(),
          error: (e, st) => AppErrorWidget(),
        ));
  }

  SafeArea _buildBody(
      BuildContext context, HyperMarketOrdersSummaryResponse orderSummary) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.customer.name ?? "",
              style: AppTextStyle.rubikRegular12
                  .copyWith(color: AppColors.blueGrey),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                StatCard(
                  title: 'total_sales'.tr(),
                  value: orderSummary.netSales.toString(),
                  icon: Assets.icons.totalSalesIc,
                  valueColor: Color(0xff00721D),
                ),
                SizedBox(width: 16),
                StatCard(
                  title: 'total_stock'.tr(),
                  value: orderSummary.totalStock.toString(),
                  icon: Assets.icons.salesAmountIc,
                  valueColor: Color(0xff7A5800),
                ),
              ],
            ),

            const SizedBox(height: 22),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Stock overview', style: AppTextStyle.rubikBold18),
                // كبسولة الفلتر (Filter Button)
                InkWell(
                  onTap: () async {
                    // استدعاء المودال بوتوم شيت المخصصة

                    await showModalBottomSheet<Map<String, String>>(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: HyperMarketFilterBottomSheet(
                          customerId: widget.customer.name ?? '',
                        ),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xffE2E8F0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.tune_rounded,
                            size: 14, color: Color(0xff005AAB)),
                        SizedBox(width: 4),
                        Text('Filter',
                            style: AppTextStyle.rubikMedium14
                                .copyWith(color: AppColors.primary))
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            // قائمة عرض المنتجات القابلة للتمرير (Scrolling List)
            Expanded(
              child: ListView.builder(
                itemCount: orderSummary.items.length,
                itemBuilder: (context, index) {
                  final product = orderSummary.items[index];
                  return StockItemCardHyperMarket(
                    title: product.itemName,
                    sku: product.itemCode,
                    stock: product.totalQty,
                    imageUrl: ServicesUrls.imageUrl + product.itemImage,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
