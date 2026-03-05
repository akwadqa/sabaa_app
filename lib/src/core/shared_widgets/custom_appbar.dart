
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/core/shared_widgets/custom_back_arrow_widget%20copy.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final bool? withBackButton;
    final bool? showSearch;
  final ValueChanged<String>? onSearchTextChanged;
  const CustomAppbar({
    super.key,
    required this.title,
    this.withBackButton, this.showSearch=false, this.onSearchTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    return AppBar(
      backgroundColor: AppColors.background,
      centerTitle: true,
      elevation: 0,
      bottomOpacity: 0,
      // leadingWidth: 65,
      automaticallyImplyLeading: false,
      title: Text(
        context.tr(title),
          style: textTheme.displayLarge!.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w800,
        fontSize: 20
      ),
      ),
      leading: withBackButton == null ? CustomBackArrowWidget() : null,
      bottom: PreferredSize(
          preferredSize: Size(double.infinity, 1),
          child:
          
           showSearch??false
          ? TextField(
              onChanged: onSearchTextChanged!,
              decoration: const InputDecoration(
                hintText: 'ابحث...',
                border: InputBorder.none,
              ),
            )
          :
           Divider(
            height: 1,
            color: AppColors.lightGray,
          )),
    );
  }
}
