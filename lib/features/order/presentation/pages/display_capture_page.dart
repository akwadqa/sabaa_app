import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/main/presentation/screens/main_screen.dart';
import 'package:sabaa/features/new_order/presentation/controller/new_order_controller.dart';
import 'package:sabaa/features/order/presentation/controller/order_controller.dart';
import 'package:sabaa/features/order/presentation/widgets/display_capture_page/image_grid.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/app_dialogs.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/shared_widgets/custom_app_bar.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class DisplayCapturePage extends StatelessWidget {
  const DisplayCapturePage({super.key, required this.visitId});
  final String visitId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomDeafultAppbar(title: 'display_capture'.tr()),
        body: _DisplayCapturePageBody(visitId: visitId));
  }
}

class _DisplayCapturePageBody extends ConsumerWidget {
  const _DisplayCapturePageBody({super.key, required this.visitId});
  final String visitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderControllerProvider).value!;
    final controller = ref.read(orderControllerProvider.notifier);
    String note = '';

    ref.listen(
        orderControllerProvider.select(
            (val) => val.value!.uploadCaptureResponse), (previous, next) {
      if (next is AsyncError) {
        showErrorDialog(context, next?.error.toString() ?? "Error");
      }
      if (next is AsyncData) {
        _showSuccessDialog(context, ref);
      }
    });
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
            onChanged: (value) => note = value,
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
          Consumer(builder: (context, ref, child) {
            final state = ref.watch(orderControllerProvider
                .select((val) => val.value!.uploadCaptureResponse));

            if (state is AsyncLoading) {
              return const Center(child: AppLoader());
            }
            return CustomButtonWidget(
                text: 'continue'.tr(),
                onTap: () {
                  ref.read(orderControllerProvider.notifier).uploadCapture(
                        visitId: visitId,
                        captureNote: note,
                      );
                },
                elevation: 2,
                shadowColor: AppColors.primary,
                isFiled: true,
                height: 48,
                backgroundColor: AppColors.primary,
                radius: 12,
                width: 300);
          })
        ],
      ).symmetricPadding(horizontal: 20),
    );
  }

  Future<void> _showSuccessDialog(BuildContext context, WidgetRef ref) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.transparent),
            ),
            Center(
              child: Dialog(
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "photo_uploaded_successfully".tr(),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.interBold22.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// ICON
                      SvgPicture.asset(
                        Assets.icons.successCheckIcon.keyName,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 20),

                      Text(
                        "photo_uploaded_successfully_desc".tr(),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.interRegular14.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),

                      const SizedBox(height: 24),

                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          ref.read(bottomNavIndexProvider.notifier).state = 0;

                          context.goNamed(AppRoutes.mainScreen); // ✅ best
                        },
                        child: Text(
                          "back_to_home".tr(),
                          style: AppTextStyle.interSemiBold14.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
