import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/features/new_order/domain/model/order_item.dart';
import 'package:sabaa/features/new_order/domain/model/order_item_quantity.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class ReturnSummaryPanel extends StatelessWidget {
  const ReturnSummaryPanel({
    super.key,
    required this.items,
    required this.quantities,
    required this.netRefund,
    required this.onFinalize,
  });

  final List<OrderItem>         items;
  final Map<String, OrderItemQuantity> quantities;
  final String                  netRefund;   // e.g. "115 QAR"
  final VoidCallback            onFinalize;

  @override
  Widget build(BuildContext context) {
    final activeItems = items
        .where((i) => (quantities[i.id]?.quantity ?? 0) > 0)
        .toList();

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.lightGray)),
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 30,
            offset: Offset(0, -8),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ── Line items ──────────────────────────────────────
              if (activeItems.isNotEmpty) ...[
                _LineItemHeader(),
                const Divider(height: 12),
                ...activeItems.map((item) {
                  final qty = quantities[item.id]?.quantity ?? 0;
                  return _LineItemRow(item: item, quantity: qty);
                }),
                const Divider(height: 16),
              ],

              // ── Refund summary ──────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'refund_summary'.tr(),
                    style: AppTextStyle.interMedium16.copyWith(
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'net_refund'.tr().toUpperCase(),
                        style: AppTextStyle.interSemiBold14.copyWith(
                          fontSize: 11,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Text(
                        netRefund,
                        style: AppTextStyle.interBold20.copyWith(
                          color: AppColors.textHeading,
                          letterSpacing: -0.6,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              16.verticalSpace,

              // ── Finalize button ─────────────────────────────────
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: onFinalize,
                  icon: const Icon(Icons.check_circle_outline, size: 20),
                  label: Text(
                    'finalize_invoice'.tr(),
                    style: AppTextStyle.interBold18.copyWith(
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Private sub-widgets ───────────────────────────────────────────────────────

class _LineItemHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Text(
          'count'.tr(),
          style: AppTextStyle.interMedium10.copyWith(
            color: AppColors.accent,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 60),
        Text(
          'total'.tr(),
          style: AppTextStyle.interMedium10.copyWith(
            color: AppColors.accent,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _LineItemRow extends StatelessWidget {
  const _LineItemRow({required this.item, required this.quantity});

  final OrderItem item;
  final int       quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              item.name,
              style: AppTextStyle.interMedium14.copyWith(
                color: const Color(0xFF6B7280),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: AppTextStyle.interMedium12.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 30),
          Text(
            // Extract numeric price and multiply by qty for display
            _computeTotal(),
            style: AppTextStyle.interSemiBold14.copyWith(
              fontSize: 14,
              color: const Color(0xFF6B7280),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _computeTotal() {
    // Price format: "-40 QAR / Box" — extract the number
    final parts = item.price.trim().replaceAll('-', '').split(' ');
    final numeric = double.tryParse(parts.first) ?? 0;
    final currency = parts.length > 1 ? parts[1] : '';
    return '${(numeric * quantity).toStringAsFixed(0)} $currency';
  }
}