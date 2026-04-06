import 'package:flutter/material.dart';
import 'package:sabaa/features/customers/domain/model/customer_avatar.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class CustomerAvatarWidget extends StatelessWidget {
  const CustomerAvatarWidget({super.key, required this.avatar});

  final CustomerAvatar avatar;

  static const double _size = 64;

  @override
  Widget build(BuildContext context) {
    return switch (avatar) {
      InitialsAvatar() => _InitialsAvatar(avatar: avatar as InitialsAvatar),
      ImageAvatar()    => _ImageAvatar(avatar: avatar as ImageAvatar),
      _                => const SizedBox.square(dimension: _size),
    };
  }
}

// ── Initials ──────────────────────────────────────────────────────────────────

class _InitialsAvatar extends StatelessWidget {
  const _InitialsAvatar({required this.avatar});

  final InitialsAvatar avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: avatar.backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        avatar.initials,
        style: AppTextStyle.interBold18.copyWith(color: avatar.textColor),
      ),
    );
  }
}

// ── Network image ─────────────────────────────────────────────────────────────

class _ImageAvatar extends StatelessWidget {
  const _ImageAvatar({required this.avatar});

  final ImageAvatar avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: avatar.borderColor != null
            ? Border.all(color: avatar.borderColor!, width: 2)
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          avatar.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) =>  ColoredBox(
            color: AppColors.stockImageBg,
            child: Icon(Icons.store_outlined, color:AppColors.textSecondary, size: 28),
          ),
        ),
      ),
    );
  }
}