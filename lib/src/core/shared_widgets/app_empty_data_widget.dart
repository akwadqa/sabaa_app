import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

import '../../../gen/assets.gen.dart';

class AppEmptyDataWidget extends StatelessWidget {
  // final String text;
  // final String text;
  final double? height;
  final Widget? image;
  const AppEmptyDataWidget({super.key, this.height, this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        image?? SvgPicture.asset(Assets.images.emptyData.keyName,fit: BoxFit.cover,height:height ,),
          20.verticalSpace,
          Text(
            context.tr("no_results_found"),
            style: AppTextStyle.interBold20.copyWith(color: AppColors.primary),
          ),
          4.verticalSpace,
          Text(
            textAlign: TextAlign.center,
            context.tr("no_search_results_desc"),
            style: AppTextStyle.interMedium16,
          ),
        ],
      ),
    );
  }
}
