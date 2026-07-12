// lib/features/customers/presentation/widgets/add_customer_page/custom_labeled_text_filed.dart

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class CustomLabeledTextField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final bool showRequired;

  const CustomLabeledTextField({
    super.key,
    required this.label,
    this.focusNode,
    required this.hint,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.showRequired = true,
  });

  @override
  State<CustomLabeledTextField> createState() => _CustomLabeledTextFieldState();
}

class _CustomLabeledTextFieldState extends State<CustomLabeledTextField> {
  late FocusNode _focusNode;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _removeOverlay();
    _focusNode.removeListener(_onFocusChanged);
    // Only dispose if WE created it
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  // ── Check if this keyboard needs a Done button ──────────────────────────
  bool get _needsDoneButton {
    if (!Platform.isIOS) return false;

    final type = widget.keyboardType;
    return type == TextInputType.number ||
        type == TextInputType.phone ||
        type == const TextInputType.numberWithOptions() ||
        type == const TextInputType.numberWithOptions(decimal: true) ||
        type == const TextInputType.numberWithOptions(signed: true) ||
        type == const TextInputType.numberWithOptions(decimal: true, signed: true);
  }

  // ── Show/hide toolbar on focus change ───────────────────────────────────
  void _onFocusChanged() {
    if (_focusNode.hasFocus && _needsDoneButton) {
      _showOverlay();
    } else {
      _removeOverlay();
    }
  }

  void _showOverlay() {
    _removeOverlay();

    _overlayEntry = OverlayEntry(
      builder: (context) {
        final bottom = MediaQuery.of(context).viewInsets.bottom;
        return Positioned(
          bottom: bottom,
          left: 0,
          right: 0,
          child: Material(
            color: Colors.transparent,
            child: Container(
              height: 44,
              color: const Color(0xFFD1D5DB),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    onPressed: () => _focusNode.unfocus(),
                    child: Text(
                      'done'.tr(),
                      style: const TextStyle(
                        color: Color(0xFF007AFF),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry?.dispose();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Label ────────────────────────────────────────────────────────
        Row(
          children: [
            Text(
              widget.label.tr(),
              style: AppTextStyle.rubikSemiBold16
                  .copyWith(color: AppColors.dark),
            ),
            if (widget.showRequired) ...[
              const SizedBox(width: 4),
              Text(
                '*',
                style: AppTextStyle.rubikBold16
                    .copyWith(color: AppColors.newRed),
              ),
            ],
          ],
        ),

        const SizedBox(height: 8),

        // ── Text Field ───────────────────────────────────────────────────
        TextFormField(
          onChanged: (value) => widget.onChanged?.call(value),
          focusNode: _focusNode,
          cursorColor: AppColors.primary,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textInputAction: _needsDoneButton
              ? TextInputAction.unspecified  // iOS numeric → use overlay
              : TextInputAction.done,        // text keyboard → native done
          decoration: InputDecoration(
            hintText: widget.hint.tr(),
            hintStyle: AppTextStyle.rubikRegular16
                .copyWith(color: AppColors.textSecondary),
            filled: true,
            fillColor: AppColors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.navBorder),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.navBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}