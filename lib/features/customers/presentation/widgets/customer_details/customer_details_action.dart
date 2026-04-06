import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

import '../../../domain/model/customer_action.dart';

class CustomerDetailsAction extends StatelessWidget {
  const CustomerDetailsAction({super.key, required this.action});

  final CustomerAction action;

  @override
  Widget build(BuildContext context) {
    return action.isPrimary ? _Primary(action: action) : _Secondary(action: action);
  }
}

// ── Primary (filled blue) ─────────────────────────────────────────────────────

class _Primary extends StatelessWidget {
  const _Primary({required this.action});

  final CustomerAction action;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: action.onTap,
        icon: Icon(action.icon, color: AppColors.white, size: 20),
        label: Text(
          action.labelKey.tr(),
          style: AppTextStyle.interBold18.copyWith(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

// ── Secondary (outlined white) ────────────────────────────────────────────────

class _Secondary extends StatelessWidget {
  const _Secondary({required this.action});

  final CustomerAction action;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton.icon(
        onPressed: action.onTap,
        icon: Icon(action.icon, color: AppColors.textPrimary, size: 20),
        label: Text(
          action.labelKey.tr(),
          style: AppTextStyle.interBold18.copyWith(
            fontSize: 16,
            color: AppColors.textPrimary,
          ),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.textPrimary,
          side: const BorderSide(color: AppColors.navBorder),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}