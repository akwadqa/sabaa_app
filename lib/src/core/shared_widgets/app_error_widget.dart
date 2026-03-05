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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.imErrorScreen.image(),
          30.verticalSpace,
          Text(
            context.tr(errorMsg ?? "Unkown error occured"),
            style: Theme.of(context).textTheme.displaySmall,
          ),
          if (onTap != null)
            Expanded(
                child: CustomButtonWidget(
              text: "retry".tr(),
              onTap: onTap!,
              isFiled: true,
              backgroundColor: AppColors.primary,
              radius: 8,
              height: 45,
              width: double.infinity,
            )),
        ],
      ),
    );
  }
}
