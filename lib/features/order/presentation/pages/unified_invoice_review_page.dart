// lib/features/order/presentation/screens/unified_invoice_review_page.dart

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:sabaa/features/customers/presentation/widgets/add_customer_page/custom_labeled_text_filed.dart';
import 'package:sabaa/features/new_order/domain/model/order_item.dart';
import 'package:sabaa/features/new_order/presentation/widgets/invoice_widgets/invoice_review_card.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/features/order/presentation/controller/invoice_details_controller.dart';
import 'package:sabaa/features/return_invoice/presentation/controller/return_order_controller.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/shared_widgets/app_toast.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/core/utils/functions/helper_methods.dart';
import 'package:sabaa/src/core/utils/functions/pdf_preview_screen.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
import 'package:share_plus/share_plus.dart';
import 'package:slider_button/slider_button.dart';

import '../../../../src/core/utils/functions/invoice_pdf_generator.dart';
import '../../../main/presentation/screens/main_screen.dart';
import '../../../new_order/presentation/controller/new_order_controller.dart';
import '../../../new_order/presentation/widgets/invoice_widgets/remark_widget.dart';

enum InvoiceReviewMode { newOrder, returnOrder, viewOnly }

class UnifiedInvoiceReviewPage extends ConsumerStatefulWidget {
  const UnifiedInvoiceReviewPage({
    super.key,
    required this.mode,
    this.invoiceId,
  });

  final InvoiceReviewMode mode;
  final String? invoiceId; // Only needed for viewOnly mode

  @override
  ConsumerState<UnifiedInvoiceReviewPage> createState() =>
      _UnifiedInvoiceReviewPageState();
}

class _UnifiedInvoiceReviewPageState
    extends ConsumerState<UnifiedInvoiceReviewPage> {
  // ── Track loading state for share/print actions ────────────────────────
  bool _isGeneratingPdf = false;
  @override
  void initState() {
    super.initState();
    if (widget.mode == InvoiceReviewMode.viewOnly && widget.invoiceId != null) {
      Future.microtask(() {
        ref
            .read(invoiceDetailsControllerProvider.notifier)
            .fetchInvoiceDetails(widget.invoiceId!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(context),
      bottomNavigationBar: _buildBottomBar(),
      body: _buildBody(),
    );
  }

  // ─── APP BAR ──────────────────────────────────────────────────────────────

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
      ),
      title: Text(
        _getTitle(),
        style: AppTextStyle.interBold20.copyWith(color: AppColors.dark),
      ),
      actions: [
        // if (widget.mode == InvoiceReviewMode.viewOnly)
        if (widget.mode == InvoiceReviewMode.viewOnly)
          _isGeneratingPdf
              ? const Padding(
                  padding: EdgeInsets.all(12),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primary,
                    ),
                  ),
                )
              : IconButton(
                  onPressed: () => _shareInvoiceAsPdf(), // ✅ Changed
                  icon: const Icon(
                    Icons.share_outlined,
                    color: AppColors.primary,
                  ),
                ),
        // IconButton(
        //   onPressed: () => _shareInvoice(),
        //   icon: const Icon(
        //     Icons.share_outlined,
        //     color: AppColors.primary,
        //   ),
        // ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, color: AppColors.navBorder),
      ),
    );
  }

  String _getTitle() {
    switch (widget.mode) {
      case InvoiceReviewMode.newOrder:
        // ✅ Check isReturn from NewOrderState
        final isReturn =
            ref.read(newOrderControllerProvider).value?.isReturn ?? false;
        return isReturn ? 'return_invoice_review'.tr() : 'invoice_review'.tr();
      case InvoiceReviewMode.returnOrder:
        return 'invoice_review'.tr();
      case InvoiceReviewMode.viewOnly:
        return 'invoice_review'.tr();
    }
  }

  // ─── BODY ─────────────────────────────────────────────────────────────────

  Widget _buildBody() {
    switch (widget.mode) {
      case InvoiceReviewMode.newOrder:
        return _NewOrderBody();
      case InvoiceReviewMode.returnOrder:
        return _ReturnOrderBody();
      case InvoiceReviewMode.viewOnly:
        return _ViewOnlyBody();
    }
  }

  // ─── BOTTOM BAR ───────────────────────────────────────────────────────────

  Widget? _buildBottomBar() {
    switch (widget.mode) {
      case InvoiceReviewMode.newOrder:
        return _NewOrderBottomBar();
      case InvoiceReviewMode.returnOrder:
        return _ReturnOrderBottomBar();
      case InvoiceReviewMode.viewOnly:
        return _ViewOnlyBottomBar(
          onShare: _shareInvoiceAsPdf,
          onPrint: _printInvoice,
          isLoading: _isGeneratingPdf,
        );
    }
  }
// ─── SHARE AS TEXT (WhatsApp friendly) ───────────────────────────────────

  void _shareInvoiceAsText() {
    final detailsState = ref.read(invoiceDetailsControllerProvider);

    detailsState.whenData((state) {
      final buffer = StringBuffer();
      buffer.writeln('📄 ${'invoice_details'.tr()}');
      buffer.writeln('━━━━━━━━━━━━━━━━━━━━');
      buffer.writeln('🆔 ${'invoice_id'.tr()}: ${state.invoiceId}');
      buffer.writeln('👤 ${'customer'.tr()}: ${state.customerName}');
      buffer.writeln('📅 ${'date'.tr()}: ${state.postingDate}');
      buffer.writeln('📊 ${'status'.tr()}: ${state.status}');
      buffer.writeln('━━━━━━━━━━━━━━━━━━━━');
      buffer.writeln('');
      buffer.writeln('📦 ${'items'.tr()}:');

      for (final item in state.items) {
        buffer.writeln(
          '  • ${item.itemName} x${item.qty} (${item.uom}) '
          '= ${formatPrice(item.amount.toDouble())}',
        );
      }

      buffer.writeln('');
      buffer.writeln('━━━━━━━━━━━━━━━━━━━━');
      buffer.writeln('💰 ${'subtotal'.tr()}: ${formatPrice(state.subtotal)}');
      buffer.writeln(
          '🚚 ${'delivery_fee'.tr()}: ${formatPrice(state.deliveryFee)}');
      buffer.writeln('🧾 ${'total'.tr()}: ${formatPrice(state.total)}');

      // ✅ Use Share.share for plain text — works reliably on all platforms
      Share.share(buffer.toString());
    });
  }

// Inside _UnifiedInvoiceReviewPageState

// Future<void> _printInvoice() async {
//   final detailsState = ref.read(invoiceDetailsControllerProvider);

//   detailsState.whenData((state) async {
//     setState(() => _isGeneratingPdf = true);

//     try {
//       // Generate PDF bytes (not a file)
//       final Uint8List pdfBytes =
//           await InvoicePdfGenerator.generate(context, state);

//       if (!mounted) return;

//       setState(() => _isGeneratingPdf = false);

//       // Navigate to PDF Preview Screen
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (_) => PdfPreviewScreen(
//             pdfBytes: pdfBytes,
//             invoiceId: state.invoiceId,
//           ),
//         ),
//       );
//     } catch (e) {
//       if (mounted) {
//         setState(() => _isGeneratingPdf = false);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('failed_to_generate_pdf'.tr()),
//             backgroundColor: AppColors.errorRed,
//           ),
//         );
//       }
//     }
//   });
// }
  Future<void> _printInvoice() async {
    final detailsState = ref.read(invoiceDetailsControllerProvider);

    if (detailsState is! AsyncData<InvoiceDetailsState>) return;

    final state = detailsState.value;

    setState(() => _isGeneratingPdf = true);

    try {
      final Uint8List pdfBytes =
          await InvoicePdfGenerator.generate(context, state);

      if (!mounted) return;

      setState(() => _isGeneratingPdf = false);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PdfPreviewScreen(
            pdfBytes: pdfBytes,
            invoiceId: state.invoiceId, // raw ID is fine here, sanitized inside
          ),
        ),
      );
    } catch (e) {
      if (mounted) {
        setState(() => _isGeneratingPdf = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('failed_to_generate_pdf'.tr()),
            backgroundColor: AppColors.errorRed,
          ),
        );
      }
    }
  }

// ─── SHARE AS PDF FILE ──────────────────────────────────────────────────

  /// Sanitize invoice ID to be safe for file names
  String _sanitizeFileName(String invoiceId) {
    return invoiceId.replaceAll(RegExp(r'[/\\:*?"<>|]'), '_');
  }

  Future<void> _shareInvoiceAsPdf() async {
    final detailsState = ref.read(invoiceDetailsControllerProvider);

    if (detailsState is! AsyncData<InvoiceDetailsState>) return;

    final state = detailsState.value!;

    setState(() => _isGeneratingPdf = true);

    try {
      final Uint8List pdfBytes =
          await InvoicePdfGenerator.generate(context, state);

      if (!mounted) return;

      final dir = await getTemporaryDirectory();
      final safeName = _sanitizeFileName(state.invoiceId);
      final filePath = '${dir.path}/invoice_$safeName.pdf';
      final file = File(filePath);
      await file.writeAsBytes(pdfBytes);

      if (!mounted) return;

      await Share.shareXFiles(
        [XFile(filePath, mimeType: 'application/pdf')],
      );
    } catch (e) {
      debugPrint('Share error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('failed_to_share_pdf'.tr()),
            backgroundColor: AppColors.errorRed,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isGeneratingPdf = false);
    }
  }
}

//

// ═══════════════════════════════════════════════════════════════════════════════
// NEW ORDER MODE WIDGETS
// ═══════════════════════════════════════════════════════════════════════════════

class _NewOrderBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newOrderControllerProvider).value!;
    final controller = ref.read(newOrderControllerProvider.notifier);
    final selectedProducts = state.selectedItems.values.toList();
    final isReturn = state.isReturn; // ✅

    // ── Helper to get effective price (custom rate > default uom price) ──
    double effectivePrice(SelectedItem e) {
      if (e.customRate != null) return e.customRate!;
      if (e.product.uoms.isEmpty) return e.product.price;

      final selectedUnit = e.unit;
      final price = e.product.uoms
          .firstWhere(
            (u) => u.uom == selectedUnit,
            orElse: () => e.product.uoms.first,
          )
          .price;
      return price;
    }

    final items = selectedProducts.map((e) {
      // final selected = state.selectedItems[e.product.itemCode];
      // final selectedUnit = selected?.unit ?? e.product.uoms.first.uom;
      final price = effectivePrice(e);

      final qty = e.quantity;
      final total = price * qty;
      return InvoiceItemUI(
        name: e.product.productName,
        count: qty,
        total: total.toCurrency(),
      );
    }).toList();

    final subtotalValue = selectedProducts.fold<double>(0, (sum, e) {
      final selected = state.selectedItems[e.product.itemCode];
      // final unit = selected?.unit ?? e.product.uoms.first.uom;
      final price = effectivePrice(e);

      // final price = e.product.uoms
      //     .firstWhere((u) => u.uom == unit, orElse: () => e.product.uoms.first)
      //     .price;
      final qty = selected?.quantity ?? 0;
      return sum + (price * qty);
    });

    final deliveryFee = double.tryParse(state.deliveryFee ?? "") ?? 0.0;
    final totalValue = subtotalValue + deliveryFee;

    return SingleChildScrollView(
      child: Column(
        spacing: 12,
        children: [
          20.verticalSpace,
          if (!isReturn)
            CustomLabeledTextField(
              label: 'delivery_fee',
              keyboardType: TextInputType.numberWithOptions(),
              hint: 'enter_delivery_fee',
              onChanged: (value) => controller.editDeliveryFee(value),
            ).symmetricPadding(horizontal: 12),
          InvoiceReviewCard(
            items: items,
            subtotal: formatPrice(subtotalValue),
            deliveyFee: state.deliveryFee ?? "0",
            total: formatPrice(totalValue),
          ).symmetricPadding(horizontal: 12, vertical: 16),
          RemarkWidget().symmetricPadding(horizontal: 12),
        ],
      ),
    );
  }
}

class _NewOrderBottomBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newOrderControllerProvider).value!;
    final isReturn = state.isReturn;

    final isValid = isReturn
        ? true
        : state.deliveryFee != null && (state.deliveryFee?.isNotEmpty ?? false);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 16,
          horizontal: 40,
        ),
        child: state.isSubmitting
            ? _LoadingButton()
            : AbsorbPointer(
                absorbing: !isValid,
                child: SliderButton(
                  useGlassEffect: true,
                  alignLabel: Alignment.center,
                  action: () async {
                    if (!isValid) return false;

                    final controller =
                        ref.read(newOrderControllerProvider.notifier);

                    final invoice = await controller.createInvoice();

                    if (invoice == null || !context.mounted) {
                      return false;
                    }

                    // ✅ Schedule dialog AFTER the slider finishes its animation
                    //    Always return false so slider resets instead of dismissing
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (context.mounted) {
                        _showSuccessDialog(context, ref, invoice);
                      }
                    });

                    return false; // ✅ ALWAYS false — prevents slider dismiss crash
                  },
                  label: Text(
                    isReturn
                        ? "swipe_to_confirm_return".tr()
                        : "swipe_to_confirm".tr(),
                    style: AppTextStyle.interSemiBold14.copyWith(
                      color: isReturn ? AppColors.accent : AppColors.primary,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                  icon: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: isValid
                            ?isReturn ? AppColors.accentGradient : AppColors.primaryGradient
                            : [AppColors.blueGrey, AppColors.gray],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryShadow,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  width: double.infinity,
                  height: 64,
                  radius: 18,
                  backgroundColor: AppColors.sliderBackground,
                  shimmer: isValid,
                  baseColor:
                      isValid ? AppColors.sliderBase : Colors.grey.shade300,
                  highlightedColor:
                      isValid ?isReturn ? AppColors.accent : AppColors.sliderHighlight : Colors.grey,
                  buttonColor: Colors.transparent,
                ),
              ),
      ),
    );
  }

  Future<void> _showSuccessDialog(
    BuildContext context,
    WidgetRef ref,
    InvoiceModel invoice,
  ) async {
    final state = ref.read(newOrderControllerProvider).value!;
    final isReturn = state.isReturn;

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.transparent),
            ),
            Center(
              child: Dialog(
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "transaction_successful".tr(),
                        style: AppTextStyle.interBold22.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SvgPicture.asset(
                        Assets.icons.successCheckIcon.keyName,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        isReturn
                            ? "return_invoice_created_successfully".tr()
                            : "invoice_created_successfully".tr(),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.interRegular14.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 24),
                      if (!isReturn)
                        CustomButtonWidget(
                          text: "pay_now",
                          onTap: () {
                            context.goNamed(AppRoutes.mainScreen);
                            context.pushNamed(
                              AppRoutes.orderSummaryScreen,
                              extra: {
                                'customer': state.customer,
                                'invoice': invoice,
                                'openPayment': true,
                              },
                            );
                          },
                          isFiled: true,
                          height: 48,
                          width: double.infinity,
                          backgroundColor: AppColors.primary,
                          radius: 8,
                        ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          ref.read(bottomNavIndexProvider.notifier).state = 0;
                          context.goNamed(AppRoutes.mainScreen);
                        },
                        child: Text(
                          "back_to_home".tr(),
                          style: AppTextStyle.interSemiBold14.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// RETURN ORDER MODE WIDGETS
// ═══════════════════════════════════════════════════════════════════════════════

class _ReturnOrderBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Your existing return order invoice review body
    // Use returnOrderControllerProvider to get items
    final state = ref.watch(returnOrderControllerProvider);

    return state.when(
      loading: () => const Center(child: AppLoader()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (returnState) {
        final selectedProducts = returnState.selectedItems.values.toList();

        // 🔥 Map to UI model
        final items = selectedProducts.map((e) {
          final selected = state.requireValue.selectedItems[e.product.itemCode];
          final total = e.product.amount * (selected?.quantity ?? 0);

          return InvoiceItemUI(
            name: e.product.itemName,
            count: selected?.quantity ?? 0,
            total: formatPrice(total.toDouble()),
          );
        }).toList();

        final subtotal = selectedProducts.fold<double>(
          0,
          (sum, e) => sum + (e.product.amount * e.quantity),
        );
        //         final subtotalValue = selectedProducts.fold<double>(
        //   0,
        //   (sum, e) =>
        //       sum +
        //       (e.product.amount *
        //           (state.selectedItems[e.product.itemCode]?.quantity ?? 0)),
        // );

        final taxValue = subtotal * 0.15;
        final totalValue = subtotal + taxValue;
        return Column(
          children: [
            20.verticalSpace,
            InvoiceReviewCard(
              items: items,
              subtotal: formatPrice(subtotal),
              deliveyFee: "0",
              total: formatPrice(subtotal),
            ).symmetricPadding(horizontal: 12, vertical: 16),
          ],
        );
      },
    );
  }
}

class _ReturnOrderBottomBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(returnOrderControllerProvider).value!;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 16,
          horizontal: 40,
        ),
        child: state.isSubmitting
            ? _LoadingButton()
            : SliderButton(
                useGlassEffect: true,
                alignLabel: Alignment.center,
                action: () async {
                  final controller =
                      ref.read(returnOrderControllerProvider.notifier);
                  final success = await controller.createReturnOrder();

                  if (!success || !context.mounted) return false;

                  // ✅ Schedule dialog after slider animation completes
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (context.mounted) {
                      _showSuccessDialog(context, ref);
                    }
                  });

                  return false; // ✅ ALWAYS false
                },
                label: Text(
                  "swipe_to_confirm".tr(),
                  style: AppTextStyle.interSemiBold14.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),
                icon: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: AppColors.primaryGradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryShadow,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                width: double.infinity,
                height: 64,
                radius: 18,
                backgroundColor: AppColors.sliderBackground,
                baseColor: AppColors.sliderBase,
                highlightedColor: AppColors.sliderHighlight,
                buttonColor: Colors.transparent,
              ),
      ),
    );
  }

  // Move _showSuccessDialog INSIDE this class (it's currently outside both classes in your code)
  Future<void> _showSuccessDialog(BuildContext context, WidgetRef ref) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.transparent),
            ),
            Center(
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "transaction_successful".tr(),
                        style: AppTextStyle.interBold22
                            .copyWith(color: AppColors.primary),
                      ),
                      const SizedBox(height: 20),
                      SvgPicture.asset(
                        Assets.icons.successCheckIcon.keyName,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "invoice_created_successfully".tr(),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.interRegular14
                            .copyWith(color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 24),
                      CustomButtonWidget(
                        text: "back_to_home",
                        onTap: () {
                          ref.read(bottomNavIndexProvider.notifier).state = 0;
                          context.goNamed(AppRoutes.mainScreen);
                        },
                        isFiled: true,
                        height: 48,
                        width: double.infinity,
                        backgroundColor: AppColors.primary,
                        radius: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// Future<void> _showSuccessDialog(BuildContext context, WidgetRef ref) async {
//   return showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (_) {
//       return Stack(
//         children: [
//           BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//             child: Container(color: Colors.transparent),
//           ),
//           Center(
//             child: Dialog(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(24),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       "transaction_successful".tr(),
//                       style: AppTextStyle.interBold22
//                           .copyWith(color: AppColors.primary),
//                     ),
//                     const SizedBox(height: 20),
//                     SvgPicture.asset(
//                       Assets.icons.successCheckIcon.keyName,
//                       fit: BoxFit.cover,
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       "invoice_created_successfully".tr(),
//                       textAlign: TextAlign.center,
//                       style: AppTextStyle.interRegular14
//                           .copyWith(color: AppColors.textSecondary),
//                     ),
//                     const SizedBox(height: 24),
//                     CustomButtonWidget(
//                       text: "back_to_home",
//                       onTap: () {
//                         ref.read(bottomNavIndexProvider.notifier).state = 0;
//                         context.goNamed(AppRoutes.mainScreen);
//                       },
//                       isFiled: true,
//                       height: 48,
//                       width: double.infinity,
//                       backgroundColor: AppColors.primary,
//                       radius: 8,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       );
//     },
//   );
// }

// ═══════════════════════════════════════════════════════════════════════════════
// VIEW ONLY MODE WIDGETS (NEW - for viewing from order summary)
// ═══════════════════════════════════════════════════════════════════════════════

class _ViewOnlyBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(invoiceDetailsControllerProvider);

    return asyncState.when(
      loading: () => const Center(child: AppLoader()),
      error: (e, _) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: AppColors.errorRed, size: 48),
            const SizedBox(height: 12),
            Text(
              'failed_to_load_invoice'.tr(),
              style: AppTextStyle.interRegular14
                  .copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
      data: (state) {
        final items = state.items
            .map((e) => InvoiceItemUI(
                  name: e.itemName,
                  count: e.qty,
                  total: formatPrice(e.amount.toDouble()),
                ))
            .toList();

        return SingleChildScrollView(
          child: Column(
            children: [
              20.verticalSpace,

              // Invoice info header
              _InvoiceInfoHeader(
                invoiceId: state.invoiceId,
                customerName: state.customerName,
                date: state.postingDate,
                status: state.status,
              ).symmetricPadding(horizontal: 12),

              const SizedBox(height: 12),

              InvoiceReviewCard(
                items: items,
                subtotal: formatPrice(state.subtotal),
                deliveyFee: formatPrice(state.deliveryFee),
                total: formatPrice(state.total),
              ).symmetricPadding(horizontal: 12, vertical: 16),
            ],
          ),
        );
      },
    );
  }
}

// ── ViewOnly Bottom Bar ────────────────────────────────────────────────────

class _ViewOnlyBottomBar extends StatelessWidget {
  const _ViewOnlyBottomBar({
    required this.onShare,
    required this.onPrint,
    required this.isLoading,
  });

  final VoidCallback onShare;
  final VoidCallback onPrint;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: isLoading
            ? _LoadingButton()
            : Row(
                spacing: 12,
                children: [
                  // ── Share via WhatsApp (text) ──────────────────────────
                  // Expanded(
                  //   child: CustomButtonWidget(
                  //     text: "",
                  //     onTap: onShare,
                  //     isFiled: true,
                  //     height: 48,
                  //     backgroundColor: AppColors.primary,
                  //     radius: 12,
                  //      width: double.infinity,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       spacing: 8,
                  //       children: [
                  //         const Icon(
                  //           Icons.share_outlined,
                  //           color: AppColors.white,
                  //           size: 18,
                  //         ),
                  //         Text(
                  //           'share'.tr(),
                  //           style: AppTextStyle.interSemiBold14
                  //               .copyWith(color: AppColors.white),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  // ── Print / PDF ────────────────────────────────────────
                  Expanded(
                    child: CustomButtonWidget(
                      text: "",
                      onTap: onPrint,
                      width: double.infinity,
                      isFiled: true,
                      height: 48,
                      backgroundColor: AppColors.successGreen,
                      radius: 12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          const Icon(
                            Icons.print_outlined,
                            color: AppColors.white,
                            size: 25,
                          ),
                          Text(
                            'print'.tr(),
                            style: AppTextStyle.interSemiBold16
                                .copyWith(color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _InvoiceInfoHeader extends StatelessWidget {
  const _InvoiceInfoHeader({
    required this.invoiceId,
    required this.customerName,
    required this.date,
    required this.status,
  });

  final String invoiceId;
  final String customerName;
  final String date;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _InfoRow(label: 'invoice_id'.tr(), value: invoiceId),
          const Divider(height: 16),
          _InfoRow(label: 'customer'.tr(), value: customerName),
          const Divider(height: 16),
          _InfoRow(label: 'date'.tr(), value: date),
          const Divider(height: 16),
          _InfoRow(
            label: 'status'.tr(),
            value: status,
            valueColor: status == 'Paid'
                ? AppColors.successGreen
                : AppColors.warnYellow,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyle.interRegular14.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: AppTextStyle.interSemiBold14.copyWith(
            color: valueColor ?? AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

// class _ViewOnlyBottomBar extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//         child: CustomButtonWidget(
//           text: "",
//           onTap: () {
//             // Trigger share
//             final state = ref.read(invoiceDetailsControllerProvider);
//             state.whenData((data) {
//               final buffer = StringBuffer();
//               buffer.writeln('📄 ${'invoice_details'.tr()}');
//               buffer.writeln('━━━━━━━━━━━━━━━━━━━━');
//               buffer.writeln('🆔 ${data.invoiceId}');
//               buffer.writeln('👤 ${data.customerName}');
//               buffer.writeln('📅 ${data.postingDate}');
//               buffer.writeln('━━━━━━━━━━━━━━━━━━━━');
//               for (final item in data.items) {
//                 buffer.writeln(
//                     '  • ${item.itemName} x${item.qty} = ${formatPrice(item.amount.toDouble())}');
//               }
//               buffer.writeln('━━━━━━━━━━━━━━━━━━━━');
//               buffer.writeln(
//                   '💰 ${'subtotal'.tr()}: ${formatPrice(data.subtotal)}');
//               buffer.writeln(
//                   '🚚 ${'delivery_fee'.tr()}: ${formatPrice(data.deliveryFee)}');
//               buffer.writeln(
//                   '🧾 ${'total'.tr()}: ${formatPrice(data.total)}');

//               Share.share(buffer.toString());
//             });
//           },
//           isFiled: true,
//           height: 48,
//           width: double.infinity,
//           backgroundColor: AppColors.successGreen,
//           radius: 12,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             spacing: 10,
//             children: [
//               Icon(Icons.share_outlined, color: AppColors.white, size: 20),
//               Text(
//                 'share_via_whatsapp'.tr(),
//                 style: AppTextStyle.interSemiBold14.copyWith(
//                   color: AppColors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ═══════════════════════════════════════════════════════════════════════════════
// LOADING BUTTON (shared)
// ═══════════════════════════════════════════════════════════════════════════════

class _LoadingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLoader(),
            const SizedBox(width: 12),
            Text(
              "processing".tr(),
              style: AppTextStyle.interSemiBold14.copyWith(
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
