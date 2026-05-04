import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/infrastructure/api/endpoint/services_urls.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';

import '../../../van_stock/domain/model/product_model.dart';
import '../../domain/model/return_invoice_model.dart';
import 'return_quantity_stepper.dart';

/// Order Item Card for Return Items
/// - Read-only unit dropdown (cannot be changed)
/// - Quantity limited to available stock
/// - Shows return-specific styling
class OrderItemCardReturn extends StatelessWidget {
  const OrderItemCardReturn({
    super.key,
    required this.item,
    required this.quantity,
    required this.selectedUnit,
    required this.isSelected,
    required this.maxReturnQuantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  final InvoiceItemModel item;
  final int quantity;
  final String selectedUnit;
  final bool isSelected;
  final int maxReturnQuantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: BorderDirectional(
          start: BorderSide(
            color: isSelected ? AppColors.primary : AppColors.borderGrey,
            width: isSelected ? 5 : 1,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.darkShadow,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Top row: image + name/sku/price + delete ───────────────
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProductImage(
                imageUrl:
                    ServicesUrls.imageUrl + (item.itemCode ?? ""),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.itemName,
                      style: AppTextStyle.interSemiBold14.copyWith(
                        color: AppColors.textHeading,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    4.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'SKU: ${item.itemCode}',
                            style: AppTextStyle.interRegular12.copyWith(
                              color: AppColors.blueGrey,
                            ),
                          ),
                        ),
                        // 10.horizontalSpace,
                        Text(
                          item.amount.toCurrency(),
                          style: AppTextStyle.interSemiBold14.copyWith(
                            color: AppColors.accent, // Return color
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              12.horizontalSpace,
              if (isSelected)
                GestureDetector(
                  onTap: onDelete,
                  child: const Icon(
                    Icons.delete_outline_rounded,
                    color: AppColors.red,
                    size: 25,
                  ),
                ),
            ],
          ),
          if (isSelected) ...[
            12.verticalSpace,
            // ── Unit (Read-Only) + Quantity Controls ──────────────────
            Row(
              children: [
                // Read-Only Unit Badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F2F4),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFFE5E7EB),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    selectedUnit,
                    style: AppTextStyle.interSemiBold12.copyWith(
                      color: AppColors.textHeading,
                    ),
                  ),
                ),
                const Spacer(),
                // Quantity Stepper (Limited to max return quantity)
                ReturnQuantityStepper(
                  quantity: quantity,
                  onDecrement: quantity > 0 ? onDecrement : null,
                  onIncrement: quantity < maxReturnQuantity
                      ? onIncrement
                      : null,
                  maxStock: maxReturnQuantity,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

// ── Product Image ────────────────────────────────────────────────────────────

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
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => Icon(
          Icons.assignment_return_outlined,
          color: AppColors.textSecondary,
          size: 28,
        ),
      ),
    );
  }
}