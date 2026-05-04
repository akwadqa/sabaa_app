import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/infrastructure/api/endpoint/services_urls.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

import '../../domain/model/stock_item.dart';
import 'stock_level_badge.dart';

class StockItemCard extends StatelessWidget {
  const StockItemCard({super.key, required this.item});

  final StockItem item;

  Color get _stockValueColor =>
      item.stockLevel == "Low" ? AppColors.red : AppColors.textPrimary;
  Color get _lowStockBorderColor => item.stockLevel == "Low"
      ? AppColors.lightRed
      : AppColors.navBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        // border: Border.all(color: AppColors.navBorder),
        border: Border(
          left: BorderSide(
              color: _lowStockBorderColor,
              width: item.stockLevel == "Low" ? 6 : 1),
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ── Product image ────────────────────────────
          _ProductImage(imageUrl:ServicesUrls.imageUrl+ item.imageUrl),
          12.horizontalSpace,

          // ── Product details ──────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name + badge row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        style: AppTextStyle.interSemiBold14.copyWith(
                          color: AppColors.textPrimary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // StockLevelBadge(level: item.stockLevel),
                  ],
                ),
                4.verticalSpace,

                // SKU
                Text(
                  'SKU: ${item.sku}',
                  style: AppTextStyle.interRegular12.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                8.verticalSpace,

                // Stock qty + price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${'stock'.tr()}: ',
                            style: AppTextStyle.interMedium12.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          TextSpan(
                            text: item.stockLabel,
                            style: AppTextStyle.interSemiBold14.copyWith(
                              fontSize: 12,
                              color: _stockValueColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      item.price.toStringAsFixed(2),
                      style: AppTextStyle.interSemiBold14.copyWith(
                        fontSize: 12,
                        color: AppColors.secondPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => const Icon(
          Icons.image_not_supported_outlined,
          color: AppColors.textSecondary,
          size: 28,
        ),
      ),
    );
  }
}
