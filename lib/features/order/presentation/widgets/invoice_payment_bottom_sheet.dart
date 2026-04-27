import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class InvoicePaymentBottomSheet extends StatefulWidget {
  final String invoiceId;
  final String amount;
  final String outstandingBalance;

  const InvoicePaymentBottomSheet({
    super.key,
    required this.invoiceId,
    required this.amount,
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
        color: Color(0xFFF7F9FC),
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
          _buildActionButton(),
          const SizedBox(height: 34), // Home indicator space
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 22, 32, 22),
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
              const SizedBox(height: 4),
              Text(
                'invoice'.tr() + ' ${widget.invoiceId}',
                style: AppTextStyle.rubikRegular16.copyWith(
                  color: AppColors.blueGrey,
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
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.close, size: 24, color: AppColors.black),
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
            value: widget.amount,
            valueColor: AppColors.primary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildSummaryCard(
            label: 'out_balance'.tr(),
            value: widget.outstandingBalance,
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
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 18),
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
          style: AppTextStyle.rubikSemiBold16
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
                  id: 'pos',
                  label: 'POS',
                  icon: Icon(
                    Icons.credit_card,
                    color: _selectedMethod == 'pos'
                        ? AppColors.white
                        : AppColors.infoText,
                  ),
                  isSelected: _selectedMethod == 'pos',
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

  Widget _buildActionButton() {
    final bool hasAmount = _amountController.text.isNotEmpty;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 22),
      width: double.infinity,
      color: const Color(0x80F2F4F7),
      child: CustomButtonWidget(
        text: 'confirm_payment',
        onTap: hasAmount
            ? () {
                // TODO: Implement payment logic
                Navigator.pop(context);
              }
            : null,
        isFiled: true,
        backgroundColor:
            hasAmount ? AppColors.primary : const Color(0xFFA0A0A0),
        height: 48,
        width: double.infinity,
        radius: 12,
        style: AppTextStyle.rubikBold16.copyWith(color: AppColors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'confirm_payment'.tr(),
              style: AppTextStyle.rubikBold16.copyWith(color: AppColors.white),
            ),
            const SizedBox(width: 12),
            const Icon(Icons.check_circle_outline,
                color: AppColors.white, size: 14),
          ],
        ),
      ),
    );
  }
}
