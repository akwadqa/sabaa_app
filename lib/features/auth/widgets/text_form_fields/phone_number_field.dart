import 'package:easy_localization/easy_localization.dart' as local;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/core/shared_widgets/arabic_number_input_formatter.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/core/utils/validator/app_validation.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:queen_validators/queen_validators.dart';


class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({super.key, this.onSaved});

  // final String label;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   context.tr("phone_number"),
        //   style:
        //       Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 15),
        // ).onlyPadding(start: 8),
        // 8.verticalSpace,
        Directionality(
          textDirection: TextDirection.ltr,
          child: TextFormField(
            style: const TextStyle(color: AppColors.gray),
            decoration: InputDecoration(
              filled: true,
              // fillColor: AppColors.fieldBackground,
              
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              hintText:"000-00-00",
              prefixIcon:
      
            _buildPhoneNumberPrefix(context),
              
              hintStyle: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(fontSize: 14, color: AppColors.grey600),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              ArabicNumberInputFormatter(),
            ],
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            validator: mobileNumberValidation(context),
            onSaved: onSaved,
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneNumberPrefix(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Assets.icons.qatarCountry
            .svg(fit: BoxFit.cover)
            .onlyPadding(start: 6)
            ,
        Text(
          '+974',
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.black800,
              ),
              
        ).symmetricPadding(horizontal: 6),
        
      ],
    );
  }
}
