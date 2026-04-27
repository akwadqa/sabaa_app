import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

import '../../domain/model/route_stop_model.dart';

class RouteStopStatusBadge extends StatelessWidget {
  const RouteStopStatusBadge({super.key, required this.status});

  final RouteStopStatus status;

  @override
  Widget build(BuildContext context) {
    final cfg = _config(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: cfg.background,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            cfg.labelKey.tr(),
            style: AppTextStyle.interMedium12.copyWith(
              color: cfg.textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (status == RouteStopStatus.visited) ...[
            const SizedBox(width: 4),
            Icon(Icons.check, size: 12, color: cfg.textColor),
          ],
        ],
      ),
    );
  }

  _BadgeConfig _config(RouteStopStatus s) {
    switch (s) {
      case RouteStopStatus.inProgress:
        return const _BadgeConfig(
          labelKey:   'stop_in_progress',
          background: Color(0xFFEFF6FF),
          textColor:  Color(0xFF005AAB),
        );
      case RouteStopStatus.pending:
        return const _BadgeConfig(
          labelKey:   'stop_pending',
          background: Color(0xFFFFEDD5),
          textColor:  Color(0xFFC2410C),
        );
      case RouteStopStatus.visited:
        return const _BadgeConfig(
          labelKey:   'stop_visited',
          background: Color(0xFFF0FDF4),
          textColor:  Color(0xFF15803D),
        );
      case RouteStopStatus.completed:
        return const _BadgeConfig(
          labelKey:   'completed',
          background: Color(0xFFF0FDF4),
          textColor:  Color(0xFF15803D),
        );
      case RouteStopStatus.failed:
        return const _BadgeConfig(
          labelKey:   'failed',
          background: AppColors.lightPeach,
          textColor:  AppColors.red,
        );
      case RouteStopStatus.skipped:
        return const _BadgeConfig(
          labelKey:   'skipped',
          background: AppColors.accent,
          textColor:  AppColors.white,
        );
    }
  }
}

class _BadgeConfig {
  const _BadgeConfig({
    required this.labelKey,
    required this.background,
    required this.textColor,
  });

  final String labelKey;
  final Color  background;
  final Color  textColor;
}