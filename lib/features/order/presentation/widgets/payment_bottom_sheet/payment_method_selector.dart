import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/order/presentation/controller/order_controller.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class PaymentMethodSelector extends ConsumerWidget {
  const PaymentMethodSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMethod = ref.watch(
        orderControllerProvider.select((val) => val.value!.paymentMethod));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'payment_method'.tr(),
          style: AppTextStyle.rubikSemiBold16
              .copyWith(color: AppColors.textHeading),
        ),
        const SizedBox(height: 12),
        Container(
          height: 85,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.methodSelectorBorder, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: _MethodButton(
                  id: 'cash',
                  label: 'CASH',
                  icon: Assets.icons.invoicePayIc.svg(
                    colorFilter: ColorFilter.mode(
                      selectedMethod == 'cash'
                          ? AppColors.white
                          : AppColors.infoText,
                      BlendMode.srcIn,
                    ),
                  ),
                  isSelected: selectedMethod == 'cash',
                  isFirst: true,
                ),
              ),
              Expanded(
                child: _MethodButton(
                  id: 'pos',
                  label: 'POS',
                  icon: Icon(
                    Icons.credit_card,
                    color: selectedMethod == 'pos'
                        ? AppColors.white
                        : AppColors.infoText,
                  ),
                  isSelected: selectedMethod == 'pos',
                  isFirst: false,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MethodButton extends ConsumerWidget {
  final String id;
  final String label;
  final Widget icon;
  final bool isSelected;
  final bool isFirst;

  const _MethodButton({
    required this.id,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.isFirst,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref
          .read(orderControllerProvider.notifier)
          .changeSelectedPaymentMethod(id),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : (isFirst ? const Color(0x1AA0A0A0) : AppColors.white),
          borderRadius: isFirst
              ? const BorderRadius.only(
                  topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
              : const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
          border: isFirst
              ? const Border(right: BorderSide(color: Color(0x1A003F87)))
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 22, height: 16, child: icon),
            const SizedBox(height: 8),
            Text(
              label.tr(),
              style: AppTextStyle.rubikBold12.copyWith(
                fontSize: 11,
                color: isSelected ? AppColors.white : AppColors.infoText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
