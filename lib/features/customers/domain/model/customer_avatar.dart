import 'dart:math';

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
  final Color backgroundColor;
  final Color textColor;

  factory InitialsAvatar.getAvatarTheme(String? name) {
    if (name == null || name.isEmpty) {
      return InitialsAvatar(
          initials: '?',
          backgroundColor: Colors.grey[200]!,
          textColor: Colors.grey[700]!);
    }
    newName(String name) => name
        .replaceAll(RegExp(r'[^a-zA-Z\u0600-\u06FF]'), '')
        .substring(0, min(2, name.length))
        .toUpperCase();
    final List<InitialsAvatar> themes = [
      InitialsAvatar(
          initials: newName(name),
          backgroundColor: const Color(0xFFF3E5F5),
          textColor: const Color(0xFF7B1FA2)),
      InitialsAvatar(
          initials: newName(name),
          backgroundColor: const Color(0xFFE3F2FD),
          textColor: const Color(0xFF1976D2)),
      InitialsAvatar(
          initials: newName(name),
          backgroundColor: const Color(0xFFE8F5E9),
          textColor: const Color(0xFF388E3C)),
      InitialsAvatar(
          initials: newName(name),
          backgroundColor: const Color(0xFFFFF3E0),
          textColor: const Color(0xFFF57C00)),
    ];

    final index = name.hashCode.abs() % themes.length;
    return themes[index];
  }
}

class ImageAvatar extends CustomerAvatar {
  const ImageAvatar({
    required this.imageUrl,
    this.borderColor,
  });

  final String imageUrl;
  final Color? borderColor;
}
