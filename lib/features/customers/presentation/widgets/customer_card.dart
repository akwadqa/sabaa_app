import 'package:flutter/material.dart';
import 'package:sabaa/features/customers/presentation/widgets/customer_avatar_widget.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';

import '../../../../src/core/utils/extenssions/int_extenssion.dart';
import '../../../../src/resourses/font_manager/app_text_style.dart';
import '../../domain/model/customer_model.dart';
import 'visit_status_badge.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({
    super.key,
    required this.customer,
    this.onTap,
  });

  final Customer     customer;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.navBorder),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ── Avatar ────────────────────────────────────────
            CustomerAvatarWidget(avatar: customer.avatar),
            16.horizontalSpace,

            // ── Name + address ────────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customer.name,
                    style: AppTextStyle.interSemiBold14.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  8.verticalSpace,
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: AppColors.textSecondary,
                      ),
                      4.horizontalSpace,
                      Expanded(
                        child: Text(
                          customer.address,
                          style: AppTextStyle.interRegular14.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            16.horizontalSpace,

            // ── Status badge + amount / arrow ─────────────────
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                VisitStatusBadge(status: customer.status),
                8.verticalSpace,
                _TrailingAmount(customer: customer),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Trailing: amount or arrow button ─────────────────────────────────────────

class _TrailingAmount extends StatelessWidget {
  const _TrailingAmount({required this.customer});

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    // Visited with no sale → strikethrough $0.00
    if (customer.status == VisitStatus.visited) {
      return Text(
        r'$0.00',
        style: AppTextStyle.interSemiBold14.copyWith(
          fontSize: 12,
          color: AppColors.statusVisitedAmount,
          decoration: TextDecoration.lineThrough,
        ),
      );
    }

    // Pending → chevron button
    if (customer.status == VisitStatus.pending) {
      return Container(
        width: 24,
        height: 24,
        decoration:  BoxDecoration(
          color:AppColors.chevronBg,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.chevron_right_rounded,
          size: 16,
          color: AppColors.textSecondary,
        ),
      );
    }

    // Open → order amount
    return Text(
      customer.orderAmount ?? '',
      style: AppTextStyle.interSemiBold14.copyWith(
        fontSize: 12,
        color: AppColors.textPrimary,
      ),
    );
  }
}