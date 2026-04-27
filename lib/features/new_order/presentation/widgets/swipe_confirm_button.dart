import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class SwipeToConfirmButton extends StatefulWidget {
  final VoidCallback onConfirm;

  const SwipeToConfirmButton({super.key, required this.onConfirm});

  @override
  State<SwipeToConfirmButton> createState() =>
      _SwipeToConfirmButtonState();
}

class _SwipeToConfirmButtonState extends State<SwipeToConfirmButton> {
  double _position = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              'swipe_to_confirm'.tr(),
              style: AppTextStyle.interSemiBold14.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
          Positioned(
            left: _position,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _position += details.delta.dx;
                  _position = _position.clamp(0, 260);
                });
              },
              onHorizontalDragEnd: (_) {
                if (_position > 220) {
                  widget.onConfirm(); // ✅ API call
                } else {
                  setState(() => _position = 0);
                }
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}