import 'package:flutter/material.dart';
import 'package:sabaa/src/core/shared_widgets/app_toast.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class QuantityStepper extends StatefulWidget {
  const QuantityStepper({
    super.key,
    required this.quantity,
    required this.onDecrement,
    required this.onIncrement,
    required this.onManualChange,
    required this.maxStock,
  });

  final int quantity;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  final Function(int) onManualChange;
  final int maxStock;

  @override
  State<QuantityStepper> createState() => _QuantityStepperState();
}

class _QuantityStepperState extends State<QuantityStepper> {
  late TextEditingController controller;
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    controller = TextEditingController(text: widget.quantity.toString());
    super.initState();
  }

  @override
  void didUpdateWidget(covariant QuantityStepper oldWidget) {
    if (oldWidget.quantity != widget.quantity) {
      controller.text = widget.quantity.toString();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
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
            onTap: widget.onDecrement,
            plus: false,
          ),
          // SizedBox(
          //   width: 48,
          //   child: Center(
          //     child: Text(
          //       '$quantity',
          //       style: AppTextStyle.interSemiBold14.copyWith(
          //         color: AppColors.textHeading,
          //         fontWeight: FontWeight.w700,
          //       ),
          //     ),
          //   ),
          // ),
    
          SizedBox(
            width: 50,
            height: 45,
            child: _QuantityInputField(
              controller: controller,
              maxStock: widget.maxStock,
              myFocusNode: myFocusNode,
              onChanged: (value) {
                final parsed = int.tryParse(value) ?? 0;
    
                if (parsed > widget.maxStock) {
                  AppToast.errorToast(
                      "The limit of stock is ${widget.maxStock}");
                  controller.text = widget.maxStock.toString();
                  widget.onManualChange(widget.maxStock);
                } else {
                  widget.onManualChange(parsed);
                }
              },
            ),
          ),
    
          _StepButton(
            icon: Icons.add,
            onTap: widget.onIncrement,
            plus: true,
          ),
        ],
      ),
    );
  }
}

class _StepButton extends StatelessWidget {
  const _StepButton(
      {required this.icon, required this.onTap, required this.plus});

  final IconData icon;
  final VoidCallback onTap;
  final bool plus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipOval(
        child: Container(
          // padding: EdgeInsets.all(0),
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: plus ? AppColors.primary : AppColors.white,
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
              size: 16, color: plus ? AppColors.white : AppColors.primary),
        ),
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
    return  KeyboardActions(   // 👈 wrap WHOLE card
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
