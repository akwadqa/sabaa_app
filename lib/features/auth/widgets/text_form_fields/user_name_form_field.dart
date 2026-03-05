import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';


class UserNameFormField extends StatelessWidget {
  const UserNameFormField({super.key, this.onSaved, required this.userNameController});
  final void Function(String?)? onSaved;
  final TextEditingController userNameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr("user_name"),
          style:
              AppTextStyle.interSemiBold16,
        ).onlyPadding(start: 8),
        8.verticalSpace,
        TextFormField(
          controller: userNameController,
          style: TextStyle(color: AppColors.gray),
          decoration: InputDecoration(
            hintText: context.tr('user_name'),
            hintStyle: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(fontSize: 14, color: AppColors.grey600),
                   prefixIcon: Assets.icons.personIc.svg(
              width: 18,
              height: 18,
              fit: BoxFit.scaleDown,
            ),
          ),
          textInputAction: TextInputAction.next,
          validator: qValidator([
            IsRequired(context.tr('required')),
            // IsEmail(context.tr('name_valdation_msg'))
          ]),
          keyboardType: TextInputType.name,
          onSaved: onSaved,
        ),
      ],
    );
  }
}
