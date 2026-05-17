import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/features/order/presentation/controller/order_controller.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class InvoicePaymentBottomSheet extends StatefulWidget {
  final InvoiceModel invoice;
  final double outstandingBalance;
  const InvoicePaymentBottomSheet({
    super.key,
    required this.invoice,
    required this.outstandingBalance,
  });

  @override
  State<InvoicePaymentBottomSheet> createState() =>
      _InvoicePaymentBottomSheetState();
}

class _InvoicePaymentBottomSheetState extends State<InvoicePaymentBottomSheet> {
  final TextEditingController _amountController = TextEditingController();
  String _selectedMethod = 'cash';

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.sheetBarrier,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildSummaryCards(),
                  const SizedBox(height: 22),
                  _buildAmountInput(),
                  const SizedBox(height: 22),
                  _buildPaymentMethodSelector(),
                  const SizedBox(height: 22),
                ],
              ),
            ),
          ),
          _buildActionButton(widget.invoice.invoiceId, _amountController.text),
          const SizedBox(height: 34), // Home indicator space
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'invoice_payment'.tr(),
                style:
                    AppTextStyle.rubikBold20.copyWith(color: AppColors.black),
              ),
              6.verticalSpace,
              Text(
                '${'invoice'.tr()} ${widget.invoice.invoiceId}',
                style: AppTextStyle.rubikRegular16.copyWith(
                  color: AppColors.gray,
                  // textTransform: TextCapitalization.words.toString() == 'words'
                  //     ? null
                  //     : null,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsetsDirectional.only(
                bottom: 20,
              ),
              child: const Icon(Icons.close, size: 30, color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCards() {
    return Row(
      children: [
        Expanded(
          child: _buildSummaryCard(
            label: 'invoice_amount'.tr(),
            value: widget.invoice.grandTotal.toCurrency(),
            valueColor: AppColors.primary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildSummaryCard(
            label: 'out_balance'.tr(),
            value: widget.outstandingBalance.toCurrency(),
            valueColor: AppColors.errorRed,
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard({
    required String label,
    required String value,
    required Color valueColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 18),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.methodSelectorBorder),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: AppTextStyle.rubikRegular16.copyWith(color: AppColors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: AppTextStyle.rubikBold18.copyWith(color: valueColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAmountInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'payment_amount'.tr(),
          style: AppTextStyle.interSemiBold16
              .copyWith(color: AppColors.textHeading),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          onChanged: (value) => setState(() {}),
          decoration: InputDecoration(
            hintText: 'enter_payment_amount'.tr(),
            hintStyle:
                AppTextStyle.rubikRegular16.copyWith(color: AppColors.grey),
            filled: true,
            fillColor: AppColors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: AppColors.methodSelectorBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFFF2E1E3)
                    .withOpacity(_amountController.text.isEmpty ? 1 : 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.info_outline,
                  size: 14, color: AppColors.errorRed),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'payment_applied_only_to_invoice'.tr(),
                style: AppTextStyle.rubikRegular12.copyWith(
                  fontSize: 11,
                  color: AppColors.infoText,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentMethodSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'payment_method'.tr(),
          style: AppTextStyle.interSemiBold16
              .copyWith(color: AppColors.textHeading),
        ),
        14.verticalSpace,
        Container(
          // height: 85,
          // padding: EdgeInsetsDirectional.symmetric(vertical: 25),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.methodSelectorBorder, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: _buildMethodButton(
                  id: 'cash',
                  label: 'CASH',
                  icon: Assets.icons.invoicePayIc.svg(
                    colorFilter: ColorFilter.mode(
                      _selectedMethod == 'cash'
                          ? AppColors.white
                          : AppColors.infoText,
                      BlendMode.srcIn,
                    ),
                  ),
                  isSelected: _selectedMethod == 'cash',
                  isFirst: true,
                ),
              ),
              Expanded(
                child: _buildMethodButton(
                  id: 'card',
                  label: 'CARD',
                  icon: Icon(
                    Icons.credit_card,
                    color: _selectedMethod == 'card'
                        ? AppColors.white
                        : AppColors.infoText,
                  ),
                  isSelected: _selectedMethod == 'card',
                  isFirst: false,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMethodButton({
    required String id,
    required String label,
    required Widget icon,
    required bool isSelected,
    required bool isFirst,
  }) {
    return GestureDetector(
      onTap: () => setState(() => _selectedMethod = id),
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(vertical: 30),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : (isFirst ? AppColors.darkMedGrey : AppColors.white),
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

  Widget _buildActionButton(String invoiceId, String amount) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(orderControllerProvider).value!;
        final bool hasAmount = _amountController.text.isNotEmpty;
        final bool isLoading = state.isPaying;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 22),
          width: double.infinity,
          color: const Color(0x80F2F4F7),
          child: CustomButtonWidget(
            text: 'confirm_payment',

            /// 🔥 disable when loading or no amount
            onTap: (hasAmount && !isLoading)
                ? () async {
                    final success = await ref
                        .read(orderControllerProvider.notifier)
                        .createPayment(
                            invoiceId: invoiceId,
                            amount: amount,
                            paymentMethod: _selectedMethod);

                    if (!context.mounted) return;

                    if (success) {
                      Navigator.of(context).pop();
                      context.push(AppRoutes.paymentSuccessPage);
                    }
                  }
                : null,

            isFiled: true,
            backgroundColor: (hasAmount && !isLoading)
                ? AppColors.primary
                : const Color(0xFFA0A0A0),

            height: 48,
            width: double.infinity,
            radius: 12,

            /// 🔥 LOADING UI
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'confirm_payment'.tr(),
                        style: AppTextStyle.rubikBold16
                            .copyWith(color: AppColors.white),
                      ),
                      const SizedBox(width: 12),
                      const Icon(
                        Icons.check_circle_outline,
                        color: AppColors.white,
                        size: 14,
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
