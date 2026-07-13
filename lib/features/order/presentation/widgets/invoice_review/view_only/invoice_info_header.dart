import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class InvoiceInfoHeader extends StatelessWidget {
  const InvoiceInfoHeader({
    super.key,
    required this.invoiceId,
    required this.customerName,
    required this.date,
    required this.status,
  });

  final String invoiceId;
  final String customerName;
  final String date;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _InfoRow(label: 'invoice_id'.tr(), value: invoiceId),
          const Divider(height: 16),
          _InfoRow(label: 'customer'.tr(), value: customerName),
          const Divider(height: 16),
          _InfoRow(label: 'date'.tr(), value: date),
          const Divider(height: 16),
          _InfoRow(
            label: 'status'.tr(),
            value: status,
            valueColor: status == 'Paid'
                ? AppColors.successGreen
                : AppColors.warnYellow,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          Text(
            label,
            style: AppTextStyle.interRegular14.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          8.horizontalSpace,
          Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.interSemiBold14.copyWith(
              color: valueColor ?? AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}