import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/src/infrastructure/api/endpoint/services_urls.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';

import '../../../../../van_stock/domain/model/product_model.dart';
import '../../../../domain/model/new_order_model.dart';
import '../../../controller/new_order_controller.dart';
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
    this.allowEditPrice = false,
    this.customRate,
    this.onRateChanged,
        this.freeQuantity = 0,        // ✅ NEW
    this.onFreeQuantityChanged,   // ✅ NEW
    this.showFreeToggle = false,  // ✅ NEW — only show in summary page
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
  final bool allowEditPrice;
  final double? customRate;
  final ValueChanged<double?>? onRateChanged;
    final int freeQuantity;                      // ✅ NEW
  final ValueChanged<int>? onFreeQuantityChanged; // ✅ NEW
  final bool showFreeToggle;   
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


  double getPriceByUom(OrderProductModel product, String selectedUom) {
    if (product.uoms.isEmpty) return 0.0; // ✅ Guard

    final uom = product.uoms.firstWhere(
      (e) => e.uom == selectedUom,
      orElse: () => product.uoms.first,
    );
    return uom.price;
  }

  List<UomModel> _effectiveUoms() {
    if (widget.item.uoms.isNotEmpty) return widget.item.uoms;

    // ✅ Fallback: create one UOM from defaultUom + price
    return [
      UomModel(
        uom: widget.item.defaultUom ?? 'Pcs',
        price: widget.item.price,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Guard against empty uoms list
    if (widget.item.uoms.isEmpty) {
      return _buildErrorCard('Item has no units');
    }
    final uoms = _effectiveUoms();
    final units = uoms.map((e) => e.uom).toList();

    // final units = widget.item.uoms.map((e) => e.uom).toList();
    final safeUnit =
        units.contains(widget.selectedUnit) ? widget.selectedUnit : units.first;
    final defaultPrice = uoms
        .firstWhere(
          (e) => e.uom == widget.selectedUnit,
          orElse: () => uoms.first, // safe now — checked above
        )
        .price;

    final effectivePrice = widget.customRate ?? defaultPrice;
    final qty = widget.quantity;
    final total = effectivePrice * qty;
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
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            widget.item.productName,
                            style: AppTextStyle.interSemiBold14.copyWith(
                              color: AppColors.textHeading,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
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
                    8.verticalSpace,
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'SKU: ${widget.item.itemCode}',
                            style: AppTextStyle.interRegular12.copyWith(
                              color: AppColors.blueGrey,
                            ),
                          ),
                        ),
                        20.horizontalSpace,
                        // ✅ Show effective price (custom OR default)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // If there's a custom rate, show old price with strike-through
                            if (widget.customRate != null &&
                                widget.customRate != defaultPrice)
                              Text(
                                defaultPrice.toCurrency(),
                                style: AppTextStyle.interRegular12.copyWith(
                                  color: AppColors.blueGrey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            Text(
                              effectivePrice
                                  .toCurrency(), // ✅ uses custom or default
                              style: AppTextStyle.interSemiBold14.copyWith(
                                color: widget.customRate != null
                                    ? AppColors.accent
                                    : AppColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
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
                  maxStock: int.tryParse(
                        (widget.item.availableStock).split(" ").firstOrNull ??
                            '0',
                      ) ??
                      999,
                ),
              ],
            ),
              // ── Free Items Toggle ─────────────────────────────────
    if (widget.isSelected && widget.showFreeToggle) ...[
      const SizedBox(height: 10),
      const Divider(height: 1, color: Color(0xFFEEEEEE)),
      const SizedBox(height: 10),
      _FreeItemsRow(
        totalQuantity: widget.quantity,
        freeQuantity: widget.freeQuantity,
        onFreeQuantityChanged: widget.onFreeQuantityChanged ?? (_) {},
      ),
    ],

          // ── Bottom row: stepper + delete ──────────────────────────
          if (widget.allowEditPrice && widget.isSelected) ...[
            const SizedBox(height: 8),
            _EditableRateField(
              itemCode: widget.item.itemCode,
              defaultRate: defaultPrice,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildErrorCard(String message) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.errorRed),
      ),
      child: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: AppColors.errorRed),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '${widget.item.productName}: $message',
              style: AppTextStyle.interRegular14
                  .copyWith(color: AppColors.errorRed),
            ),
          ),
        ],
      ),
    );
  }
}
// at the bottom of order_item_card.dart OR as a separate file

// Inside order_item_card.dart (or wherever _EditableRateField is)

class _EditableRateField extends ConsumerStatefulWidget {
  const _EditableRateField({
    required this.itemCode,
    required this.defaultRate,
  });

  final String itemCode;
  final double defaultRate;

  @override
  ConsumerState<_EditableRateField> createState() => _EditableRateFieldState();
}

class _EditableRateFieldState extends ConsumerState<_EditableRateField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final state = ref.read(newOrderControllerProvider).value;
    final selected = state?.selectedItems[widget.itemCode];
    final initial = selected?.customRate ?? widget.defaultRate;
    _controller = TextEditingController(text: initial.toStringAsFixed(2));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.navBorder),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.edit_outlined,
            color: AppColors.accent,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            'rate'.tr(),
            style: AppTextStyle.interMedium14.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: _controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              textAlign: TextAlign.end,
              style: AppTextStyle.interSemiBold14.copyWith(
                color: AppColors.textPrimary,
              ),
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                suffixText: 'QAR',
                suffixStyle: AppTextStyle.interRegular12.copyWith(
                  color: AppColors.blueGrey,
                ),
              ),
              onChanged: (value) {
                final parsed = double.tryParse(value);
                // ✅ Update controller state directly
                ref
                    .read(newOrderControllerProvider.notifier)
                    .updateRate(widget.itemCode, parsed);
              },
            ),
          ),
        ],
      ),
    );
  }
}
// ── Free Items Row ────────────────────────────────────────────────────────────
// Add this private class at the bottom of order_item_card.dart

class _FreeItemsRow extends StatefulWidget {
  const _FreeItemsRow({
    required this.totalQuantity,
    required this.freeQuantity,
    required this.onFreeQuantityChanged,
  });

  final int totalQuantity;
  final int freeQuantity;
  final ValueChanged<int> onFreeQuantityChanged;

  @override
  State<_FreeItemsRow> createState() => _FreeItemsRowState();
}

class _FreeItemsRowState extends State<_FreeItemsRow> {
  late TextEditingController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.freeQuantity > 0;
    _controller = TextEditingController(
      text: widget.freeQuantity > 0 ? widget.freeQuantity.toString() : '',
    );
  }

  @override
  void didUpdateWidget(_FreeItemsRow oldWidget) {
    super.didUpdateWidget(oldWidget);

    // ── Sync when parent total quantity changes (user changed qty) ──
    if (oldWidget.totalQuantity != widget.totalQuantity) {
      final current = int.tryParse(_controller.text) ?? 0;
      // Clamp free qty if total decreased below current free qty
      if (current > widget.totalQuantity) {
        final clamped = widget.totalQuantity;
        _controller.text = clamped.toString();
        widget.onFreeQuantityChanged(clamped);
      }
    }

    // ── Sync if external reset (e.g. item removed then re-added) ──
    if (oldWidget.freeQuantity != widget.freeQuantity &&
        widget.freeQuantity == 0 &&
        _isExpanded) {
      setState(() {
        _isExpanded = false;
        _controller.clear();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // ── Checkbox toggled ──────────────────────────────────────────────────────

  void _onToggle(bool? checked) {
    final isChecked = checked ?? false;
    setState(() => _isExpanded = isChecked);

    if (!isChecked) {
      _controller.clear();
      widget.onFreeQuantityChanged(0);
    } else {
      // Default: 1 free item when first enabled
      final defaultFree = 1.clamp(0, widget.totalQuantity);
      _controller.text = defaultFree.toString();
      widget.onFreeQuantityChanged(defaultFree);
    }
  }

  // ── Stepper buttons ───────────────────────────────────────────────────────

  void _increment() {
    final current = int.tryParse(_controller.text) ?? 0;
    if (current >= widget.totalQuantity) return;
    final next = current + 1;
    _controller.text = next.toString();
    widget.onFreeQuantityChanged(next);
  }

  void _decrement() {
    final current = int.tryParse(_controller.text) ?? 0;
    if (current <= 0) return;
    final next = current - 1;
    if (next == 0) {
      // Auto-collapse when reaching 0
      setState(() {
        _isExpanded = false;
        _controller.clear();
      });
      widget.onFreeQuantityChanged(0);
    } else {
      _controller.text = next.toString();
      widget.onFreeQuantityChanged(next);
    }
  }

  // ── Manual text input ─────────────────────────────────────────────────────

  void _onTextChanged(String value) {
    final parsed = int.tryParse(value) ?? 0;
    final clamped = parsed.clamp(0, widget.totalQuantity);

    // Auto-correct if out of range
    if (parsed != clamped) {
      _controller.text = clamped.toString();
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    }

    widget.onFreeQuantityChanged(clamped);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Checkbox + label row ────────────────────────────────────
        Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                value: _isExpanded,
                onChanged: _onToggle,
                activeColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: BorderSide(
                  color: _isExpanded
                      ? Colors.green
                      : AppColors.borderGrey,
                  width: 1.5,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'free_items'.tr(),
              style: AppTextStyle.interMedium14.copyWith(
                color: _isExpanded ? Colors.green[700] : AppColors.textSecondary,
              ),
            ),
            const Spacer(),
            // Show max hint when expanded
            if (_isExpanded)
              Text(
                '${'max'.tr()}: ${widget.totalQuantity}',
                style: AppTextStyle.interRegular12.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
          ],
        ),

        // ── Expandable stepper row ──────────────────────────────────
        AnimatedSize(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeInOut,
          child: _isExpanded
              ? Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      // Free badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.10),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.green.withOpacity(0.35),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.card_giftcard_rounded,
                              size: 13,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'free'.tr(),
                              style: AppTextStyle.interSemiBold12.copyWith(
                                color: Colors.green[700],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      // ── Stepper: − [input] + ──────────────────────
                      Row(
                        children: [
                          // Decrement
                          _StepButton(
                            icon: Icons.remove,
                            onTap: _decrement,
                            enabled: (int.tryParse(_controller.text) ?? 0) > 0,
                          ),

                          const SizedBox(width: 6),

                          // Input field
                          Container(
                            width: 52,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.green.withOpacity(0.4),
                              ),
                            ),
                            child: TextField(
                              controller: _controller,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.interSemiBold14.copyWith(
                                color: Colors.green[800],
                              ),
                              decoration: const InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 9,
                                ),
                              ),
                              onChanged: _onTextChanged,
                            ),
                          ),

                          const SizedBox(width: 6),

                          // Increment
                          _StepButton(
                            icon: Icons.add,
                            onTap: _increment,
                            enabled: (int.tryParse(_controller.text) ?? 0) <
                                widget.totalQuantity,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

// ── Small step button ─────────────────────────────────────────────────────────

class _StepButton extends StatelessWidget {
  const _StepButton({
    required this.icon,
    required this.onTap,
    this.enabled = true,
  });

  final IconData icon;
  final VoidCallback onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: enabled
              ? Colors.green.withOpacity(0.12)
              : AppColors.background,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: enabled
                ? Colors.green.withOpacity(0.35)
                : AppColors.borderGrey,
          ),
        ),
        child: Icon(
          icon,
          size: 16,
          color: enabled ? Colors.green[700] : AppColors.textSecondary,
        ),
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
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsetsDirectional.only(start: 12, end: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.borderGrey,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          value: selectedUnit,
          isDense: true,
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 20,
              color: AppColors.blueGrey,
            ),
          ),
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.zero,
            height: 44,
          ),
          dropdownStyleData: DropdownStyleData(
            elevation: 4,
            maxHeight: 220,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 42,
            padding: EdgeInsets.symmetric(horizontal: 12),
          ),
          items: units.map((unit) {
            return DropdownMenuItem<String>(
              value: unit,
              child: Text(
                unit,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.interSemiBold14.copyWith(
                  color: AppColors.textHeading,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
        ),
      ),
    );
  }
}
