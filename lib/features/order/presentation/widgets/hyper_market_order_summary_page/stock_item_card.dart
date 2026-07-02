import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/order/domain/hyper_market_order_summary/hyper_market_order_summary_model.dart';
import 'package:sabaa/features/order/presentation/controller/hyper_market_order_controller.dart';
import 'package:sabaa/features/order/presentation/widgets/hyper_market_order_summary_page/update_stock_dialog.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class StockItemCardHyperMarket extends ConsumerWidget {
  const StockItemCardHyperMarket({
    super.key,
    required this.stockItem,
    required this.visitId,
  });
  final HyperMarketStockItemModel stockItem;
  final String? visitId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        if (visitId != null) {
          ref.read(hyperMarketOrderControllerProvider.notifier)
            ..resetInputFields()
            ..addNewStockInput(stockItem.itemCode);
          showDialog(
            context: context,
            builder: (context) => UpdateStockDialog(
              stockItem: stockItem,
              visitId: visitId!,
            ),
          );
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(13),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
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
          textDirection: TextDirection.ltr,
          children: [
            // صورة المنتج الخلفية الافتراضية F3F4F6 رمادي
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: const Color(0xffF3F4F6),
                borderRadius: BorderRadius.circular(8),
                // يمكنك تفعيل الصور الحقيقية هنا لاحقاً عبر تفعيل السطر بالأسفل
                image: stockItem.itemImage == null
                    ? null
                    : DecorationImage(
                        image: CachedNetworkImageProvider(stockItem.itemImage!),
                        fit: BoxFit.cover),
              ),
              child: stockItem.itemImage == null
                  ? const Icon(Icons.fastfood, color: Color(0xff64748B))
                  : null,
            ),
            const SizedBox(width: 12),
            // تفاصيل المنتج
            Expanded(
              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    stockItem.itemName,
                    textDirection: TextDirection.ltr,
                    style: AppTextStyle.rubikSemiBold14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text('SKU: ${stockItem.itemCode}',
                      style: AppTextStyle.rubikRegular12
                          .copyWith(color: AppColors.textSecondary)),
                  const SizedBox(height: 4),

                  Text.rich(
                    TextSpan(
                      text: 'Stock: ',
                      style: AppTextStyle.rubikMedium12
                          .copyWith(color: AppColors.textSecondary),
                      children: [
                        TextSpan(
                          text: stockItem.totalQty,
                          style: AppTextStyle.rubikBold12
                              .copyWith(color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                  // Text(
                  //   'Stock: $stock',
                  //   style: const TextStyle(
                  //     fontFamily: 'Inter',
                  //     fontSize: 12,
                  //     fontWeight: FontWeight.w500,
                  //     color: Color(0xff64748B),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
