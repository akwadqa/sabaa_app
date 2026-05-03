import 'package:flutter/material.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';

class SuccessIconIndicator extends StatefulWidget {
  const SuccessIconIndicator({super.key});

  @override
  State<SuccessIconIndicator> createState() => _SuccessIconIndicatorState();
}

class _SuccessIconIndicatorState extends State<SuccessIconIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 144,
        height: 144,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    _buildRipple(1.0),
                    _buildRipple(0.5),
                  ],
                );
              },
            ),
            Container(
              width: 96,
              height: 96,
              padding: const EdgeInsets.all(28),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26001A40),
                    blurRadius: 40,
                    offset: Offset(0, 20),
                  ),
                ],
              ),
              child: Assets.icons.successCreateCustomerIc.svg(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRipple(double initialDelay) {
    final progress = (_controller.value + initialDelay) % 1.0;
    final opacity = (1.0 - progress).clamp(0.0, 1.0);
    final size = 96 + (48 * progress);

    return Opacity(
      opacity: opacity,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
