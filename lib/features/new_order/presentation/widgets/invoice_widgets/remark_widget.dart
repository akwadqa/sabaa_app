// lib/features/new_order/presentation/widgets/invoice_widgets/remark_widget.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/new_order/presentation/controller/new_order_controller.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class RemarkWidget extends ConsumerWidget {
  const RemarkWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remark = ref.watch(
      newOrderControllerProvider.select((val) => val.value?.remark),
    );

    final hasRemark = remark != null && remark.isNotEmpty;

    return GestureDetector(
      onTap: () => _showRemarkDialog(context, ref, remark),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: hasRemark ? AppColors.primary : AppColors.navBorder,
            width: hasRemark ? 0.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // ── Left: icon + label/preview ─────────────────────────────
            Expanded(
              child: Row(
                spacing: 10,
                children: [
                  Icon(
                    hasRemark
                        ? Icons.notes_rounded
                        : Icons.add_comment_outlined,
                    color: hasRemark ? AppColors.primary : AppColors.blueGrey,
                    size: 20,
                  ),
                  Expanded(
                    child: hasRemark
                        ? Text(
                            remark,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.interRegular14.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          )
                        : Text(
                            'add_remark'.tr(),
                            style: AppTextStyle.interRegular14.copyWith(
                              color: AppColors.blueGrey,
                            ),
                          ),
                  ),
                ],
              ),
            ),

            // ── Right: + or edit icon ───────────────────────────────────
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: hasRemark
                    ? AppColors.primary.withOpacity(0.1)
                    : AppColors.primary,
              ),
              child: Icon(
                hasRemark ? Icons.edit_outlined : Icons.add,
                color: hasRemark ? AppColors.primary : AppColors.white,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRemarkDialog(
    BuildContext context,
    WidgetRef ref,
    String? currentRemark,
  ) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) => _RemarkDialog(
        currentRemark: currentRemark,
        onSave: (value) {
          ref.read(newOrderControllerProvider.notifier).editRemark(value);
        },
        onClear: () {
          ref.read(newOrderControllerProvider.notifier).editRemark(null);
        },
      ),
    );
  }
}

// ── Remark Dialog — StatefulWidget so it owns the controller lifecycle ────────

class _RemarkDialog extends StatefulWidget {
  const _RemarkDialog({
    required this.currentRemark,
    required this.onSave,
    required this.onClear,
  });

  final String? currentRemark;
  final ValueChanged<String> onSave;
  final VoidCallback onClear;

  @override
  State<_RemarkDialog> createState() => _RemarkDialogState();
}

class _RemarkDialogState extends State<_RemarkDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // ✅ Controller created here — owned by this StatefulWidget
    _controller = TextEditingController(text: widget.currentRemark ?? '');
  }

  @override
  void dispose() {
    // ✅ Disposed here — only when dialog widget is removed from tree
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasExistingRemark =
        widget.currentRemark != null && widget.currentRemark!.isNotEmpty;

    return Dialog(
      backgroundColor: AppColors.white,
      // ✅ Moves dialog up when keyboard appears
      insetPadding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 40,
        // bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ────────────────────────────────────────────────
            Row(
              children: [
                Expanded(
                  child: Text(
                    'add_remark'.tr(),
                    style: AppTextStyle.interBold18
                        .copyWith(color: AppColors.dark),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.close,
                    color: AppColors.blueGrey,
                    size: 22,
                  ),
                ),
              ],
            ),
      
            const SizedBox(height: 16),
      
            // ── Multi-line Text Field ──────────────────────────────────
            TextFormField(
              controller: _controller,
              maxLines: 5,
              minLines: 3,
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              autofocus: true,
              style: AppTextStyle.interRegular14.copyWith(
                color: AppColors.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: 'remark_hint'.tr(),
                hintStyle: AppTextStyle.interRegular14.copyWith(
                  color: AppColors.blueGrey,
                ),
                filled: true,
                fillColor: AppColors.background,
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.navBorder),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.navBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
              ),
            ),
      
            const SizedBox(height: 20),
      
            // ── Actions ───────────────────────────────────────────────
            Row(
              spacing: 12,
              children: [
                // Clear (only if existing remark)
                if (hasExistingRemark)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        widget.onClear();
                        Navigator.of(context).pop();
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.errorRed,
                        side: const BorderSide(color: AppColors.errorRed),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'clear'.tr(),
                        style: AppTextStyle.interSemiBold14.copyWith(
                          color: AppColors.errorRed,
                        ),
                      ),
                    ),
                  ),
      
                // Done
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onSave(_controller.text);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'done'.tr(),
                      style: AppTextStyle.interSemiBold14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}