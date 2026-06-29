import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/order/presentation/controller/order_controller.dart';
import 'package:sabaa/features/order/presentation/widgets/display_capture_page/image_grid.dart';
import 'package:sabaa/src/core/shared_widgets/custom_app_bar.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class DisplayCapturePage extends StatelessWidget {
  const DisplayCapturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomDeafultAppbar(title: 'display_capture'.tr()),
        body: _DisplayCapturePageBody());
  }
}

class _DisplayCapturePageBody extends ConsumerWidget {
  const _DisplayCapturePageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderControllerProvider).value!;
    final controller = ref.read(orderControllerProvider.notifier);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Market',
            style:
                AppTextStyle.rubikRegular12.copyWith(color: AppColors.blueGrey),
          ),
          20.verticalSpace,
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "display_photo".tr(),
              style: AppTextStyle.rubikBold18.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
          15.verticalSpace,
          ImagesGrid(
            images: state.images ?? [],
            onAdd: controller.pickImage,
            onRemove: controller.removeImage,
          ),
          20.verticalSpace,
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "display_notes".tr(),
              style: AppTextStyle.rubikBold18.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
          15.verticalSpace,
          TextField(
            maxLines: 5,
            style: AppTextStyle.rubikRegular14.copyWith(color: AppColors.black),
            decoration: InputDecoration(
              hintText: "display_notes_hint".tr(),
              hintStyle:
                  AppTextStyle.rubikRegular14.copyWith(color: AppColors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.grey),
              ),
            ),
          ),
          20.verticalSpace,
          CustomButtonWidget(
              text: 'continue'.tr(),
              onTap: () {},
              elevation: 2,
              shadowColor: AppColors.primary,
              isFiled: true,
              height: 48,
              backgroundColor: AppColors.primary,
              radius: 12,
              width: 300)
        ],
      ).symmetricPadding(horizontal: 20),
    );
  }
}
