import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';

import '../../../../src/resourses/font_manager/app_text_style.dart';
import '../../domain/model/customer_model.dart';



class VisitStatusBadge extends StatelessWidget {
  const VisitStatusBadge({super.key, required this.status});

  final VisitStatus status;

  @override
  Widget build(BuildContext context) {
    final config = _config(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: config.background,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        config.labelKey.tr(),
        style: AppTextStyle.interMedium12.copyWith(color: config.textColor),
      ),
    );
  }

  _BadgeConfig _config(VisitStatus status) {
    switch (status) {
      case VisitStatus.open:
        return  _BadgeConfig(
          labelKey:   'status_open',
          background: AppColors.avatarPurpleBg,
          textColor: AppColors.statusOpenText,
        );
      case VisitStatus.pending:
        return  _BadgeConfig(
          labelKey:   'status_pending',
          background: AppColors.statusPendingBg,
          textColor:  AppColors.statusPendingText,
        );
      case VisitStatus.visited:
        return  _BadgeConfig(
          labelKey:   'status_visited',
          background: AppColors.chevronBg,
          textColor:  AppColors.textSecondary,
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