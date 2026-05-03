import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/order/presentation/controller/order_controller.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'payment_bottom_sheet/payment_bottom_sheet_header.dart';
import 'payment_bottom_sheet/payment_summary_cards.dart';
import 'payment_bottom_sheet/payment_amount_input.dart';
import 'payment_bottom_sheet/payment_method_selector.dart';
import 'payment_bottom_sheet/payment_confirm_button.dart';

class InvoicePaymentBottomSheet extends ConsumerStatefulWidget {
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
  ConsumerState<InvoicePaymentBottomSheet> createState() =>
      _InvoicePaymentBottomSheetState();
}

class _InvoicePaymentBottomSheetState
    extends ConsumerState<InvoicePaymentBottomSheet> {
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      orderControllerProvider.select((val) => val.value!.createPaymentResponse),
      (previous, next) {
        if (next is AsyncData) {
          context.pushReplacement(AppRoutes.paymentSuccessScreen,
              extra: next?.value);
        }
      },
    );

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
          PaymentBottomSheetHeader(invoiceId: widget.invoiceId),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  PaymentSummaryCards(
                    amount: widget.amount,
                    outstandingBalance: widget.outstandingBalance,
                  ),
                  const SizedBox(height: 22),
                  PaymentAmountInput(
                    controller: _amountController,
                    onChanged: (value) => setState(() {}),
                  ),
                  const SizedBox(height: 22),
                  const PaymentMethodSelector(),
                  const SizedBox(height: 22),
                ],
              ),
            ),
          ),
          PaymentConfirmButton(
            invoiceId: widget.invoiceId,
            paidAmount: _amountController.text,
            hasAmount: _amountController.text.isNotEmpty,
          ),
          const SizedBox(height: 34), // Home indicator space
        ],
      ),
    );
  }
}
