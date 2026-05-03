import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class PaymentReceiptCard extends StatelessWidget {
  final String amount;
  final String invoiceId;
  final String customerName;
  final String date;
  final String paymentMethod;

  const PaymentReceiptCard({
    super.key,
    required this.amount,
    required this.invoiceId,
    required this.customerName,
    required this.date,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF001A40).withOpacity(0.04),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            const PositionedBorderSide(),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  _buildAmountSection(),
                  const SizedBox(height: 30),
                  const Divider(color: Color(0x1AC2C6D4)),
                  const SizedBox(height: 30),
                  _ReceiptRow(label: 'invoice'.tr(), value: invoiceId),
                  const SizedBox(height: 12),
                  _ReceiptRow(
                      label: 'customer_label'.tr(), value: customerName),
                  const SizedBox(height: 12),
                  _ReceiptRow(label: 'date_label'.tr(), value: date),
                  const SizedBox(height: 12),
                  _ReceiptRow(
                      label: 'payment_method_label'.tr(),
                      value: paymentMethod.tr()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountSection() {
    return Column(
      children: [
        Text(
          'amount_paid'.tr().toUpperCase(),
          style: AppTextStyle.rubikMedium18.copyWith(color: AppColors.grey),
        ),
        const SizedBox(height: 4),
        Text(
          amount,
          style: AppTextStyle.rubikBold25.copyWith(
            fontSize: 36,
            color: const Color(0xFF003F87),
            letterSpacing: -1.8,
          ),
        ),
      ],
    );
  }
}

class PositionedBorderSide extends StatelessWidget {
  const PositionedBorderSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      bottom: 0,
      width: 4,
      child: Container(color: const Color(0xFF003F87)),
    );
  }
}

class _ReceiptRow extends StatelessWidget {
  final String label;
  final String value;

  const _ReceiptRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyle.rubikMedium14
              .copyWith(color: const Color(0xFF424752)),
        ),
        Text(
          value,
          style: AppTextStyle.rubikRegular14.copyWith(color: AppColors.black),
        ),
      ],
    );
  }
}
