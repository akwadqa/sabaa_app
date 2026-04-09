import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';

import '../../domain/model/order_item.dart';
import 'quantity_stepper.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({
    super.key,
    required this.item,
    required this.quantity,
    required this.onDecrement,
    required this.onIncrement,
    required this.onDelete,
  });

  final OrderItem    item;
  final int          quantity;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  final VoidCallback onDelete;

  // ── Style helpers ────────────────────────────────────────────────────────────

  Color get _imageBg    => item.isReturn ? const Color(0xFFFFEDE0) : const Color(0xFFF3F4F6);
  Color get _priceColor => item.isReturn ? AppColors.accent : AppColors.primary;
  Color get _borderColor => item.isReturn ? AppColors.primary : const Color(0xFFF3F4F6);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _borderColor),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Top row: image + name/sku/price + checkbox (return) ───
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProductImage(bgColor: _imageBg, isReturn: item.isReturn),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: AppTextStyle.interSemiBold14.copyWith(
                        color: AppColors.textHeading,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    4.verticalSpace,
                    Text(
                      'SKU: ${item.sku}',
                      style: AppTextStyle.interRegular12.copyWith(
                        color: const Color(0xFF617589),
                      ),
                    ),
                    2.verticalSpace,
                    Text(
                      item.price,
                      style: AppTextStyle.interSemiBold14.copyWith(
                        color: _priceColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              if (item.isReturn)
                const Icon(
                  Icons.check_box,
                  color: AppColors.primary,
                  size: 22,
                ),
            ],
          ),
          12.verticalSpace,

          // ── Bottom row: stepper + delete ──────────────────────────
          Row(
            children: [
              QuantityStepper(
                quantity:    quantity,
                onDecrement: onDecrement,
                onIncrement: onIncrement,
              ),
              const Spacer(),
              GestureDetector(
                onTap: onDelete,
                child: const Icon(
                  Icons.delete_outline,
                  color: Color(0xFF617589),
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Product image placeholder ─────────────────────────────────────────────────

class _ProductImage extends StatelessWidget {
  const _ProductImage({required this.bgColor, required this.isReturn});

  final Color bgColor;
  final bool  isReturn;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        isReturn
            ? Icons.assignment_return_outlined
            : Icons.inventory_2_outlined,
        color: isReturn ? AppColors.accent : AppColors.textSecondary,
        size: 22,
      ),
    );
  }
}