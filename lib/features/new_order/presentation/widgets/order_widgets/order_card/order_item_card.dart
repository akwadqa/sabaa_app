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
import '../../../../domain/model/order_item.dart';
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
    required this.isReturn,
    required this.onUnitChanged,
    required this.selectedUnit,
    this.allowEditPrice = false,
    this.customRate,
    this.onRateChanged,
    // FOC Parameters
    this.isFocEnabled = false,
    this.focUom,
    this.focQuantity = 0,
    this.onFocToggle,
    this.onFocUomChanged,
    this.onFocQuantityChanged,
    this.showFreeToggle = false,
    this.isAllFree = false, // ✅ NEW
    this.onAllFreeToggle,
    this.extraUomLines = const [],
  });
  final List<UomLine> extraUomLines;
  final bool isSelected;
  final bool isReturn;
  final ProductModel item;
  final int quantity;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  final VoidCallback onDelete;
  final Function(String) onUnitChanged;
  final String selectedUnit;
  final bool allowEditPrice;
  final double? customRate;
  final ValueChanged<double?>? onRateChanged;
  // FOC Fields
  final bool isFocEnabled;
  final String? focUom;
  final int focQuantity;
  final ValueChanged<bool>? onFocToggle;
  final ValueChanged<String>? onFocUomChanged;
  final ValueChanged<int>? onFocQuantityChanged;
  final bool showFreeToggle;
  final bool isAllFree;
  final ValueChanged<bool>? onAllFreeToggle;
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
        availableStock: widget.item.uoms.first.availableStock ?? 0,
      ),
    ];
  }

  Color get returnColor =>
      widget.isReturn ? AppColors.accent : AppColors.primary;

  @override
  Widget build(BuildContext context) {
    // ✅ Guard against empty uoms list
    if (widget.item.uoms.isEmpty) {
      return _buildErrorCard('Item has no units');
    }
    final uoms = _effectiveUoms();
    final units = uoms.map((e) => e.uom).toList();
    final safeUnit =
        units.contains(widget.selectedUnit) ? widget.selectedUnit : units.first;
    final defaultPrice = uoms
        .firstWhere((e) => e.uom == widget.selectedUnit,
            orElse: () => uoms.first)
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
            color: widget.isSelected ? returnColor : AppColors.borderGrey,
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
                  maxStock: uoms
                      .firstWhere(
                        (u) => u.uom == safeUnit,
                        orElse: () => uoms.first,
                      )
                      .availableStock,
                  isReturn: widget.isReturn,
                ),
              ],
            ),
// Extra UOM lines section
          if (widget.isSelected && widget.showFreeToggle) ...[
            const SizedBox(height: 10),
            _UomLinesSection(
              item: widget.item,
              mainUnit: widget.selectedUnit,
              extraLines: widget.extraUomLines, // ← new prop
            ),
          ],
          // ── FOC Section ─────────────────────────────────
          if (widget.isSelected && widget.showFreeToggle) ...[
            const SizedBox(height: 10),
            const Divider(height: 1, color: Color(0xFFEEEEEE)),
            const SizedBox(height: 10),
            _FocSection(
              isEnabled: widget.isFocEnabled,
              isAllFree: widget.isAllFree,
              focUom: widget.focUom,
              focQuantity: widget.focQuantity,
              mainQuantity: widget.quantity,
              availableUoms: widget.item.uoms,
              onToggle: widget.onFocToggle ?? (_) {},
              onAllFreeToggle: widget.onAllFreeToggle ?? (_) {},
              onUomChanged: widget.onFocUomChanged ?? (_) {},
              onQuantityChanged: widget.onFocQuantityChanged ?? (_) {},
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

class _AllFreeRow extends StatelessWidget {
  const _AllFreeRow({
    required this.isAllFree,
    required this.onToggle,
  });

  final bool isAllFree;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onToggle(!isAllFree),
      child: Row(
        children: [
          // ── Checkbox ──────────────────────────────────────────
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: isAllFree,
              onChanged: (v) => onToggle(v ?? false),
              activeColor: Colors.green[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: BorderSide(
                color: isAllFree ? Colors.green : AppColors.borderGrey,
                width: 1.5,
              ),
            ),
          ),
          const SizedBox(width: 10),

          // ── Label ─────────────────────────────────────────────
          Text(
            'all_free'.tr(),
            style: AppTextStyle.interSemiBold14.copyWith(
              color: isAllFree ? Colors.green[700] : AppColors.textSecondary,
            ),
          ),

          // const Spacer(),

          // // ── Badge shown when active ───────────────────────────
          // if (isAllFree)
          //   Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          //     decoration: BoxDecoration(
          //       color: Colors.green.withOpacity(0.10),
          //       borderRadius: BorderRadius.circular(20),
          //       border: Border.all(
          //         color: Colors.green.withOpacity(0.35),
          //       ),
          //     ),
          //     child: Row(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Icon(
          //           Icons.card_giftcard_rounded,
          //           size: 13,
          //           color: Colors.green[700],
          //         ),
          //         const SizedBox(width: 4),
          //         Text(
          //           'all_items_free'.tr(),
          //           style: AppTextStyle.interSemiBold12.copyWith(
          //             color: Colors.green[700],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
        ],
      ),
    );
  }
}

class _FocSection extends StatelessWidget {
  const _FocSection({
    required this.isEnabled,
    required this.isAllFree,
    required this.focUom,
    required this.focQuantity,
    required this.mainQuantity,
    required this.availableUoms,
    required this.onToggle,
    required this.onAllFreeToggle,
    required this.onUomChanged,
    required this.onQuantityChanged,
  });

  final bool isEnabled;
  final bool isAllFree;
  final String? focUom;
  final int focQuantity;
  final int mainQuantity;
  final List<UomModel> availableUoms;
  final ValueChanged<bool> onToggle;
  final ValueChanged<bool> onAllFreeToggle;
  final ValueChanged<String> onUomChanged;
  final ValueChanged<int> onQuantityChanged;

  @override
  Widget build(BuildContext context) {
    final uomList = availableUoms.map((e) => e.uom).toList();
    final selectedFocUom =
        focUom ?? (uomList.isNotEmpty ? uomList.first : 'Pcs');
    final uomStock = availableUoms.firstWhere(
      (u) => u.uom == selectedFocUom,
      orElse: () => availableUoms.first,
    );
    final availableStock = uomStock.availableStock ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Single row: FOC checkbox | All Free checkbox ───────────
        Row(
          children: [
            // ── FOC checkbox ───────────────────────────────────────
            Opacity(
              opacity: isAllFree ? 0.38 : 1.0,
              child: IgnorePointer(
                ignoring: isAllFree,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 22,
                      height: 22,
                      child: Checkbox(
                        value: isEnabled,
                        onChanged: (v) => onToggle(v ?? false),
                        activeColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: BorderSide(
                          color: isEnabled
                              ? AppColors.primary
                              : AppColors.borderGrey,
                          width: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'FOC',
                      style: AppTextStyle.interSemiBold14.copyWith(
                        color: isEnabled
                            ? AppColors.primary
                            : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 20),

            // ── All Free checkbox ──────────────────────────────────
            Opacity(
              opacity: isEnabled ? 0.38 : 1.0,
              child: IgnorePointer(
                ignoring: isEnabled,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 22,
                      height: 22,
                      child: Checkbox(
                        value: isAllFree,
                        onChanged: (v) => onAllFreeToggle(v ?? false),
                        activeColor: Colors.green[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: BorderSide(
                          color:
                              isAllFree ? Colors.green : AppColors.borderGrey,
                          width: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'all_free'.tr(),
                      style: AppTextStyle.interSemiBold14.copyWith(
                        color: isAllFree
                            ? Colors.green[700]
                            : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // ── Active badge (shows which mode is on) ──────────────
            if (isAllFree)
              _StatusBadge(
                label: 'all_free'.tr(),
                color: Colors.green,
                icon: Icons.card_giftcard_rounded,
              )
            else if (isEnabled)
              _StatusBadge(
                label: 'FOC',
                color: AppColors.primary,
                icon: Icons.redeem_rounded,
              ),
          ],
        ),

        // ── FOC expanded details ───────────────────────────────────
        AnimatedSize(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeInOut,
          child: (isEnabled && !isAllFree)
              ? Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.2),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'foc_details'.tr(),
                          style: AppTextStyle.interSemiBold12
                              .copyWith(color: AppColors.primary),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            // ── FOC UOM Dropdown ───────────────────
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'foc_uom'.tr(),
                                    style: AppTextStyle.interRegular12.copyWith(
                                        color: AppColors.textSecondary),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: AppColors.borderGrey),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2<String>(
                                        value: selectedFocUom,
                                        isExpanded: true,
                                        items: uomList.map((uom) {
                                          return DropdownMenuItem(
                                            value: uom,
                                            child: Text(
                                              uom,
                                              style:
                                                  AppTextStyle.interRegular14,
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (v) => onUomChanged(v!),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 12),

                            // ── FOC Quantity stepper ───────────────
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'foc_quantity'.tr(),
                                    style: AppTextStyle.interRegular12.copyWith(
                                        color: AppColors.textSecondary),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: AppColors.borderGrey),
                                    ),
                                    child: Row(
                                      children: [
                                        // Decrement
                                        IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: const Icon(Icons.remove,
                                              size: 18),
                                          onPressed: focQuantity > 0
                                              ? () => onQuantityChanged(
                                                  focQuantity - 1)
                                              : null,
                                        ),
                                        // Count
                                        Expanded(
                                          child: Text(
                                            '$focQuantity',
                                            textAlign: TextAlign.center,
                                            style: AppTextStyle.interSemiBold14,
                                          ),
                                        ),
                                        // Increment
                                        IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: const Icon(Icons.add, size: 18),
                                          onPressed:
                                              focQuantity < availableStock
                                                  ? () => onQuantityChanged(
                                                      focQuantity + 1)
                                                  : null,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${'available_stock'.tr()}: $availableStock $selectedFocUom',
                          style: AppTextStyle.interRegular10
                              .copyWith(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),

        // ── All Free active indicator ──────────────────────────────
        AnimatedSize(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeInOut,
          child: isAllFree
              ? Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.07),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.green.withOpacity(0.25),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.card_giftcard_rounded,
                          size: 15,
                          color: Colors.green[700],
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'all_items_marked_free'.tr(),
                          style: AppTextStyle.interMedium14.copyWith(
                            color: Colors.green[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

// ── Status badge ──────────────────────────────────────────────────────────────
class _UomLinesSection extends ConsumerWidget {
  const _UomLinesSection({
    required this.item,
    required this.mainUnit,
    required this.extraLines,
  });

  final ProductModel item;
  final String mainUnit;
  final List<UomLine> extraLines;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(newOrderControllerProvider.notifier);
    final allUoms = item.uoms;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Extra lines ───────────────────────────────────────────
        ...extraLines.asMap().entries.map((entry) {
          final index = entry.key;
          final line = entry.value;

          // ✅ Get full UomModel for this line to read availableStock
          final uomModel = allUoms.firstWhere(
            (u) => u.uom == line.uom,
            orElse: () => allUoms.first,
          );

          return Padding(
            padding: const EdgeInsets.only(top: 8),
            child: _UomLineRow(
              allUoms: allUoms,
              selectedUom: line.uom,
              quantity: line.quantity,
              availableStock: uomModel.availableStock ?? 0, // ✅ real stock
              onUomChanged: (uom) =>
                  controller.updateUomLineUnit(item.itemCode, index, uom),
              onQuantityChanged: (qty) =>
                  controller.updateUomLineQuantity(item.itemCode, index, qty),
              onDelete: () => controller.removeUomLine(item.itemCode, index),
            ),
          );
        }),

        // ── Add UOM button ────────────────────────────────────────
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => controller.addUomLine(item.itemCode),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.06),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.25),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add_circle_outline_rounded,
                  size: 16,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 6),
                Text(
                  'add_uom_line'.tr(),
                  style: AppTextStyle.interSemiBold12
                      .copyWith(color: AppColors.primary),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
// ── Single extra UOM line row ─────────────────────────────────────────────────

class _UomLineRow extends StatelessWidget {
  const _UomLineRow({
    super.key,
    required this.allUoms,
    required this.selectedUom,
    required this.quantity,
    required this.availableStock, // ✅ NEW
    required this.onUomChanged,
    required this.onQuantityChanged,
    required this.onDelete,
  });

  final List<UomModel> allUoms; // ✅ full model now, not just strings
  final String selectedUom;
  final int quantity;
  final int availableStock; // ✅ NEW
  final ValueChanged<String> onUomChanged;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final uomStrings = allUoms.map((u) => u.uom).toList();
    final safeSelected =
        uomStrings.contains(selectedUom) ? selectedUom : uomStrings.first;

    // ✅ Stock indicator color
    final stockColor = availableStock == 0
        ? AppColors.red
        : availableStock <= 5
            ? Colors.orange
            : Colors.green[700]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Main row: UOM dropdown | stepper | delete ─────────────
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.borderGrey),
          ),
          child: Row(
            children: [
              // ── UOM Dropdown ────────────────────────────────────
              Container(
                height: 36,
                padding: const EdgeInsetsDirectional.only(start: 10, end: 6),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.borderGrey),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    value: safeSelected,
                    isDense: true,
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 18,
                        color: AppColors.blueGrey,
                      ),
                    ),
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.zero,
                      height: 36,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      elevation: 4,
                      maxHeight: 200,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                    // ✅ Show each UOM with its stock in the dropdown
                    items: allUoms.map((uomModel) {
                      final stock = uomModel.availableStock ?? 0;
                      final itemStockColor = stock == 0
                          ? AppColors.red
                          : stock <= 5
                              ? Colors.orange
                              : Colors.green[700]!;

                      return DropdownMenuItem<String>(
                        value: uomModel.uom,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              uomModel.uom,
                              style: AppTextStyle.interSemiBold12
                                  .copyWith(color: AppColors.textHeading),
                            ),
                            const SizedBox(width: 8),
                            // ✅ Stock badge in dropdown
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: itemStockColor.withOpacity(0.10),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '$stock',
                                style: AppTextStyle.interRegular12
                                    .copyWith(color: itemStockColor),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (v) {
                      if (v != null) onUomChanged(v);
                    },
                  ),
                ),
              ),

              const Spacer(),

              // ── Quantity stepper ────────────────────────────────
              Row(
                children: [
                  _MiniStepButton(
                    icon: Icons.remove,
                    enabled: quantity > 1,
                    onTap: () => onQuantityChanged(quantity - 1),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 44,
                    height: 34,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.borderGrey),
                    ),
                    child: Text(
                      '$quantity',
                      style: AppTextStyle.interSemiBold14
                          .copyWith(color: AppColors.textPrimary),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 6),
                  _MiniStepButton(
                    icon: Icons.add,
                    // ✅ Respect available stock
                    enabled: quantity < availableStock,
                    onTap: () => onQuantityChanged(quantity + 1),
                  ),
                ],
              ),

              const SizedBox(width: 10),

              // ── Delete line ─────────────────────────────────────
              GestureDetector(
                onTap: onDelete,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColors.red.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.close_rounded,
                    size: 16,
                    color: AppColors.red,
                  ),
                ),
              ),
            ],
          ),
        ),

        // ✅ Available stock shown below the row
        Padding(
          padding: const EdgeInsets.only(top: 4, left: 4),
          child: Row(
            children: [
              Icon(
                Icons.inventory_2_outlined,
                size: 11,
                color: stockColor,
              ),
              const SizedBox(width: 4),
              Text(
                '${'available_stock'.tr()}: $availableStock $selectedUom',
                style: AppTextStyle.interRegular12.copyWith(
                  color: stockColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
// ── Mini step button for UOM lines ────────────────────────────────────────────

class _MiniStepButton extends StatelessWidget {
  const _MiniStepButton({
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
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: enabled
              ? AppColors.primary.withOpacity(0.10)
              : AppColors.background,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: enabled
                ? AppColors.primary.withOpacity(0.30)
                : AppColors.borderGrey,
          ),
        ),
        child: Icon(
          icon,
          size: 14,
          color: enabled ? AppColors.primary : AppColors.textSecondary,
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({
    required this.label,
    required this.color,
    required this.icon,
  });

  final String label;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.10),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.30)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTextStyle.interSemiBold12.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}

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
                  color: _isExpanded ? Colors.green : AppColors.borderGrey,
                  width: 1.5,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'free_items'.tr(),
              style: AppTextStyle.interMedium14.copyWith(
                color:
                    _isExpanded ? Colors.green[700] : AppColors.textSecondary,
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
          color:
              enabled ? Colors.green.withOpacity(0.12) : AppColors.background,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                enabled ? Colors.green.withOpacity(0.35) : AppColors.borderGrey,
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
