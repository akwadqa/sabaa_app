import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/new_order/presentation/controller/new_order_controller.dart';
import 'package:sabaa/features/order/presentation/controller/invoice_details_controller.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/invoice_pdf_actions_service.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/invoice_review_app_bar.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/invoice_review_body.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/invoice_review_bottom_bar.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';

enum InvoiceReviewMode { newOrder, returnOrder, viewOnly }

class UnifiedInvoiceReviewPage extends ConsumerStatefulWidget {
  const UnifiedInvoiceReviewPage({
    super.key,
    required this.mode,
    this.invoiceId,
    this.type,
  });

  final InvoiceReviewMode mode;
  final String? invoiceId;
  final String? type; 
  @override
  ConsumerState<UnifiedInvoiceReviewPage> createState() =>
      _UnifiedInvoiceReviewPageState();
}

class _UnifiedInvoiceReviewPageState
    extends ConsumerState<UnifiedInvoiceReviewPage> {
  bool _isGeneratingPdf = false;

  late final InvoicePdfActionsService _pdfActions;

  @override
  void initState() {
    super.initState();

    _pdfActions = InvoicePdfActionsService(
      ref: ref,
      context: () => context,
      isMounted: () => mounted,
      onLoadingChange: (loading) {
        if (mounted) setState(() => _isGeneratingPdf = loading);
      },
    );

    if (widget.mode == InvoiceReviewMode.viewOnly && widget.invoiceId != null) {
      Future.microtask(() {
        ref
            .read(invoiceDetailsControllerProvider.notifier)
            .fetchInvoiceDetails(widget.invoiceId!, type: widget.type);
      });
    }
  }

  String _getTitle() {
    switch (widget.mode) {
      case InvoiceReviewMode.newOrder:
        final isReturn =
            ref.read(newOrderControllerProvider).value?.isReturn ?? false;
        return isReturn ? 'return_invoice_review'.tr() : 'invoice_review'.tr();
      case InvoiceReviewMode.returnOrder:
      case InvoiceReviewMode.viewOnly:
        return 'invoice_review'.tr();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: InvoiceReviewAppBar(
        title: _getTitle(),
        showShareAction:  widget.mode == InvoiceReviewMode.viewOnly && widget.type != 'order', 
        isSharing: _isGeneratingPdf,
        onShare: _pdfActions.shareFromHtml,
      ),
      body: InvoiceReviewBody(mode: widget.mode),
      bottomNavigationBar: InvoiceReviewBottomBar(
        mode: widget.mode,
        isLoading: _isGeneratingPdf,
        fallbackInvoiceId: widget.invoiceId,
        onShare: _pdfActions.shareFromHtml,
        onPrint: _pdfActions.printFromHtml,
         isOrder: widget.type == 'order',
           pdfActions: _pdfActions,
      ),
    );
  }
}