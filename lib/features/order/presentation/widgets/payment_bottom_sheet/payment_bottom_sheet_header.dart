import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class PaymentBottomSheetHeader extends StatelessWidget {
  final String invoiceId;

  const PaymentBottomSheetHeader({
    super.key,
    required this.invoiceId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 22, 32, 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'invoice_payment'.tr(),
                style:
                    AppTextStyle.rubikBold20.copyWith(color: AppColors.black),
              ),
              const SizedBox(height: 4),
              Text(
                'invoice'.tr() + ' $invoiceId',
                style: AppTextStyle.rubikRegular16.copyWith(
                  color: AppColors.blueGrey,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.close, size: 24, color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
