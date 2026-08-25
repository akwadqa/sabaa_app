import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class SelectPeriodDialog extends StatefulWidget {
  const SelectPeriodDialog({super.key});

  @override
  State<SelectPeriodDialog> createState() => _SelectPeriodDialogState();
}

class _SelectPeriodDialogState extends State<SelectPeriodDialog> {
  DateTime? _fromDate;
  DateTime? _toDate;
  String? _error;

  Future<void> _pickDate({required bool isFrom}) async {
    final now = DateTime.now();
    final initial = isFrom
        ? (_fromDate ?? now)
        : (_toDate ?? _fromDate ?? now);

    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2020),
      lastDate: DateTime(now.year + 1),
    );

    if (picked == null) return;

    setState(() {
      _error = null;
      if (isFrom) {
        _fromDate = picked;
        if (_toDate != null && _toDate!.isBefore(_fromDate!)) {
          _toDate = null;
        }
      } else {
        _toDate = picked;
      }
    });
  }

  String _format(DateTime? d) {
    if (d == null) return 'select_date'.tr();
    return DateFormat('dd/MM/yyyy').format(d);
  }

  void _submit() {
    if (_fromDate == null || _toDate == null) {
      setState(() => _error = 'please_select_both_dates'.tr());
      return;
    }
    if (_toDate!.isBefore(_fromDate!)) {
      setState(() => _error = 'to_date_must_be_after_from'.tr());
      return;
    }

    Navigator.of(context).pop((from: _fromDate!, to: _toDate!));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 28),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'select_period'.tr(),
                    style: AppTextStyle.interBold18
                        .copyWith(color: AppColors.textPrimary),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: AppColors.textSecondary),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Text(
              'from_date'.tr(),
              style: AppTextStyle.interSemiBold14
                  .copyWith(color: AppColors.textPrimary),
            ),
            const SizedBox(height: 8),
            _DateField(
              label: _format(_fromDate),
              isPlaceholder: _fromDate == null,
              onTap: () => _pickDate(isFrom: true),
            ),

            const SizedBox(height: 16),

            Text(
              'to_date'.tr(),
              style: AppTextStyle.interSemiBold14
                  .copyWith(color: AppColors.textPrimary),
            ),
            const SizedBox(height: 8),
            _DateField(
              label: _format(_toDate),
              isPlaceholder: _toDate == null,
              onTap: () => _pickDate(isFrom: false),
            ),

            if (_error != null) ...[
              const SizedBox(height: 10),
              Text(
                _error!,
                style: AppTextStyle.interRegular12
                    .copyWith(color: AppColors.errorRed),
              ),
            ],

            const SizedBox(height: 22),

            CustomButtonWidget(
              text: 'view_reports',
              onTap: _submit,
              isFiled: true,
              height: 48,
              width: double.infinity,
              backgroundColor: AppColors.primary,
              radius: 12,
            ),
          ],
        ),
      ),
    );
  }
}

class _DateField extends StatelessWidget {
  const _DateField({
    required this.label,
    required this.isPlaceholder,
    required this.onTap,
  });

  final String label;
  final bool isPlaceholder;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderGrey),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: AppTextStyle.interRegular14.copyWith(
                  color: isPlaceholder
                      ? AppColors.textSecondary
                      : AppColors.textPrimary,
                ),
              ),
            ),
            Icon(
              Icons.calendar_today_outlined,
              size: 18,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}