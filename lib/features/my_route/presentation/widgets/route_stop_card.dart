import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

import '../../domain/model/route_stop_model.dart';
import 'route_stop_order_badge.dart';
import 'route_stop_status_badge.dart';

class RouteStopCard extends StatelessWidget {
  const RouteStopCard({
    super.key,
    required this.stop,
    this.onCheckIn,
    this.onCheckOut,
    this.onNavigate,
    this.onContact,
    this.onViewSummary,
  });

  final RouteStop     stop;
  final VoidCallback? onCheckIn;
  final VoidCallback? onCheckOut;
  final VoidCallback? onNavigate;
  final VoidCallback? onContact;
  final VoidCallback? onViewSummary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: stop.status == RouteStopStatus.inProgress
              ? AppColors.primary
              : AppColors.navBorder,
          width: stop.status == RouteStopStatus.inProgress ? 1.5 : 1,
        ),
        boxShadow: const [
          BoxShadow(color: Color(0x19000000), blurRadius: 4, offset: Offset(0, 2), spreadRadius: -2),
          BoxShadow(color: Color(0x19000000), blurRadius: 6, offset: Offset(0, 4), spreadRadius: -1),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header: order badge + name + status badge ───────
          _StopHeader(stop: stop),
          8.verticalSpace,

          // ── Address row ─────────────────────────────────────
          _AddressRow(address: stop.address),
          12.verticalSpace,

          // ── Footer — varies by status ────────────────────────
          _StopFooter(
            stop:          stop,
            onCheckIn:     onCheckIn,
            onCheckOut:    onCheckOut,
            onNavigate:    onNavigate,
            onContact:     onContact,
            onViewSummary: onViewSummary,
          ),
        ],
      ),
    );
  }
}

// ── Header ────────────────────────────────────────────────────────────────────

class _StopHeader extends StatelessWidget {
  const _StopHeader({required this.stop});

  final RouteStop stop;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RouteStopOrderBadge(order: stop.order, status: stop.status),
        12.horizontalSpace,
        Expanded(
          child: Text(
            stop.customerName,
            style: AppTextStyle.interSemiBold16.copyWith(
              color: AppColors.textPrimary,
              decoration: stop.status == RouteStopStatus.visited
                  ? TextDecoration.lineThrough
                  : null,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        8.horizontalSpace,
        RouteStopStatusBadge(status: stop.status),
      ],
    );
  }
}

// ── Address ───────────────────────────────────────────────────────────────────

class _AddressRow extends StatelessWidget {
  const _AddressRow({required this.address});

  final String address;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined, size: 14, color: AppColors.textSecondary),
        4.horizontalSpace,
        Expanded(
          child: Text(
            address,
            style: AppTextStyle.interRegular14.copyWith(
              color: AppColors.textSecondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// ── Footer (status-aware) ─────────────────────────────────────────────────────

class _StopFooter extends StatelessWidget {
  const _StopFooter({
    required this.stop,
    this.onCheckIn,
    this.onCheckOut,
    this.onNavigate,
    this.onContact,
    this.onViewSummary,
  });

  final RouteStop     stop;
  final VoidCallback? onCheckIn;
  final VoidCallback? onCheckOut;
  final VoidCallback? onNavigate;
  final VoidCallback? onContact;
  final VoidCallback? onViewSummary;

  @override
  Widget build(BuildContext context) {
    switch (stop.status) {
      case RouteStopStatus.inProgress:
        return _InProgressFooter(
          elapsedTime: stop.elapsedTime ?? '00:00:00',
          onCheckOut:  onCheckOut,
        );
      case RouteStopStatus.pending:
        return _PendingFooter(
          onNavigate: onNavigate,
          onContact:  onContact,
          onCheckIn:  onCheckIn,
        );
      case RouteStopStatus.visited:
        return _VisitedFooter(
          checkedOutAt:  stop.checkedOutAt ?? '',
          onViewSummary: onViewSummary,
        );
    }
  }
}

// ── In-progress footer ────────────────────────────────────────────────────────

class _InProgressFooter extends StatelessWidget {
  const _InProgressFooter({
    required this.elapsedTime,
    this.onCheckOut,
  });

  final String        elapsedTime;
  final VoidCallback? onCheckOut;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Timer
        Row(
          children: [
            const Icon(Icons.timer_outlined, size: 14, color: AppColors.primary),
            6.horizontalSpace,
            Text(
              elapsedTime,
              style: AppTextStyle.interSemiBold14.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        // Check-out button
        GestureDetector(
          onTap: onCheckOut,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'check_out'.tr(),
              style: AppTextStyle.interSemiBold14.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Pending footer ────────────────────────────────────────────────────────────

class _PendingFooter extends StatelessWidget {
  const _PendingFooter({
    this.onNavigate,
    this.onContact,
    this.onCheckIn,
  });

  final VoidCallback? onNavigate;
  final VoidCallback? onContact;
  final VoidCallback? onCheckIn;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Navigate
        _TextIconAction(
          icon:     Icons.navigation_outlined,
          labelKey: 'navigate',
          color:    AppColors.primary,
          onTap:    onNavigate,
        ),
        16.horizontalSpace,

        // Contact
        _TextIconAction(
          icon:     Icons.phone_outlined,
          labelKey: 'contact',
          color:    AppColors.textSecondary,
          onTap:    onContact,
        ),

        // Check-in (pushed to end)
        const Spacer(),
        GestureDetector(
          onTap: onCheckIn,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0x19135BEC),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'check_in'.tr(),
              style: AppTextStyle.interSemiBold14.copyWith(
                fontSize: 12,
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Visited footer ────────────────────────────────────────────────────────────

class _VisitedFooter extends StatelessWidget {
  const _VisitedFooter({
    required this.checkedOutAt,
    this.onViewSummary,
  });

  final String        checkedOutAt;
  final VoidCallback? onViewSummary;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Checked out time
        Row(
          children: [
            const Icon(Icons.check_circle_outline, size: 14, color: Color(0xFF15803D)),
            6.horizontalSpace,
            Text(
              '${'checked_out_at'.tr()} $checkedOutAt',
              style: AppTextStyle.interMedium12.copyWith(
                color: const Color(0xFF15803D),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        // View summary
        GestureDetector(
          onTap: onViewSummary,
          child: Row(
            children: [
              Text(
                'view_summary'.tr(),
                style: AppTextStyle.interMedium12.copyWith(
                  color: AppColors.secondPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.horizontalSpace,
              const Icon(Icons.chevron_right, size: 14, color: AppColors.secondPrimary),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Shared text+icon action ───────────────────────────────────────────────────

class _TextIconAction extends StatelessWidget {
  const _TextIconAction({
    required this.icon,
    required this.labelKey,
    required this.color,
    this.onTap,
  });

  final IconData      icon;
  final String        labelKey;
  final Color         color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 14, color: color),
          6.horizontalSpace,
          Text(
            labelKey.tr(),
            style: AppTextStyle.interMedium12.copyWith(
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}