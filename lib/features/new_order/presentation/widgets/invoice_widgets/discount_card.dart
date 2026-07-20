import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/features/new_order/presentation/controller/new_order_state.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class DiscountCard extends StatefulWidget {
  const DiscountCard({
    super.key,
    this.currentType,
    this.currentValue,
    required this.onApply,
    required this.onRemove,
  });

  final DiscountType? currentType;
  final double? currentValue;
  final void Function(DiscountType type, double value) onApply;
  final VoidCallback onRemove;

  @override
  State<DiscountCard> createState() => _DiscountCardState();
}

class _DiscountCardState extends State<DiscountCard> {
  bool _isExpanded = false;
  bool _isEditing = false;
  late DiscountType _selectedType;
  final TextEditingController _valueController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String? _errorText;

  bool get _hasDiscount =>
      widget.currentType != null &&
      widget.currentValue != null &&
      widget.currentValue! > 0;

  @override
  void initState() {
    super.initState();
    _selectedType = widget.currentType ?? DiscountType.percentage;
    if (_hasDiscount) {
      _valueController.text = widget.currentValue!.toStringAsFixed(
        widget.currentValue! % 1 == 0 ? 0 : 2,
      );
    }
  }

  @override
  void didUpdateWidget(covariant DiscountCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentType != oldWidget.currentType ||
        widget.currentValue != oldWidget.currentValue) {
      _selectedType = widget.currentType ?? DiscountType.percentage;
      if (_hasDiscount && !_isEditing) {
        _valueController.text = widget.currentValue!.toStringAsFixed(
          widget.currentValue! % 1 == 0 ? 0 : 2,
        );
      }
    }
  }

  @override
  void dispose() {
    _valueController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onApply() {
    final value = double.tryParse(_valueController.text.trim());
    if (value == null || value <= 0) {
      setState(() => _errorText = 'enter_valid_value'.tr());
      return;
    }
    if (_selectedType == DiscountType.percentage && value > 100) {
      setState(() => _errorText = 'percentage_max_100'.tr());
      return;
    }
    setState(() {
      _errorText = null;
      _isEditing = false;
      _isExpanded = false;
    });
    _focusNode.unfocus();
    widget.onApply(_selectedType, value);
  }

  void _onRemove() {
    setState(() {
      _isEditing = false;
      _isExpanded = false;
      _valueController.clear();
      _errorText = null;
    });
    widget.onRemove();
  }

  void _startEditing() {
    setState(() {
      _isExpanded = true;
      _isEditing = true;
      _selectedType = widget.currentType ?? DiscountType.percentage;
      if (_hasDiscount) {
        _valueController.text = widget.currentValue!.toStringAsFixed(
          widget.currentValue! % 1 == 0 ? 0 : 2,
        );
      }
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _hasDiscount ? AppColors.primary : AppColors.grayBorder,
          width: _hasDiscount ? 1.5 : 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Header / Collapsed View ──
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              if (_hasDiscount && !_isExpanded) {
                setState(() => _isExpanded = !_isExpanded);
              } else if (!_hasDiscount) {
                setState(() => _isExpanded = !_isExpanded);
                if (_isExpanded) {
                  Future.delayed(const Duration(milliseconds: 200), () {
                    _focusNode.requestFocus();
                  });
                }
              } else {
                setState(() => _isExpanded = !_isExpanded);
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Icon(
                    _hasDiscount ? Icons.discount : Icons.add_circle_outline,
                    color: _hasDiscount
                        ? AppColors.primary
                        : AppColors.textSecondary,
                    size: 22,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _hasDiscount
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'discount'.tr(),
                                style: AppTextStyle.interSemiBold14.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                _discountSummaryText(),
                                style: AppTextStyle.interRegular12.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            'add_discount'.tr(),
                            style: AppTextStyle.interSemiBold14.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                  ),
                  if (_hasDiscount && !_isExpanded) ...[
                    GestureDetector(
                      onTap: _startEditing,
                      child: Icon(
                        Icons.edit_outlined,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: _onRemove,
                      child: Icon(
                        Icons.close,
                        color: AppColors.errorRed,
                        size: 20,
                      ),
                    ),
                  ] else
                    AnimatedRotation(
                      turns: _isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.textSecondary,
                      ),
                    ),
                ],
              ),
            ),
          ),

          // ── Expanded Content ──
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(height: 1),
                  const SizedBox(height: 14),

                  // ── Discount Type Toggle ──
                  Text(
                    'discount_type'.tr(),
                    style: AppTextStyle.interSemiBold12.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _TypeChip(
                        label: 'percentage'.tr(),
                        icon: Icons.percent,
                        isSelected: _selectedType == DiscountType.percentage,
                        onTap: () {
                          setState(() {
                            _selectedType = DiscountType.percentage;
                            _errorText = null;
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      _TypeChip(
                        label: 'amount'.tr(),
                        icon: Icons.attach_money,
                        isSelected: _selectedType == DiscountType.amount,
                        onTap: () {
                          setState(() {
                            _selectedType = DiscountType.amount;
                            _errorText = null;
                          });
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // ── Value Input ──
                  TextField(
                    controller: _valueController,
                    focusNode: _focusNode,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    style: AppTextStyle.interRegular14.copyWith(
                      color: AppColors.textPrimary,
                    ),
                    decoration: InputDecoration(
                      hintText: _selectedType == DiscountType.percentage
                          ? 'enter_percentage'.tr()
                          : 'enter_amount'.tr(),
                      hintStyle: AppTextStyle.interRegular14.copyWith(
                        color: AppColors.grayBorder,
                      ),
                      errorText: _errorText,
                      suffixText: _selectedType == DiscountType.percentage
                          ? '%'
                          : 'QAR',
                      suffixStyle: AppTextStyle.interSemiBold14.copyWith(
                        color: AppColors.primary,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.grayBorder),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.grayBorder),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppColors.primary, width: 1.5),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.errorRed),
                      ),
                    ),
                    onChanged: (_) {
                      if (_errorText != null) {
                        setState(() => _errorText = null);
                      }
                    },
                  ),

                  const SizedBox(height: 14),

                  // ── Action Buttons using CustomButtonWidget ──
                  Row(
                    children: [
                      // ── Cancel Button (outlined) ──
                      Expanded(
                        child: CustomButtonWidget(
                          text: 'cancel',
                          isFiled: false,
                          height: 44,
                          width: double.infinity,
                          radius: 10,
                          backgroundColor: AppColors.white,
                          color: AppColors.grayBorder,
                          style: AppTextStyle.interSemiBold14.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          onTap: () {
                            setState(() {
                              _isExpanded = false;
                              _isEditing = false;
                              _errorText = null;
                              if (!_hasDiscount) _valueController.clear();
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),

                      // ── Apply / Update Button (filled) ──
                      Expanded(
                        child: CustomButtonWidget(
                          text: _hasDiscount ? 'update' : 'apply',
                          isFiled: true,
                          height: 44,
                          width: double.infinity,
                          radius: 10,
                          backgroundColor: AppColors.primary,
                          color: AppColors.white,
                          style: AppTextStyle.interSemiBold14.copyWith(
                            color: AppColors.white,
                          ),
                          onTap: _onApply,
                        ),
                      ),

                      // ── Delete Button (only when discount exists) ──
                      if (_hasDiscount) ...[
                        const SizedBox(width: 10),
                        CustomButtonWidget(
                          text: '',
                          isFiled: false,
                          height: 44,
                          width: 44,
                          radius: 10,
                          backgroundColor: AppColors.white,
                          color: AppColors.errorRed,
                          child: Icon(
                            Icons.delete_outline,
                            color: AppColors.errorRed,
                            size: 20,
                          ),
                          onTap: _onRemove,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _discountSummaryText() {
    if (!_hasDiscount) return '';
    if (widget.currentType == DiscountType.percentage) {
      final formatted = widget.currentValue! % 1 == 0
          ? widget.currentValue!.toInt().toString()
          : widget.currentValue!.toStringAsFixed(2);
      return '$formatted%';
    } else {
      final formatted = widget.currentValue! % 1 == 0
          ? widget.currentValue!.toInt().toString()
          : widget.currentValue!.toStringAsFixed(2);
      return '$formatted QAR';
    }
  }
}

class _TypeChip extends StatelessWidget {
  const _TypeChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withOpacity(0.1)
                : AppColors.background,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.grayBorder,
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: AppTextStyle.interSemiBold12.copyWith(
                  color:
                      isSelected ? AppColors.primary : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}