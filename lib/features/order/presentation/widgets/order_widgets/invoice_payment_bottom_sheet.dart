import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:sabaa/features/customers/domain/model/create_customer_response/create_customer_response.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/features/order/presentation/controller/order_controller.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/app_toast.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

import '../../../data/repository/order_repository.dart';
import '../../../domain/order_summary/credit_note_model.dart';
import '../credit_note/credit_note_selection_dialog.dart';

class InvoicePaymentBottomSheet extends StatefulWidget {
  final InvoiceModel invoice;
  final double outstandingBalance;
  final CustomerModel customer;

  const InvoicePaymentBottomSheet({
    super.key,
    required this.invoice,
    required this.outstandingBalance,
    required this.customer,
  });

  @override
  State<InvoicePaymentBottomSheet> createState() =>
      _InvoicePaymentBottomSheetState();
}

class _InvoicePaymentBottomSheetState extends State<InvoicePaymentBottomSheet> {
  final TextEditingController _amountController = TextEditingController();
  String _selectedMethod = 'cash';
  final FocusNode _amountFocusNode = FocusNode();
  bool _isLoadingCreditNotes = false;
  bool _isReconciling = false;
  List<CreditNoteModel> _selectedCreditNotes = [];
  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform:
          KeyboardActionsPlatform.IOS, // Enable specifically for iOS
      nextFocus: false, // Turn off if it's the only/last field
      actions: [
        KeyboardActionsItem(
          focusNode: _amountFocusNode,
          displayDoneButton: true,
          toolbarButtons: [
            (node) => GestureDetector(
                  onTap: () => node.unfocus(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Done",
                      style: AppTextStyle.interSemiBold14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
          ],
          // toolbarButtons: [
          //   (node) {
          //     return GestureDetector(
          //       onTap: () => node.unfocus(), // Dismiss keyboard on tap
          //       child: const Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 16.0),
          //         child: Text(
          //           "Done",
          //           style: TextStyle(
          //             color: Colors.blue,
          //             fontWeight: FontWeight.bold,
          //             fontSize: 16,
          //           ),
          //         ),
          //       ),
          //     );
          //   }
          // ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    // _removeOverlay();
    // _amountFocusNode.removeListener(_onFocusChanged);
    _amountFocusNode.dispose();
    _amountController.dispose();
    super.dispose();
  }

  // void _onFocusChanged() {
  //   if (!Platform.isIOS) return;
  //   if (_amountFocusNode.hasFocus) {
  //     _showOverlay();
  //   } else {
  //     _removeOverlay();
  //   }
  // }

  // void _showOverlay() {
  //   _removeOverlay();
  //   _overlayEntry = OverlayEntry(
  //     builder: (context) => Positioned(
  //       bottom: MediaQuery.of(context).viewInsets.bottom,
  //       left: 0,
  //       right: 0,
  //       child: Material(
  //         color: Colors.transparent,
  //         child: Container(
  //           height: 44,
  //           color: const Color(0xFFD1D5DB),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               CupertinoButton(
  //                 padding: const EdgeInsets.symmetric(horizontal: 16),
  //                 onPressed: () => _amountFocusNode.unfocus(),
  //                 child: Text(
  //                   'done'.tr(),
  //                   style: const TextStyle(
  //                     color: Color(0xFF007AFF),
  //                     fontWeight: FontWeight.w600,
  //                     fontSize: 16,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  //   Overlay.of(context).insert(_overlayEntry!);
  // }

  // void _removeOverlay() {
  //   _overlayEntry?.remove();
  //   _overlayEntry?.dispose();
  //   _overlayEntry = null;
  // }
  // ✅ Credit note state

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.sheetBarrier,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        // padding: EdgeInsets.only(
        //   bottom: MediaQuery.of(context).viewInsets.bottom,
        // ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            Flexible(
              child: KeyboardActions(
                config: _buildConfig(context),
                // isDialog: true,          // 👈 KEY FIX for bottom sheets
                // tapOutsideBehavior: TapOutsideBehavior.translucentDismiss,
                disableScroll: true,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSummaryCards(),
                      const SizedBox(height: 22),
                      _buildAmountInput(),
                      const SizedBox(height: 22),
                      _buildPaymentMethodSelector(),
                      const SizedBox(height: 12),
                      // ✅ Credit Note Button
                      _buildCreditNoteSection(),

                      // const SizedBox(height: 22),
                    ],
                  ),
                ),
              ),
            ),
            _buildActionButton(
                widget.invoice.invoiceId, _amountController.text),
            const SizedBox(height: 20), // Home indicator space
          ],
        ),
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
            value: widget.invoice.outstandingAmount.toCurrency(),
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

  // In _InvoicePaymentBottomSheetState

  Widget _buildAmountInput() {
    final bool hasCreditNotes = _selectedCreditNotes.isNotEmpty;

    return Opacity(
      opacity: hasCreditNotes ? 0.4 : 1.0,
      child: IgnorePointer(
        ignoring: hasCreditNotes,
        child: Column(
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
              focusNode: _amountFocusNode,
              onChanged: (value) => setState(() {}),
              decoration: InputDecoration(
                hintText: hasCreditNotes
                    ? 'credit_note_applied'.tr()
                    : 'enter_payment_amount'.tr(),
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
                    hasCreditNotes
                        ? 'remove_credit_notes_to_pay_manually'.tr()
                        : 'payment_applied_only_to_invoice'.tr(),
                    style: AppTextStyle.rubikRegular12.copyWith(
                      fontSize: 11,
                      color: AppColors.infoText,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodSelector() {
    final bool hasCreditNotes = _selectedCreditNotes.isNotEmpty;

    return Opacity(
      opacity: hasCreditNotes ? 0.4 : 1.0,
      child: IgnorePointer(
        ignoring: hasCreditNotes,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'payment_method'.tr(),
              style: AppTextStyle.interSemiBold16
                  .copyWith(color: AppColors.textHeading),
            ),
            14.verticalSpace,
            Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: AppColors.methodSelectorBorder, width: 2),
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
        ),
      ),
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
      onTap: () {
        FocusScope.of(context).unfocus(); // 👈 also dismiss when picking method
        setState(() => _selectedMethod = id);
      },
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

  Widget _buildCreditNoteSection() {
    return Consumer(
      builder: (context, ref, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── "Use Credit Note" button ──────────────────────
            Align(
            alignment: AlignmentDirectional.centerStart,
              child: SizedBox(
                // width: double.infinity,
                child: TextButton.icon(
                  onPressed: _isLoadingCreditNotes
                      ? null
                      : () => _loadAndShowCreditNotes(ref),
                  icon: _isLoadingCreditNotes
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primary,
                          ),
                        )
                      : const Icon(Icons.receipt_long_outlined,
                          color: AppColors.primary, size: 20),
                  label: Text(
                    'use_credit_note'.tr(),
                    textAlign: TextAlign.start,
                    style: AppTextStyle.interSemiBold14.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ),

            // ── Selected credit notes list ────────────────────
            if (_selectedCreditNotes.isNotEmpty) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.15),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'selected_credit_notes'.tr(),
                          style: AppTextStyle.interSemiBold12
                              .copyWith(color: AppColors.primary),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() => _selectedCreditNotes = []);
                          },
                          child: Text(
                            'clear'.tr(),
                            style: AppTextStyle.interSemiBold12
                                .copyWith(color: AppColors.red),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...(_selectedCreditNotes.map((cn) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                cn.returnAgainst ?? cn.creditNoteId,
                                style: AppTextStyle.interRegular12
                                    .copyWith(color: AppColors.textPrimary),
                              ),
                              Text(
                                cn.outstandingAmount.toDouble().toCurrency(),
                                style: AppTextStyle.interSemiBold12
                                    .copyWith(color: AppColors.primary),
                              ),
                            ],
                          ),
                        ))),
                    const Divider(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'total'.tr(),
                          style: AppTextStyle.interSemiBold12
                              .copyWith(color: AppColors.textPrimary),
                        ),
                        Text(
                          _selectedCreditNotes
                              .fold<double>(
                                  0,
                                  (sum, cn) =>
                                      sum + cn.outstandingAmount.toDouble())
                              .toCurrency(),
                          style: AppTextStyle.interBold18
                              .copyWith(color: AppColors.primary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  Future<void> _loadAndShowCreditNotes(WidgetRef ref) async {
    setState(() => _isLoadingCreditNotes = true);

    try {
      final repo = ref.read(orderRepositoryProvider);

      // ✅ Fetch full customer details (credit notes inside)
      final customerDetails = await repo.getCustomerDetails(
        customerId: widget.customer.customerId!,
      );

      if (!mounted) return;
      setState(() => _isLoadingCreditNotes = false);

      final creditNotes = customerDetails.creditNotes;

      // ✅ Filter only ones with outstanding > 0
      final available =
          creditNotes.where((cn) => cn.outstandingAmount > 0).toList();

      if (available.isEmpty) {
        AppToast.errorToast('no_credit_notes_available'.tr());
        return;
      }

      showDialog(
        context: context,
        builder: (_) => CreditNoteSelectionDialog(
          creditNotes: available, // ✅ only pass available ones
          onConfirm: (selected) {
            setState(() {
              _selectedCreditNotes = selected;
              // ✅ Clear amount field when credit notes applied
              _amountController.clear();
            });
          },
        ),
      );
    } catch (e) {
      setState(() => _isLoadingCreditNotes = false);
      AppToast.errorToast('failed_to_load_credit_notes'.tr());
    }
  }

  Widget _buildActionButton(String invoiceId, String amount) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(orderControllerProvider).value!;
        final bool hasAmount = _amountController.text.isNotEmpty;
        final bool hasCreditNotes = _selectedCreditNotes.isNotEmpty;
        final bool isLoading = state.isPaying;

        // ✅ Can submit if: credit notes selected OR amount entered (not both)
        final bool canSubmit = (hasAmount || hasCreditNotes) && !isLoading;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 22),
          width: double.infinity,
          color: const Color(0x80F2F4F7),
          child: CustomButtonWidget(
            text: 'confirm_payment',
            onTap: canSubmit
                ? () async {
                    FocusScope.of(context).unfocus();

                    // ✅ Credit note mode
                    if (hasCreditNotes) {
                      final creditNoteIds = _selectedCreditNotes
                          .map((cn) => cn.creditNoteId)
                          .toList();

                      final success = await ref
                          .read(orderControllerProvider.notifier)
                          .reconcileCreditNotes(
                            invoiceId: invoiceId,
                            creditNoteIds: creditNoteIds,
                            customerName: widget.customer.name,
                          );

                      if (!context.mounted) return;

                      if (success) {
                        Navigator.of(context).pop();
                        context.push(AppRoutes.paymentSuccessPage);
                      }
                      return;
                    }

                    // ✅ Normal payment mode
                    if (hasAmount) {
                      final success = await ref
                          .read(orderControllerProvider.notifier)
                          .createPayment(
                            invoiceId: invoiceId,
                            amount: amount,
                            paymentMethod: _selectedMethod,
                          );

                      if (!context.mounted) return;

                      if (success) {
                        Navigator.of(context).pop();
                        context.push(AppRoutes.paymentSuccessPage);
                      }
                    }
                  }
                : null,
            isFiled: true,
            backgroundColor:
                canSubmit ? AppColors.primary : const Color(0xFFA0A0A0),
            height: 48,
            width: double.infinity,
            radius: 12,
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
                        hasCreditNotes
                            ? 'apply_credit_notes'.tr()
                            : 'confirm_payment'.tr(),
                        style: AppTextStyle.rubikBold16
                            .copyWith(color: AppColors.white),
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        hasCreditNotes
                            ? Icons.receipt_long_outlined
                            : Icons.check_circle_outline,
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
