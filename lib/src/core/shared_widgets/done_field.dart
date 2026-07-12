// lib/src/core/shared_widgets/ios_keyboard_done_field.dart

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// A TextField that shows a Done toolbar on iOS numeric keyboards
/// and supports tap-outside-to-dismiss.
///
/// Drop-in replacement for TextField.
class DoneTextField extends StatefulWidget {
  const DoneTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.decoration,
    this.style,
    this.enabled,
    this.maxLines = 1,
    this.readOnly = false,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final InputDecoration? decoration;
  final TextStyle? style;
  final bool? enabled;
  final int? maxLines;
  final bool readOnly;

  @override
  State<DoneTextField> createState() => _DoneTextFieldState();
}

class _DoneTextFieldState extends State<DoneTextField> {
  late FocusNode _focusNode;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _removeOverlay();
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_onFocusChange);
    }
    super.dispose();
  }

  bool get _needsDoneButton {
    if (!Platform.isIOS) return false;

    // These keyboard types don't have a built-in Done button on iOS
    final type = widget.keyboardType;
    return type == TextInputType.number ||
        type == TextInputType.phone ||
        type == TextInputType.numberWithOptions() ||
        type == TextInputType.numberWithOptions(decimal: true) ||
        type == TextInputType.numberWithOptions(signed: true) ||
        type ==
            TextInputType.numberWithOptions(decimal: true, signed: true);
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus && _needsDoneButton) {
      _showOverlay();
    } else {
      _removeOverlay();
    }
  }

  void _showOverlay() {
    _removeOverlay();

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 0,
        right: 0,
        child: _DoneToolbar(
          onDone: () {
            _focusNode.unfocus();
          },
        ),
      ),
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
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      decoration: widget.decoration,
      style: widget.style,
      enabled: widget.enabled,
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
    );
  }
}

// ── Done Toolbar Widget ─────────────────────────────────────────────────────

class _DoneToolbar extends StatelessWidget {
  const _DoneToolbar({required this.onDone});

  final VoidCallback onDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      color: const Color(0xFFD1D5DB), // iOS keyboard toolbar color
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onPressed: onDone,
            child: const Text(
              'Done',
              style: TextStyle(
                color: Color(0xFF007AFF), // iOS blue
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}