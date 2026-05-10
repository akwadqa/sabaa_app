import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/infrastructure/api/endpoint/services_urls.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';

import '../../../van_stock/domain/model/product_model.dart';
import '../../domain/model/new_order_model.dart';
import '../../domain/model/order_item.dart';
import '../controller/new_order_controller.dart';
import 'quantity_stepper.dart';

class OrderItemCard extends ConsumerStatefulWidget {
  const OrderItemCard({
    super.key,
    required this.item,
    required this.quantity,
    required this.onDecrement,
    required this.onIncrement,
    required this.onDelete,
    required this.isSelected,
    // required this.availableStock,
    required this.onUnitChanged,
    required this.selectedUnit,
  });

  final bool isSelected;
  final ProductModel item;
  final int quantity;
  // final int availableStock;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  final VoidCallback onDelete;
  final Function(String) onUnitChanged;
  final String selectedUnit;

  @override
  ConsumerState<OrderItemCard> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends ConsumerState<OrderItemCard> {
  late TextEditingController _quantityController;
  // Unit options for dropdown
  @override
  void initState() {
    super.initState();
    _quantityController =
        TextEditingController(text: widget.quantity.toString());
    // Default to 'Box'
  }

  @override
  void didUpdateWidget(OrderItemCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.quantity != widget.quantity) {
      _quantityController.text = widget.quantity.toString();
    }
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  void _handleQuantityInput(String value) {
    if (value.isEmpty) {
      _quantityController.clear();
      return;
    }

    final parsed = int.tryParse(value);
    if (parsed == null) {
      // Reset to previous value
      _quantityController.text = widget.quantity.toString();
      return;
    }

    // Validate against available stock
    if (parsed > widget.item.availableStock) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Cannot exceed available stock: ${widget.item.availableStock}'),
          backgroundColor: AppColors.accent,
          duration: const Duration(seconds: 2),
        ),
      );
      _quantityController.text = widget.item.availableStock.toString();
      return;
    }

    if (parsed < 1) {
      _quantityController.text = '1';
      return;
    }

    // Update the quantity via controller
    // You'll need to dispatch this to the controller
    // For now, we update the text field
    _quantityController.text = parsed.toString();
  }
  // ── Style helpers ────────────────────────────────────────────────────────────

  // Color get _imageBg    => widget.item.isReturn ? const Color(0xFFFFEDE0) : const Color(0xFFF3F4F6);
  // Color get _priceColor => widget.item.isReturn ? AppColors.accent : AppColors.primary;
  // Color get _borderColor => widget.item.isReturn ? AppColors.primary : const Color(0xFFF3F4F6);

  double getPriceByUom(OrderProductModel product, String selectedUom) {
    final uom = product.uoms.firstWhere(
      (e) => e.uom == selectedUom,
      orElse: () => product.uoms.first,
    );

    return uom.price;
  }

  @override
  Widget build(BuildContext context) {
    final units = widget.item.uoms.map((e) => e.uom).toList();
    final safeUnit =
        units.contains(widget.selectedUnit) ? widget.selectedUnit : units.first;
    final selectedPrice = widget.item.uoms
        .firstWhere(
          (e) => e.uom == widget.selectedUnit,
          orElse: () => widget.item.uoms.first,
        )
        .price;
    final qty = widget.quantity;

    final total = selectedPrice * qty;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: BorderDirectional(
          start: BorderSide(
            color: widget.isSelected ? AppColors.primary : AppColors.borderGrey,
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
          // ── Top row: image + name/sku/price + checkbox (return) ───
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProductImage(
                  imageUrl:
                      ServicesUrls.imageUrl + (widget.item.productImage ?? "")),

              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.productName,
                      style: AppTextStyle.interSemiBold14.copyWith(
                        color: AppColors.textHeading,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    4.verticalSpace,
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            'SKU: ${widget.item.itemCode}',
                            style: AppTextStyle.interRegular12.copyWith(
                              color: AppColors.blueGrey,
                            ),
                          ),
                        ),
                        2.horizontalSpace,
                        Text(
                          selectedPrice.toCurrency(),
                          style: AppTextStyle.interSemiBold14.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // if (widget.item.isReturn)
              //   const Icon(
              //     Icons.check_box,
              //     color: AppColors.primary,
              //     size: 22,
              //   ),
              12.horizontalSpace,
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
          12.verticalSpace,
          if (widget.isSelected)
            Row(
              children: [
                _UnitDropdown(
                  selectedUnit: safeUnit,
                  units: units,
                  onChanged: (unit) {
                    widget.onUnitChanged(unit);
                  },
                ),
                const Spacer(),
                QuantityStepper(
                  quantity: widget.quantity,
                  onDecrement: widget.onDecrement,
                  onIncrement: widget.onIncrement,
                  onManualChange: (value) {
                    ref
                        .read(newOrderControllerProvider.notifier)
                        .setQuantity(widget.item, value);
                  },
                  maxStock: widget.item.availableStock.toInt(),
                ),
              ],
            ),
          // ── Bottom row: stepper + delete ──────────────────────────
        ],
      ),
    );
  }
}
// ── Product image placeholder ─────────────────────────────────────────────────

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
          Icons.inventory_2,
          color: AppColors.textSecondary,
          size: 28,
        ),
      ),
    );
  }
}

class _UnitDropdown extends StatelessWidget {
  const _UnitDropdown({
    required this.selectedUnit,
    required this.units,
    required this.onChanged,
  });

  final String selectedUnit;
  final List<String> units;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 50,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.secondCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.borderGrey,
          width: 1,
        ),
      ),
      child: DropdownButton<String>(
        value: selectedUnit,

        // isExpanded: true,
        underline: const SizedBox(),
        icon: Icon(Icons.keyboard_arrow_down_sharp),
        iconSize: 16,
        items: units.map((unit) {
          return DropdownMenuItem(
            value: unit,
            child: Text(
              unit,
              style: AppTextStyle.interSemiBold14.copyWith(
                color: AppColors.textHeading,
              ),
            ).onlyPadding(end: 8),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) onChanged(value);
        },
      ),
    );
  }
}
