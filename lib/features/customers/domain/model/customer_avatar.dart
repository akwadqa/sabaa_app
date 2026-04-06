import 'package:flutter/material.dart';

/// Sealed-style base for the two avatar variants.
abstract class CustomerAvatar {
  const CustomerAvatar();
}

/// Shows colored initials (e.g. "FM", "7E").
class InitialsAvatar extends CustomerAvatar {
  const InitialsAvatar({
    required this.initials,
    required this.backgroundColor,
    required this.textColor,
  });

  final String initials;
  final Color  backgroundColor;
  final Color  textColor;
}

/// Shows a network image with an optional border.
class ImageAvatar extends CustomerAvatar {
  const ImageAvatar({
    required this.imageUrl,
    this.borderColor,
  });

  final String imageUrl;
  final Color? borderColor;
}