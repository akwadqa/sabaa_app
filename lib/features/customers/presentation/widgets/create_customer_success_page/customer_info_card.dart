import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class CustomerInfoCard extends StatelessWidget {
  final String shopName;
  final String customerName;
  final String phoneNumber;
  final String address;

  const CustomerInfoCard({
    super.key,
    required this.shopName,
    required this.customerName,
    required this.phoneNumber,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: const BorderDirectional(
            start: BorderSide(color: AppColors.primary, width: 4)),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A001A40),
            blurRadius: 40,
            offset: Offset(0, 20),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // _buildHeader(),
            // const SizedBox(height: 18),
            _InfoRow(
              icon: Icons.person_outline,
              label: 'customer_name'.tr(),
              value: customerName,
            ),
            // const SizedBox(height: 12),
            _InfoRow(
              icon: Icons.phone_outlined,
              label: 'phone_number'.tr(),
              value: phoneNumber,
            ),
            // const SizedBox(height: 12),
            _InfoRow(
              icon: Icons.location_on_outlined,
              label: 'address_label'.tr(),
              value: address,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.storefront, color: AppColors.primary),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'customer_profile'.tr(),
                style:
                    AppTextStyle.rubikMedium18.copyWith(color: AppColors.grey),
              ),
              Text(
                shopName,
                style:
                    AppTextStyle.rubikBold20.copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: AppColors.background,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.darkGray, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label.toUpperCase(),
                style: AppTextStyle.rubikSemiBold16.copyWith(
                  color: AppColors.black,
                  // fontSize: 12,
                ),
              ),
              Text(
                value,
                style:
                    AppTextStyle.rubikRegular16.copyWith(color: AppColors.gray),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
