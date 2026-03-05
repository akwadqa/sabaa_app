import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../src/resourses/color_manager/app_colors.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.dividerColor)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'or_login_with'.tr(),
            style: textTheme.labelLarge!.copyWith(
              color: AppColors.gray02,
            ),
          ),
        ),
        const Expanded(child: Divider(color: AppColors.dividerColor)),
      ],
    );
  }
}
