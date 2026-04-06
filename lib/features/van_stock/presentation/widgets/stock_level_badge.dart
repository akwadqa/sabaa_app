import 'package:flutter/material.dart';

import '../../../../src/resourses/font_manager/app_text_style.dart';
import '../../domain/model/stock_item.dart';

class StockLevelBadge extends StatelessWidget {
  const StockLevelBadge({super.key, required this.level});

  final StockLevel level;

  @override
  Widget build(BuildContext context) {
    final config = _badgeConfig(level);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: config.background,
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Text(
        config.label,
        style: AppTextStyle.interMedium10.copyWith(
          color: config.textColor,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.25,
        ),
      ),
    );
  }

  _BadgeConfig _badgeConfig(StockLevel level) {
    switch (level) {
      case StockLevel.high:
        return const _BadgeConfig(
          label: 'HIGH',
          background: Color(0xFFDCFCE7),
          textColor: Color(0xFF15803D),
        );
      case StockLevel.medium:
        return const _BadgeConfig(
          label: 'MED',
          background: Color(0xFFFEF9C3),
          textColor: Color(0xFFA16207),
        );
      case StockLevel.low:
        return const _BadgeConfig(
          label: 'LOW',
          background: Color(0xFFFEE2E2),
          textColor: Color(0xFFB91C1C),
        );
    }
  }
}

class _BadgeConfig {
  const _BadgeConfig({
    required this.label,
    required this.background,
    required this.textColor,
  });

  final String label;
  final Color  background;
  final Color  textColor;
}