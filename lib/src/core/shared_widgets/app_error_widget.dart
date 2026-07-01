import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';

import '../../../gen/assets.gen.dart';

class AppErrorWidget extends StatelessWidget {
  final String? errorMsg;
  final void Function()? onTap;

  const AppErrorWidget({super.key, this.errorMsg, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.imErrorScreen.image(width: 180),
            30.verticalSpace,
            Text(
              errorMsg?.tr() ?? "unknown_error_occurred".tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (onTap != null) ...[
              24.verticalSpace,
              SizedBox(
                width: 200,
                child: CustomButtonWidget(
                  text: "retry".tr(),
                  onTap: onTap!,
                  isFiled: true,
                  backgroundColor: AppColors.primary,
                  radius: 8,
                  height: 45,
                  width: double.infinity,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}