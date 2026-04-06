import 'package:flutter/material.dart';
import 'package:sabaa/features/customers/domain/model/customer_avatar.dart';
import 'package:sabaa/features/customers/domain/model/customer_model.dart';
import 'package:sabaa/features/customers/presentation/widgets/customer_avatar_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class CustomerDetailsProfileHeader extends StatelessWidget {
  const CustomerDetailsProfileHeader({super.key, required this.customer});

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.navBorder),
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
          // ── Avatar (80×80 for detail page) ─────────────────────
          _LargeAvatar(avatar: customer.avatar),
          16.horizontalSpace,

          // ── Info ────────────────────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customer.name,
                  style: AppTextStyle.interSemiBold18.copyWith(
                    color: AppColors.textHeading,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                8.verticalSpace,
                _IconRow(
                  icon: Icons.phone_outlined,
                  label: customer.phone ?? '',
                ),
                4.verticalSpace,
                _IconRow(
                  icon: Icons.location_on_outlined,
                  label: customer.address,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Private sub-widgets ───────────────────────────────────────────────────────

class _LargeAvatar extends StatelessWidget {
  const _LargeAvatar({required this.avatar});

  final CustomerAvatar avatar;

  @override
  Widget build(BuildContext context) {
    return switch (avatar) {
      ImageAvatar() => _image(avatar as ImageAvatar),
      InitialsAvatar() => _initials(avatar as InitialsAvatar),
      _ => const SizedBox.square(dimension: 80),
    };
  }

  Widget _image(ImageAvatar a) => Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9999),
          border: Border.all(color: AppColors.imageBorderBlue, width: 2),
          image: DecorationImage(
            image: NetworkImage(a.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget _initials(InitialsAvatar a) => Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: a.backgroundColor,
          borderRadius: BorderRadius.circular(9999),
        ),
        alignment: Alignment.center,
        child: Text(
          a.initials,
          style: AppTextStyle.interBold22.copyWith(color: a.textColor),
        ),
      );
}

class _IconRow extends StatelessWidget {
  const _IconRow({required this.icon, required this.label});

  final IconData icon;
  final String   label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.textSecondary),
        4.horizontalSpace,
        Expanded(
          child: Text(
            label,
            style: AppTextStyle.interRegular14.copyWith(
              color: const Color(0xFF6B7280),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}