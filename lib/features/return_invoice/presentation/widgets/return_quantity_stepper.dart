import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class ReturnQuantityStepper extends StatefulWidget {
  const ReturnQuantityStepper({
    super.key,
    required this.quantity,
    this.onDecrement,
    this.onIncrement,
    this.onManualChange,
    this.maxStock = 9999,
  });

  final int quantity;
  final VoidCallback? onDecrement;
  final VoidCallback? onIncrement;
  final Function(int)? onManualChange;
  final int maxStock;

  @override
  State<ReturnQuantityStepper> createState() => _ReturnQuantityStepperState();
}

class _ReturnQuantityStepperState extends State<ReturnQuantityStepper> {
  late TextEditingController _controller;
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.quantity.toString());
  }

  @override
  void didUpdateWidget(ReturnQuantityStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.quantity != widget.quantity) {
      _controller.text = widget.quantity.toString();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleManualInput(String value) {
    if (value.isEmpty) {
      _controller.text = '1';
      return;
    }

    final parsed = int.tryParse(value);
    if (parsed == null) {
      _controller.text = widget.quantity.toString();
      return;
    }

    if (parsed > widget.maxStock) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Cannot exceed available stock: ${widget.maxStock}'),
          backgroundColor: AppColors.accent,
          duration: const Duration(seconds: 2),
        ),
      );
      _controller.text = widget.maxStock.toString();
      widget.onManualChange?.call(widget.maxStock);
      return;
    }

    if (parsed < 1) {
      _controller.text = '1';
      widget.onManualChange?.call(1);
      return;
    }

    _controller.text = parsed.toString();
    widget.onManualChange?.call(parsed);
  }

  @override
  Widget build(BuildContext context) {
    final canDecrement = widget.onDecrement != null;
    final canIncrement = widget.onIncrement != null;

    return Container(
     padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.secondCard,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _StepButton(
            icon: Icons.remove,
            onTap: canDecrement ? widget.onDecrement : null,
            enabled: canDecrement,
            plus: false,
          ),
          SizedBox(
            width: 50,
            height: 45,
            child: _QuantityInputField(
              controller: _controller,
              maxStock: widget.maxStock,
              myFocusNode: myFocusNode,
              onChanged: _handleManualInput,
            ),
          ),
          _StepButton(
            icon: Icons.add,
            onTap: canIncrement ? widget.onIncrement : null,
            enabled: canIncrement,
            plus: true,

          ),
        ],
      ),
    );
  }
}

class _QuantityInputField extends StatelessWidget {
  const _QuantityInputField({
    required this.controller,
    required this.onChanged,
    required this.maxStock,
    required this.myFocusNode,
  });

  final TextEditingController controller;
  final Function(String) onChanged;
  final int maxStock;
  final FocusNode myFocusNode;

  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
      // 👈 wrap WHOLE card
      // tapOutsideToDismiss: true,

      config: KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
        actions: [
          KeyboardActionsItem(
            // displayActionBar: false,
            focusNode: myFocusNode,
            toolbarButtons: [
              (node) {
                return GestureDetector(
                  onTap: () => node.unfocus(),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Done",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }
            ],
            displayDoneButton: true,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        focusNode: myFocusNode,
        maxLength: 4,
        onChanged: onChanged,
        textInputAction: TextInputAction.done, // ✅ IMPORTANT
        onSubmitted: (_) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          counterText: '',
          hintText: "",
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          // contentPadding: const EdgeInsets.symmetric(vertical: 0),
          hintStyle: AppTextStyle.interRegular12.copyWith(
            color: AppColors.grey97,
          ),
        ),
        style: AppTextStyle.interSemiBold14.copyWith(
          color: AppColors.textHeading,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
class _StepButton extends StatelessWidget {
  const _StepButton(
      {required this.icon, required this.onTap, required this.plus,
    this.enabled = true,
      });

  final IconData icon;
  final VoidCallback? onTap;
  final bool plus;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: ClipOval(
        child: Container(
          // padding: EdgeInsets.all(0),
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: plus&enabled ? AppColors.primary : AppColors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: const [
              BoxShadow(
                color: AppColors.darkShadow,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Icon(icon,
              size: 16, color: enabled ?plus?AppColors.background: AppColors.textPrimary : Colors.grey[400]),
        ),
      ),
    );
  }
}

// class _StepButton extends StatelessWidget {
//   const _StepButton({
//     required this.icon,
//     this.onTap,
//     this.enabled = true,
//   });

//   final IconData icon;
//   final VoidCallback? onTap;
//   final bool enabled;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: enabled ? onTap : null,
//       child: Container(
//         width: 32,
//         height: 32,
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.circular(4),
//           boxShadow: const [
//             BoxShadow(
//               color: Color(0x0C000000),
//               blurRadius: 2,
//               offset: Offset(0, 1),
//             ),
//           ],
//         ),
//         child: Icon(
//           icon,
//           size: 16,
//           color: enabled ? AppColors.textPrimary : Colors.grey[400],
//         ),
//       ),
//     );
//   }
// }
