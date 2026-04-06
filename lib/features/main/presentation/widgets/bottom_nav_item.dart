import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/functions/app_spacing.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class NavDestination {
  const NavDestination({
    required this.label,
    required this.icon,
    required this.page,
  });

  final String   label;
  final IconData icon;
  final Widget   page;
}
class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final IconData     icon;
  final String       label;
  final bool         isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.primary : AppColors.textSecondary;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 24),
            4.verticalSpace,
            Text(
              label.tr(),
                          style: AppTextStyle.interMedium12.copyWith(
                color: color,
                fontWeight: FontWeight.w700,
              ),

            ),
          ],
        ),
      ),
    );
  }
}