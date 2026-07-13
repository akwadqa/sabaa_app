import 'package:flutter/material.dart';
import 'package:sabaa/features/order/presentation/pages/unified_invoice_review_page.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/new_order/new_order_body.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/return_order/return_order_body.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/view_only/view_only_body.dart';

class InvoiceReviewBody extends StatelessWidget {
  const InvoiceReviewBody({super.key, required this.mode});

  final InvoiceReviewMode mode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: switch (mode) {
        InvoiceReviewMode.newOrder => const NewOrderBody(),
        InvoiceReviewMode.returnOrder => const ReturnOrderBody(),
        InvoiceReviewMode.viewOnly => const ViewOnlyBody(),
      },
    );
  }
}