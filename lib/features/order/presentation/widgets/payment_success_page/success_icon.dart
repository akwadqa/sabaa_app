import 'package:flutter/material.dart';
import 'package:sabaa/gen/assets.gen.dart';

class SuccessIcon extends StatefulWidget {
  const SuccessIcon({super.key});

  @override
  State<SuccessIcon> createState() => _SuccessIconState();
}

class _SuccessIconState extends State<SuccessIcon>
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
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF003F87), Color(0xFF0056B3)],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF001A40).withOpacity(0.15),
                    blurRadius: 40,
                    offset: const Offset(0, 20),
                  ),
                ],
              ),
              child: Assets.icons.successCreateCustomerIc.svg(
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
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
          color: const Color(0xFF003F87).withOpacity(0.1),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
