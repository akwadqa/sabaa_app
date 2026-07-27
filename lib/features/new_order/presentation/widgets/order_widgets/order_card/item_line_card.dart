// features/new_order/presentation/widgets/order_widgets/order_card/item_line_card.dart

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/new_order/domain/model/new_order_model.dart';
import 'package:sabaa/features/new_order/domain/model/order_item.dart';
import 'package:sabaa/features/new_order/presentation/controller/new_order_controller.dart';
import 'package:sabaa/src/infrastructure/api/endpoint/services_urls.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/features/van_stock/domain/model/product_model.dart';

import 'quantity_stepper.dart';

class ItemLineCard extends ConsumerWidget {
  const ItemLineCard({
    super.key,
    required this.line,
    required this.canDelete,
    required this.isOnlyLine,
  });

  final SelectedItemLine line;
  final bool canDelete;
  final bool isOnlyLine;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(newOrderControllerProvider.notifier);
    final item = line.product;
    final uoms = item.uoms.isNotEmpty
        ? item.uoms
        : [
            UomModel(
                uom: item.defaultUom ?? 'Pcs',
                price: item.price,
                availableStock: 0)
          ];

    final uomStrings = uoms.map((u) => u.uom).toList();
    final safeUnit =
        uomStrings.contains(line.unit) ? line.unit : uomStrings.first;
    final uomModel = uoms.firstWhere(
      (u) => u.uom == safeUnit,
      orElse: () => uoms.first,
    );
    final availableStock = uomModel.availableStock ?? 0;
    final effectivePrice = line.customRate ?? uomModel.price;

    final stockColor = availableStock == 0
        ? AppColors.red
        : availableStock <= 5
            ? Colors.orange
            : Colors.green[700]!;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: BorderDirectional(
          start: BorderSide(
            color: line.isAllFree ? Colors.green : AppColors.primary,
            width: 5,
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
          // ── TOP ROW: image + info + delete ────────────────────
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Same image widget as OrderItemCard
              _ProductImage(
                imageUrl: ServicesUrls.imageUrl + (item.productImage ?? ''),
              ),

              12.horizontalSpace,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name + delete button
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            item.productName,
                            style: AppTextStyle.interSemiBold14.copyWith(
                              color: AppColors.textHeading,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        12.horizontalSpace,
                        // ✅ Delete only if more than one line for this product
                        // if (canDelete)
                        GestureDetector(
                           onTap: () {
                            if (isOnlyLine) {
                              // ✅ Remove entire product
                              controller.removeItem(item.itemCode);
                            } else {
                              // ✅ Remove just this extra line
                              controller.removeLine(line.lineId, item.itemCode);
                            }
                          },
                          child: const Icon(
                            Icons.delete_outline_rounded,
                            color: AppColors.red,
                            size: 25,
                          ),
                        ),
                      ],
                    ),

                    8.verticalSpace,

                    // SKU + price row
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            'SKU: ${item.itemCode}',
                            style: AppTextStyle.interRegular12.copyWith(
                              color: AppColors.blueGrey,
                            ),
                          ),
                        ),
                        20.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (line.customRate != null &&
                                line.customRate != uomModel.price)
                              Text(
                                uomModel.price.toCurrency(),
                                style: AppTextStyle.interRegular12.copyWith(
                                  color: AppColors.blueGrey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            Text(
                              effectivePrice.toCurrency(),
                              style: AppTextStyle.interSemiBold14.copyWith(
                                color: line.customRate != null
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
            ],
          ),

          12.verticalSpace,

          // ── UOM DROPDOWN + STEPPER ROW ─────────────────────────
          Row(
            children: [
              _LineUomDropdown(
                uoms: uoms,
                selectedUom: safeUnit,
                onChanged: (uom) => controller.updateLineUnit(line.lineId, uom),
              ),
              const Spacer(),
              QuantityStepper(
                quantity: line.quantity,
                onDecrement: () {
                  if (line.quantity <= 1) return; // prevent going below 1
                  controller.updateLineQuantity(line.lineId, line.quantity - 1);
                },
                onIncrement: () => controller.updateLineQuantity(
                    line.lineId, line.quantity + 1),
                onManualChange: (qty) =>
                    controller.updateLineQuantity(line.lineId, qty),
                maxStock: availableStock,
              ),
            ],
          ),

          6.verticalSpace,

          // ── STOCK INDICATOR ────────────────────────────────────
          Row(
            children: [
              Icon(Icons.inventory_2_outlined, size: 12, color: stockColor),
              const SizedBox(width: 4),
              Text(
                '${'available_stock'.tr()}: $availableStock $safeUnit',
                style: AppTextStyle.interRegular12.copyWith(color: stockColor),
              ),
            ],
          ),

          10.verticalSpace,
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          10.verticalSpace,

          // ── FOC + ALL FREE ─────────────────────────────────────
          _LineFocSection(line: line),
        ],
      ),
    );
  }
}

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

// ── UOM Dropdown with stock badges ────────────────────────────────────────────

class _LineUomDropdown extends StatelessWidget {
  const _LineUomDropdown({
    required this.uoms,
    required this.selectedUom,
    required this.onChanged,
  });

  final List<UomModel> uoms;
  final String selectedUom;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final uomStrings = uoms.map((u) => u.uom).toList();
    final safeSelected =
        uomStrings.contains(selectedUom) ? selectedUom : uomStrings.first;

    return Container(
      height: 44,
      padding: const EdgeInsetsDirectional.only(start: 12, end: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderGrey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          value: safeSelected,
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
            height: 44,
            padding: EdgeInsets.symmetric(horizontal: 12),
          ),
          items: uoms.map((uomModel) {
            final stock = uomModel.availableStock ?? 0;
            final isOutOfStock = stock == 0;

            final stockColor = stock == 0
                ? AppColors.red
                : stock <= 5
                    ? Colors.orange
                    : Colors.green[700]!;

            return DropdownMenuItem<String>(
              value: uomModel.uom,
              enabled: !isOutOfStock,
              child: Opacity(
                opacity: isOutOfStock ? 0.45 : 1.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      uomModel.uom,
                      style: AppTextStyle.interSemiBold14
                          .copyWith(color: AppColors.textHeading),
                    ),
                    const SizedBox(width: 8),
                    // ✅ Stock badge per UOM
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: stockColor.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: stockColor.withOpacity(0.30)),
                      ),
                      child: Text(
                        '$stock',
                        style: AppTextStyle.interRegular12
                            .copyWith(color: stockColor),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
          onChanged: (v) {
            if (v != null) onChanged(v);
          },
        ),
      ),
    );
  }
}

// ── FOC + All Free section per line ───────────────────────────────────────────

class _LineFocSection extends ConsumerWidget {
  const _LineFocSection({required this.line});

  final SelectedItemLine line;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(newOrderControllerProvider.notifier);
    final item = line.product;
    final uoms = item.uoms;
    final uomStrings = uoms.map((u) => u.uom).toList();
    final selectedFocUom =
        line.focUom ?? (uomStrings.isNotEmpty ? uomStrings.first : 'Pcs');
    final focUomModel = uoms.firstWhere(
      (u) => u.uom == selectedFocUom,
      orElse: () => uoms.first,
    );
    final focStock = focUomModel.availableStock ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Checkboxes row ─────────────────────────────────────
        Row(
          children: [
            // FOC checkbox
            Opacity(
              opacity: line.isAllFree ? 0.38 : 1.0,
              child: IgnorePointer(
                ignoring: line.isAllFree,
                child: _CheckboxLabel(
                  value: line.isFocEnabled,
                  label: 'FOC',
                  activeColor: AppColors.primary,
                  onChanged: (v) =>
                      controller.updateLineFocToggle(line.lineId, v ?? false),
                ),
              ),
            ),

            const SizedBox(width: 20),

            // All Free checkbox
            Opacity(
              opacity: line.isFocEnabled ? 0.38 : 1.0,
              child: IgnorePointer(
                ignoring: line.isFocEnabled,
                child: _CheckboxLabel(
                  value: line.isAllFree,
                  label: 'all_free'.tr(),
                  activeColor: Colors.green[700]!,
                  onChanged: (v) =>
                      controller.updateLineAllFree(line.lineId, v ?? false),
                ),
              ),
            ),

            const Spacer(),

            // Active badge
            if (line.isAllFree)
              _LineBadge(
                label: 'all_free'.tr(),
                color: Colors.green[700]!,
                icon: Icons.card_giftcard_rounded,
              )
            else if (line.isFocEnabled)
              _LineBadge(
                label: 'FOC',
                color: AppColors.primary,
                icon: Icons.redeem_rounded,
              ),
          ],
        ),

        // ── FOC details (expanded) ──────────────────────────────
        if (line.isFocEnabled && !line.isAllFree) ...[
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.primary.withOpacity(0.2)),
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
                    // FOC UOM
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'foc_uom'.tr(),
                            style: AppTextStyle.interRegular12
                                .copyWith(color: AppColors.textSecondary),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.borderGrey),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                value: selectedFocUom,
                                isExpanded: true,
                                items: uoms.map((u) {
                                  final stock = u.availableStock ?? 0;
                                  final c = stock == 0
                                      ? AppColors.red
                                      : stock <= 5
                                          ? Colors.orange
                                          : Colors.green[700]!;
                                  return DropdownMenuItem(
                                    value: u.uom,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(u.uom,
                                            style: AppTextStyle.interRegular14),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: c.withOpacity(0.10),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Text('$stock',
                                              style: AppTextStyle.interRegular12
                                                  .copyWith(color: c)),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (v) => controller.updateLineFocUom(
                                    line.lineId, v!),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    // FOC Quantity
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'foc_quantity'.tr(),
                            style: AppTextStyle.interRegular12
                                .copyWith(color: AppColors.textSecondary),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.borderGrey),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(Icons.remove, size: 18),
                                  onPressed: line.focQuantity > 0
                                      ? () => controller.updateLineFocQuantity(
                                          line.lineId, line.focQuantity - 1)
                                      : null,
                                ),
                                Expanded(
                                  child: Text(
                                    '${line.focQuantity}',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.interSemiBold14,
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(Icons.add, size: 18),
                                  onPressed: line.focQuantity < focStock
                                      ? () => controller.updateLineFocQuantity(
                                          line.lineId, line.focQuantity + 1)
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
                Row(
                  children: [
                    Icon(Icons.inventory_2_outlined,
                        size: 11,
                        color:
                            focStock == 0 ? AppColors.red : Colors.green[700]),
                    const SizedBox(width: 4),
                    Text(
                      '${'available_stock'.tr()}: $focStock $selectedFocUom',
                      style: AppTextStyle.interRegular10
                          .copyWith(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],

        // ── All Free active banner ──────────────────────────────
        if (line.isAllFree) ...[
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.07),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.green.withOpacity(0.25)),
            ),
            child: Row(
              children: [
                Icon(Icons.card_giftcard_rounded,
                    size: 15, color: Colors.green[700]),
                const SizedBox(width: 8),
                Text(
                  'all_items_marked_free'.tr(),
                  style: AppTextStyle.interMedium14
                      .copyWith(color: Colors.green[700]),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

// ── Reusable checkbox + label ─────────────────────────────────────────────────

class _CheckboxLabel extends StatelessWidget {
  const _CheckboxLabel({
    required this.value,
    required this.label,
    required this.activeColor,
    required this.onChanged,
  });

  final bool value;
  final String label;
  final Color activeColor;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 22,
            height: 22,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: activeColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: BorderSide(
                color: value ? activeColor : AppColors.borderGrey,
                width: 1.5,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTextStyle.interSemiBold14.copyWith(
              color: value ? activeColor : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Badge ─────────────────────────────────────────────────────────────────────

class _LineBadge extends StatelessWidget {
  const _LineBadge({
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
