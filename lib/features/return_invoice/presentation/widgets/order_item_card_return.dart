import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/infrastructure/api/endpoint/services_urls.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';

import '../../../van_stock/domain/model/product_model.dart';
import '../../domain/model/return_invoice_model.dart';
import 'return_quantity_stepper.dart';

/// Order Item Card for Return Items
/// - Read-only unit dropdown (cannot be changed)
/// - Quantity limited to available stock
/// - Shows return-specific styling
class OrderItemCardReturn extends StatefulWidget {
  const OrderItemCardReturn({
    super.key,
    required this.item,
    required this.quantity,
    required this.selectedUnit,
    required this.isSelected,
    required this.maxReturnQuantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
    this.customRate, // ✅ add
    this.onRateChanged, // ✅ add
  });

  final InvoiceItemModel item;
  final int quantity;
  final String selectedUnit;
  final bool isSelected;
  final int maxReturnQuantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;
  final double? customRate; // ✅ add
  final ValueChanged<double?>? onRateChanged; // ✅ add

  @override
  State<OrderItemCardReturn> createState() => _OrderItemCardReturnState();
}

class _OrderItemCardReturnState extends State<OrderItemCardReturn> {
  bool _isEditingRate = false;
  late final TextEditingController _rateController;
  late final FocusNode _rateFocusNode;

  @override
  void initState() {
    super.initState();
    _rateController = TextEditingController(
      text: widget.customRate?.toString() ?? '',
    );
    _rateFocusNode = FocusNode();

    _rateFocusNode.addListener(() {
      if (!_rateFocusNode.hasFocus && _isEditingRate) {
        _saveRate();
      }
    });
  }

  @override
  void didUpdateWidget(covariant OrderItemCardReturn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_isEditingRate) {
      _rateController.text = widget.customRate?.toString() ?? '';
    }
  }

  void _startRateEdit() {
    setState(() {
      _isEditingRate = true;
      _rateController.text =
          (widget.customRate ?? widget.item.amount.toDouble()).toString();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _rateFocusNode.requestFocus();
        _rateController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _rateController.text.length,
        );
      }
    });
  }

  void _saveRate() {
    final text = _rateController.text.trim();

    if (text.isEmpty) {
      widget.onRateChanged?.call(null);
    } else {
      final parsed = double.tryParse(text);
      widget.onRateChanged?.call(parsed);
    }

    if (mounted) {
      setState(() => _isEditingRate = false);
    }
  }

  void _cancelRateEdit() {
    _rateController.text = widget.customRate?.toString() ?? '';
    setState(() => _isEditingRate = false);
  }

  @override
  void dispose() {
    _rateController.dispose();
    _rateFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final effectivePrice = widget.customRate ?? widget.item.amount.toDouble();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: BorderDirectional(
          start: BorderSide(
            color: widget.isSelected ? AppColors.accent : AppColors.borderGrey,
            width: widget.isSelected ? 5 : 1,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.darkShadow,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Top row: image + name/sku/price + delete ───────────
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProductImage(
                imageUrl: ServicesUrls.imageUrl + (widget.item.itemCode ?? ""),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            widget.item.itemName,
                            style: AppTextStyle.interSemiBold14.copyWith(
                              color: AppColors.textHeading,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (widget.isSelected)
                          GestureDetector(
                            onTap: widget.onDelete,
                            child: const Icon(
                              Icons.delete_outline_rounded,
                              color: AppColors.red,
                              size: 25,
                            ),
                          ),
                      ],
                    ),
                    4.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'SKU: ${widget.item.itemCode}',
                            style: AppTextStyle.interRegular12.copyWith(
                              color: AppColors.blueGrey,
                            ),
                          ),
                        ),

                        // ✅ Price with inline edit
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 180),
                              child: _isEditingRate
                                  ? SizedBox(
                                      key: const ValueKey('edit-rate'),
                                      width: 82,
                                      height: 34,
                                      child: TextFormField(
                                        controller: _rateController,
                                        focusNode: _rateFocusNode,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        textInputAction: TextInputAction.done,
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.interSemiBold12
                                            .copyWith(
                                          color: AppColors.textPrimary,
                                        ),
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: widget.item.amount
                                              .toStringAsFixed(2),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 8,
                                          ),
                                          filled: true,
                                          fillColor: AppColors.white,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: const BorderSide(
                                                color: AppColors.navBorder),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: const BorderSide(
                                                color: AppColors.accent,
                                                width: 1.2),
                                          ),
                                        ),
                                        onFieldSubmitted: (_) => _saveRate(),
                                        onTapOutside: (_) => _saveRate(),
                                      ),
                                    )
                                  : Text(
                                      key: const ValueKey('show-rate'),
                                      effectivePrice.toCurrency(),
                                      style:
                                          AppTextStyle.interSemiBold14.copyWith(
                                        color: AppColors.accent,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                            ),

                            // ✅ Edit / Confirm / Cancel icons
                            const SizedBox(width: 6),
                            GestureDetector(
                              onTap: () {
                                if (_isEditingRate) {
                                  _saveRate();
                                } else {
                                  _startRateEdit();
                                }
                              },
                              child: Icon(
                                _isEditingRate
                                    ? Icons.check_rounded
                                    : Icons.edit_outlined,
                                size: 18,
                                color: _isEditingRate
                                    ? AppColors.accent
                                    : AppColors.blueGrey,
                              ),
                            ),
                            if (_isEditingRate) ...[
                              const SizedBox(width: 4),
                              GestureDetector(
                                onTap: _cancelRateEdit,
                                child: const Icon(
                                  Icons.close_rounded,
                                  size: 18,
                                  color: AppColors.red,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              12.horizontalSpace,
              // if (widget.isSelected)
              //   GestureDetector(
              //     onTap: widget.onDelete,
              //     child: const Icon(
              //       Icons.delete_outline_rounded,
              //       color: AppColors.red,
              //       size: 25,
              //     ),
              //   ),
            ],
          ),
          if (widget.isSelected) ...[
            12.verticalSpace,
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F2F4),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFFE5E7EB),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    widget.selectedUnit,
                    style: AppTextStyle.interSemiBold12.copyWith(
                      color: AppColors.textHeading,
                    ),
                  ),
                ),
                const Spacer(),
                ReturnQuantityStepper(
                  quantity: widget.quantity,
                  onDecrement: widget.quantity > 0 ? widget.onDecrement : null,
                  onIncrement: widget.quantity < widget.maxReturnQuantity
                      ? widget.onIncrement
                      : null,
                  maxStock: widget.maxReturnQuantity,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

// ── Product Image ────────────────────────────────────────────────────────────

class _ProductImage extends StatelessWidget {
  const _ProductImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => Icon(
          Icons.assignment_return_outlined,
          color: AppColors.textSecondary,
          size: 28,
        ),
      ),
    );
  }
}
