// lib/features/order/presentation/widgets/invoice_review/invoice_review_bottom_bar.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/order/presentation/controller/invoice_details_controller.dart';
import 'package:sabaa/features/order/presentation/pages/unified_invoice_review_page.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/new_order/new_order_bottom_bar.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/return_order/return_order_bottom_bar.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/view_only/view_only_bottom_bar.dart';

class InvoiceReviewBottomBar extends ConsumerWidget {
  const InvoiceReviewBottomBar({
    super.key,
    required this.mode,
    required this.isLoading,
    required this.fallbackInvoiceId,
    required this.onShare,
    required this.onPrint,
  });

  final InvoiceReviewMode mode;
  final bool isLoading;
  final String? fallbackInvoiceId;
  final VoidCallback onShare;
  final VoidCallback onPrint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (mode) {
      case InvoiceReviewMode.newOrder:
        return const NewOrderBottomBar();
      case InvoiceReviewMode.returnOrder:
        return const ReturnOrderBottomBar();
      case InvoiceReviewMode.viewOnly:
        final state = ref.watch(invoiceDetailsControllerProvider).value;
        return ViewOnlyBottomBar(
          onShare: onShare,
          onPrint: onPrint,
          isLoading: isLoading,
          invoiceId: state?.invoiceId ?? fallbackInvoiceId ?? '',
        );
    }
  }
}