import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

import '../../../../../src/core/shared_widgets/custom_button_widget.dart';
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
    return 
    
    CustomButtonWidget(
      
              text: '',
              
              onTap:action.onTap,
              isFiled: action.isPrimary,
              height: 56,
              width: double.infinity,
              backgroundColor: ! action.isPrimary ? AppColors.gray : AppColors.primary,
              radius: 12,
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   spacing: 12,
                   children: [
                     Icon(action.icon, color: AppColors.white, size: 25),
                     Text(
                           action.labelKey.tr(),
                           style: AppTextStyle.interBold18.copyWith(
                             fontSize: 16,
                             color: AppColors.white,
                           ),
                         ),
                   ],
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

   return 
   
     CustomButtonWidget(
      
              text: '',
              
              onTap: () => action.onTap,
              isFiled: action.isPrimary,
              height: 56,
              width: double.infinity,
              backgroundColor: AppColors.white,
              radius: 12,
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   spacing: 12,
                   children: [
                     Icon(action.icon, color: AppColors.textPrimary, size: 25),
                     Text(
                           action.labelKey.tr(),
                           style: AppTextStyle.interBold18.copyWith(
                             fontSize: 16,
                             color: AppColors.textPrimary,
                           ),
                         ),
                   ],
                 ),
           
            );

  }
}