// credit_note_selection_dialog.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// import 'package:sabaa/features/order/domain/customer_details/customer_details_model.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

import '../../../domain/order_summary/credit_note_model.dart';

class CreditNoteSelectionDialog extends StatefulWidget {
  const CreditNoteSelectionDialog({
    super.key,
    required this.creditNotes,
    required this.onConfirm,
  });

  final List<CreditNoteModel> creditNotes;
  final ValueChanged<List<CreditNoteModel>> onConfirm;

  @override
  State<CreditNoteSelectionDialog> createState() =>
      _CreditNoteSelectionDialogState();
}

class _CreditNoteSelectionDialogState extends State<CreditNoteSelectionDialog> {
  final Set<String> _selectedIds = {};

  double get _selectedTotal => widget.creditNotes
      .where((cn) => _selectedIds.contains(cn.creditNoteId))
      .fold(0, (sum, cn) => sum + cn.outstandingAmount.toDouble());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Header ─────────────────────────────────────────
            Row(
              children: [
                const Icon(Icons.receipt_long_outlined,
                    color: AppColors.primary, size: 24),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'select_credit_notes'.tr(),
                    style: AppTextStyle.interBold18
                        .copyWith(color: AppColors.textPrimary),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.close_rounded,
                      color: AppColors.textSecondary, size: 24),
                ),
              ],
            ),

            const SizedBox(height: 16),
            const Divider(height: 1),
            const SizedBox(height: 8),

            // ── Credit Notes List ──────────────────────────────
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.45,
              ),
              child: widget.creditNotes.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        'no_credit_notes_available'.tr(),
                        style: AppTextStyle.interRegular14
                            .copyWith(color: AppColors.textSecondary),
                      ),
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      itemCount: widget.creditNotes.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (_, index) {
                        final cn = widget.creditNotes[index];
                        final isSelected =
                            _selectedIds.contains(cn.creditNoteId);

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                _selectedIds.remove(cn.creditNoteId);
                              } else {
                                _selectedIds.add(cn.creditNoteId);
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primary.withOpacity(0.06)
                                  : AppColors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primary.withOpacity(0.4)
                                    : AppColors.borderGrey,
                                width: isSelected ? 1.5 : 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                // ── Checkbox ────────────────────
                                SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: Checkbox(
                                    value: isSelected,
                                    onChanged: (v) {
                                      setState(() {
                                        if (v == true) {
                                          _selectedIds.add(cn.creditNoteId);
                                        } else {
                                          _selectedIds.remove(cn.creditNoteId);
                                        }
                                      });
                                    },
                                    activeColor: AppColors.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 12),

                                // ── Info ─────────────────────────
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cn.returnAgainst ?? cn.creditNoteId,
                                        style: AppTextStyle.interSemiBold12
                                            .copyWith(
                                          color: AppColors.textPrimary,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      if (cn.returnAgainst != null) ...[
                                        const SizedBox(height: 2),
                                        Text(
                                          cn.creditNoteId,
                                          style: AppTextStyle.interRegular10
                                              .copyWith(
                                            color: AppColors.textSecondary,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),

                                // ── Outstanding Amount ──────────
                                Text(
                                  cn.outstandingAmount.toDouble().toCurrency(),
                                  style:
                                      AppTextStyle.interSemiBold14.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),

            // ── Selected Total ─────────────────────────────────
            if (_selectedIds.isNotEmpty) ...[
              const SizedBox(height: 12),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${'selected'.tr()} (${_selectedIds.length})',
                      style: AppTextStyle.interSemiBold12
                          .copyWith(color: AppColors.primary),
                    ),
                    Text(
                      _selectedTotal.toCurrency(),
                      style: AppTextStyle.interBold18
                          .copyWith(color: AppColors.primary),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 16),

            // ── Confirm Button ─────────────────────────────────
            CustomButtonWidget(
              text: 'apply_credit_notes',
              onTap: _selectedIds.isEmpty
                  ? null
                  : () {
                      final selected = widget.creditNotes
                          .where((cn) =>
                              _selectedIds.contains(cn.creditNoteId))
                          .toList();
                      widget.onConfirm(selected);
                      Navigator.of(context).pop();
                    },
              isFiled: true,
              height: 48,
              width: double.infinity,
              backgroundColor: _selectedIds.isEmpty
                  ? AppColors.gray
                  : AppColors.primary,
              radius: 12,
            ),
          ],
        ),
      ),
    );
  }
}