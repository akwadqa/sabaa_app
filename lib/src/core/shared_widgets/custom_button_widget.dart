import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';

import '../../resourses/color_manager/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? color;
  final VoidCallback? onTap;
  final bool isFiled;
  final double height;
  final TextStyle? style;
  final double width;
  final double? radius;
  final double? topPading;
  final double? fontSize;
  final Widget? child;
  final double? elevation;
  final Color? shadowColor;
  const CustomButtonWidget({
    super.key,
    required this.text,
    this.backgroundColor,
    this.color,
    required this.onTap,
    required this.isFiled,
    required this.height,
    required this.width,
    this.radius,
    this.style,
    this.fontSize,
    this.topPading,
    this.child,
    this.elevation,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: AppColors.disabledButton,
          elevation: elevation ?? 1,
          padding: EdgeInsets.zero,
          shadowColor: shadowColor,
          backgroundColor: backgroundColor ?? Colors.transparent,
          foregroundColor: AppColors.black900,
          fixedSize: Size(
            width,
            height,
          ),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: color ?? backgroundColor ?? Colors.transparent),
              borderRadius: BorderRadius.circular(radius ?? 25))),
      onPressed: onTap != null
          ? () {
              onTap!();
            }
          : null,
      child: child ??
          Text(context.tr(text),
                  textAlign: TextAlign.center,
                  style: style ??
                      Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: fontSize ?? 16,
                          color: color ??
                              (isFiled ? Colors.white : color ?? Colors.black),
                          fontWeight: FontWeight.w500))
              .centered(),
    ).onlyPadding(top: topPading ?? 0);
  }
}
