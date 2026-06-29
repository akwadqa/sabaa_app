import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../src/core/shared_widgets/custom_button_widget.dart';
import '../../../../../src/core/utils/extenssions/widget_extensions.dart';
import '../../../../../src/resourses/color_manager/app_colors.dart';
import '../../../../../src/resourses/font_manager/app_text_style.dart';

class ImagesGrid extends StatelessWidget {
  const ImagesGrid({
    super.key,
    required this.images,
    required this.onAdd,
    required this.onRemove,
  });

  final List<String> images;
  final VoidCallback onAdd;
  final ValueChanged<int> onRemove;

  @override
  Widget build(BuildContext context) {
    final canAddMore = true;
    // final canAddMore = images.length < 5;
    final noImagesYet = images.isEmpty;

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        if (canAddMore) _AddImageTile(onTap: onAdd, noImagesYet: noImagesYet),
        ...List.generate(
          images.length,
          (index) => _ImageTile(
            imagePath: images[index],
            onRemove: () => onRemove(index),
          ),
        ),
      ],
    );
  }
}

class _AddImageTile extends StatelessWidget {
  const _AddImageTile({required this.onTap, required this.noImagesYet});

  final VoidCallback onTap;
  final bool noImagesYet;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: DottedBorder(
        options: RectDottedBorderOptions(
          dashPattern: const [6, 4],
          color: AppColors.primary,
          strokeWidth: 1.5,

          // borderType: BorderType.RRect,
          // radius: const Radius.circular(12),
        ),
        child: Container(
          width: noImagesYet ? double.infinity : 100,
          height: noImagesYet ? 160 : 100,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Icon(noImagesYet ? Icons.camera_alt : Icons.add,
                    size: 20, color: AppColors.primary),
              ),
              if (noImagesYet) ...[
                Text('take_photo'.tr(),
                        style: AppTextStyle.rubikRegular14
                            .copyWith(color: AppColors.grey))
                    .symmetricPadding(vertical: 16),
                CustomButtonWidget(
                  text: "select_image",
                  onTap: onTap,
                  radius: 12,
                  isFiled: true,
                  height: 45,
                  width: 150,
                  backgroundColor: AppColors.dateBadge,
                  child: Text(
                    'add_photo'.tr(),
                    style: AppTextStyle.rubikBold14
                        .copyWith(color: AppColors.primary),
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _ImageTile extends StatelessWidget {
  const _ImageTile({
    required this.imagePath,
    required this.onRemove,
  });

  final String imagePath;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: DottedBorder(
            options: RectDottedBorderOptions(
              dashPattern: const [6, 4],
              color: AppColors.primary,
              strokeWidth: 1.5,

              // borderType: BorderType.RRect,
              // radius: const Radius.circular(12),
            ),
            child: Image.file(
              File(imagePath),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: InkWell(
            onTap: onRemove,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                size: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
