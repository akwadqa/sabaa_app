// features/new_order/presentation/widgets/order_widgets/free_item_toggle.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class FreeItemToggle extends StatefulWidget {
  final int totalQuantity;
  final int freeQuantity;
  final ValueChanged<int> onFreeQuantityChanged;

  const FreeItemToggle({
    super.key,
    required this.totalQuantity,
    required this.freeQuantity,
    required this.onFreeQuantityChanged,
  });

  @override
  State<FreeItemToggle> createState() => _FreeItemToggleState();
}

class _FreeItemToggleState extends State<FreeItemToggle> {
  late TextEditingController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.freeQuantity > 0;
    _controller = TextEditingController(
      text: widget.freeQuantity > 0 ? widget.freeQuantity.toString() : '',
    );
  }

  @override
  void didUpdateWidget(FreeItemToggle oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Sync if parent changes free quantity
    if (oldWidget.freeQuantity != widget.freeQuantity) {
      _controller.text =
          widget.freeQuantity > 0 ? widget.freeQuantity.toString() : '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onCheckboxChanged(bool? checked) {
    final isChecked = checked ?? false;
    setState(() => _isExpanded = isChecked);

    if (!isChecked) {
      _controller.clear();
      widget.onFreeQuantityChanged(0);
    } else {
      // Default: 1 free item
      final defaultFree = 1.clamp(0, widget.totalQuantity);
      _controller.text = defaultFree.toString();
      widget.onFreeQuantityChanged(defaultFree);
    }
  }

  void _onTextChanged(String value) {
    final parsed = int.tryParse(value) ?? 0;
    final clamped = parsed.clamp(0, widget.totalQuantity);

    // If user typed more than max, correct it silently
    if (parsed != clamped) {
      _controller.text = clamped.toString();
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    }

    widget.onFreeQuantityChanged(clamped);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Checkbox row ──
        Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                value: _isExpanded,
                onChanged: _onCheckboxChanged,
                activeColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'free_items'.tr(),
              style: AppTextStyle.interMedium14.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            if (_isExpanded) ...[
              const SizedBox(width: 4),
              Text(
                '(max: ${widget.totalQuantity})',
                style: AppTextStyle.interRegular12.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ],
        ),

        // ── Expandable input ──
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: _isExpanded
              ? Padding(
                  padding: const EdgeInsets.only(top: 8, left: 4),
                  child: Row(
                    children: [
                      // Decrement button
                      _QuantityButton(
                        icon: Icons.remove,
                        onTap: () {
                          final current =
                              int.tryParse(_controller.text) ?? 0;
                          if (current > 0) {
                            final next = current - 1;
                            _controller.text = next.toString();
                            widget.onFreeQuantityChanged(next);
                            if (next == 0) {
                              setState(() => _isExpanded = false);
                            }
                          }
                        },
                      ),
                      const SizedBox(width: 8),
                      // Input field
                      SizedBox(
                        width: 60,
                        height: 36,
                        child: TextField(
                          controller: _controller,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.interSemiBold14.copyWith(
                            color: AppColors.primary,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: AppColors.primary.withOpacity(0.4),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                color: AppColors.primary,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: AppColors.primary.withOpacity(0.3),
                              ),
                            ),
                          ),
                          onChanged: _onTextChanged,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Increment button
                      _QuantityButton(
                        icon: Icons.add,
                        onTap: () {
                          final current =
                              int.tryParse(_controller.text) ?? 0;
                          if (current < widget.totalQuantity) {
                            final next = current + 1;
                            _controller.text = next.toString();
                            widget.onFreeQuantityChanged(next);
                          }
                        },
                      ),
                      const SizedBox(width: 12),
                      // Free label badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.green.withOpacity(0.4),
                          ),
                        ),
                        child: Text(
                          'free'.tr(),
                          style: AppTextStyle.interSemiBold12.copyWith(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

// ── Small helper button ──────────────────────────────────────────────────────

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.primary.withOpacity(0.3)),
        ),
        child: Icon(icon, size: 16, color: AppColors.primary),
      ),
    );
  }
}