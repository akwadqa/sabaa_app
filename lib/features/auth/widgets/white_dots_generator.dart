import 'dart:math';
import 'package:flutter/material.dart';

List<Widget> generateWhiteDots({
  required int count,
  required double maxWidth,
  required double maxHeight,
}) {
  final random = Random();

  return List.generate(count, (index) {
    final size = random.nextDouble() * 1.5 + 1; // 1.0 → 2.5
    final opacity = random.nextDouble() * 0.4 + 0.2; // 0.2 → 0.6

    return Positioned(
      left: random.nextDouble() * maxWidth,
      top: random.nextDouble() * maxHeight,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(opacity),
          shape: BoxShape.circle,
        ),
      ),
    );
  });
}
