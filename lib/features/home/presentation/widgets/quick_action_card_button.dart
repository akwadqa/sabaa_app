import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/functions/app_spacing.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class QuickAction {
  const QuickAction({
    required this.label,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final Color color;
  final IconData icon;
  final VoidCallback onTap;
}
 
class QuickActionCardButton extends StatelessWidget {
  const QuickActionCardButton({super.key, required this.action});
 
  final QuickAction action;
 
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: action.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
          decoration: BoxDecoration(
            color: action.color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(action.icon, color: Colors.white, size: 26),
              8.verticalSpace,
              Text(
                action.label.tr(),
                style: AppTextStyle.interSemiBold14.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}