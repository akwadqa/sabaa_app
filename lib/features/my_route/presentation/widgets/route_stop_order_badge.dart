import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

import '../../domain/model/route_stop_model.dart';

class RouteStopOrderBadge extends StatelessWidget {
  const RouteStopOrderBadge({
    super.key,
    required this.order,
    required this.status,
  });

  final int             order;
  final RouteStopStatus status;

  @override
  Widget build(BuildContext context) {
    final cfg = _config(status);
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: cfg.background,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        order.toString().padLeft(2, '0'),
        style: AppTextStyle.interBold18.copyWith(
          fontSize: 14,
          color: cfg.textColor,
        ),
      ),
    );
  }

  _BadgeConfig _config(RouteStopStatus s) {
    switch (s) {
      case RouteStopStatus.inProgress:
        return const _BadgeConfig(
          background: AppColors.primary,
          textColor:  AppColors.white,
        );
      case RouteStopStatus.pending:
        return const _BadgeConfig(
          background: Color(0xFFEFF6FF),
          textColor:  AppColors.primary,
        );
      case RouteStopStatus.visited:
        return const _BadgeConfig(
          background: Color(0xFFF4F5F7),
          textColor:  AppColors.textSecondary,
        );
    }
  }
}

class _BadgeConfig {
  const _BadgeConfig({required this.background, required this.textColor});
  final Color background;
  final Color textColor;
}