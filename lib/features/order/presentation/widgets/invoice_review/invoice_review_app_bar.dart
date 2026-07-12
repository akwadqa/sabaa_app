// lib/features/order/presentation/widgets/invoice_review/invoice_review_app_bar.dart

import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class InvoiceReviewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const InvoiceReviewAppBar({
    super.key,
    required this.title,
    required this.showShareAction,
    required this.isSharing,
    required this.onShare,
  });

  final String title;
  final bool showShareAction;
  final bool isSharing;
  final VoidCallback onShare;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
      ),
      title: Text(
        title,
        style: AppTextStyle.interBold20.copyWith(color: AppColors.dark),
      ),
      actions: [
        if (showShareAction)
          isSharing
              ? const Padding(
                  padding: EdgeInsets.all(12),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primary,
                    ),
                  ),
                )
              : IconButton(
                  onPressed: onShare,
                  icon: const Icon(
                    Icons.share_outlined,
                    color: AppColors.primary,
                  ),
                ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, color: AppColors.navBorder),
      ),
    );
  }
}