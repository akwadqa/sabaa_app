import 'dart:async';

import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/new_order/presentation/controller/new_order_controller.dart';
import 'package:sabaa/features/van_stock/presentation/controller/van_stock_controller.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';

class BarcodeScannerPage extends ConsumerStatefulWidget {
  final bool? fromNewOrder;
  final void Function(String)? onScan;
  const BarcodeScannerPage({super.key, this.fromNewOrder, required this.onScan});

  @override
  ConsumerState<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends ConsumerState<BarcodeScannerPage> {
  late MobileScannerController controller;

  bool _isProcessing = false;
  Timer? _cooldown;

  @override
  void initState() {
    super.initState();

    controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      // formats: [
      //   // BarcodeFormat.code128,
      //   // BarcodeFormat.ean13,
      //   // BarcodeFormat.ean8,
      //   // BarcodeFormat.upcA,
      //   // BarcodeFormat.upcE,
      //   BarcodeFormat.all,
      // ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    _cooldown?.cancel();
    super.dispose();
  }

  Future<void> _handleBarcode(String code) async {
    if (_isProcessing) return;

    _isProcessing = true;

    try {
      await controller.stop();

      if (mounted) {
        Navigator.pop(context);
      }

      (widget.fromNewOrder != null)
          ? widget.fromNewOrder!
              ? await ref
                  .read(newOrderControllerProvider.notifier)
                  .fetchItems(page: 1, search: code)
              : await ref
                  .read(vanStockControllerProvider.notifier)
                  .fetchStock(page: 1, search: code)
          : widget.onScan != null
              ? widget.onScan!(code)
              : null;
    } catch (e) {
      debugPrint("Scan error: $e");
    } finally {
      _cooldown = Timer(const Duration(milliseconds: 800), () async {
        if (!mounted) return;

        _isProcessing = false;

        await controller.start();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AiBarcodeScanner(
      controller: controller,
      // controller: MobileScannerController(
      //   formats: [BarcodeFormat.qrCode],
      // ),
      onDetect: (barcode) async {
        final code = barcode.barcodes.first.rawValue;

        Dev.logLine("SCANNED: $code");
        if (code != null) {
          _handleBarcode(code);
        }
      },
      // overlayConfig: const ScannerOverlayConfig(
      //   // Change the animation style
      //   // scannerAnimation: ScannerAnimation.fullWidth,
      //   // Change the border style
      //   // scannerBorder: ScannerBorder.full,
      //   // Customize colors
      //   borderColor: AppColors.primary,
      //   successColor: Colors.teal,
      //   errorColor: Colors.red,
      //   // animateOnSuccess: true,
      //   // animationDuration: Duration(milliseconds: 500),
      //   animateOnError: true,

      //   // Adjust corner radius
      //   borderRadius: 24,
      //   cornerLength: 50,
      // ),

      /// UI
      // hideGalleryButton: true,
      // hideSheetTitle: true,
      // hideSheetDragHandler: true,
    );
  }
}
