import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class KeyboardDoneWrapper extends StatelessWidget {
  const KeyboardDoneWrapper({
    super.key,
    required this.child,
    required this.focusNodes,
  });

  final Widget child;
  final List<FocusNode> focusNodes;

  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
      config: KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
        nextFocus: true,
        actions: focusNodes
            .map(
              (node) => KeyboardActionsItem(
                focusNode: node,
                displayDoneButton: true,
              ),
            )
            .toList(),
      ),
      child: child,
    );
  }
}

// lib/src/core/shared_widgets/ios_done_keyboard_wrapper.dart

/// Wraps any scrollable body and adds:
/// 1. iOS Done button toolbar above numeric keyboards
/// 2. Tap-outside-to-dismiss keyboard
///
/// Usage:
/// ```dart
/// IosDoneKeyboardWrapper(
///   focusNodes: [_priceFocus, _qtyFocus, _feeFocus],
///   child: SingleChildScrollView(
///     child: Column(children: [ ... ]),
///   ),
/// )
/// ```
class IosDoneKeyboardWrapper extends StatelessWidget {
  const IosDoneKeyboardWrapper({
    super.key,
    required this.focusNodes,
    required this.child,
  });

  final List<FocusNode> focusNodes;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 👇 Tap anywhere to unfocus
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: child,
    );
  }
}