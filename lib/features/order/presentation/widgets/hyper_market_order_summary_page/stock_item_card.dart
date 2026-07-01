import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class StockItemCardHyperMarket extends StatelessWidget {
  final String title;
  final String sku;
  final String stock;
  final String imageUrl;

  const StockItemCardHyperMarket({
    super.key,
    required this.title,
    required this.sku,
    required this.stock,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          // صورة المنتج الخلفية الافتراضية F3F4F6 رمادي
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: const Color(0xffF3F4F6),
              borderRadius: BorderRadius.circular(8),
              // يمكنك تفعيل الصور الحقيقية هنا لاحقاً عبر تفعيل السطر بالأسفل
              image: DecorationImage(
                  image: CachedNetworkImageProvider(imageUrl),
                  fit: BoxFit.cover),
            ),
            child: imageUrl == null
                ? const Icon(Icons.fastfood, color: Color(0xff64748B))
                : null,
          ),
          const SizedBox(width: 12),
          // تفاصيل المنتج
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyle.rubikSemiBold14,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text('SKU: $sku',
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
                        text: stock,
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
    );
  }
}
