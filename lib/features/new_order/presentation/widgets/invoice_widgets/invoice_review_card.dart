import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/features/new_order/presentation/controller/new_order_state.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class InvoiceItemUI {
  final String name;
  final int count;
  final String total;
  final String uom;
  final String pricePerItem; // price of one item
  final int focQuantity; // ✅ NEW
  final int? paidCount;
  final String? focUom;
  final bool isAllFree;
  final int freeQuantity;
  final String? originalPricePerItem;
  InvoiceItemUI({
    required this.name,
    required this.count,
    required this.total,
    required this.uom,
    required this.pricePerItem,
    this.focQuantity = 0,
    this.paidCount,
    this.focUom,
    this.isAllFree = false,
    this.freeQuantity = 0,
    this.originalPricePerItem,
  });
}

class InvoiceReviewCard extends StatelessWidget {
  const InvoiceReviewCard({
    super.key,
    required this.items,
    required this.subtotal,
    required this.deliveyFee,
    required this.total,
    this.discountType,
    this.discountValue,
    this.discountAmount,
    this.isReturn=false,
  });

  final List<InvoiceItemUI> items;
  final String subtotal;
  final String? deliveyFee;
  final String total;
  final DiscountType? discountType;
  final double? discountValue;
  final String? discountAmount;
  final bool isReturn;

  bool get _hasDiscount =>
      discountType != null && discountValue != null && discountValue! > 0;

  String get _discountLabel {
    if (!_hasDiscount) return '';
    if (discountType == DiscountType.percentage) {
      final formatted = discountValue! % 1 == 0
          ? discountValue!.toInt().toString()
          : discountValue!.toStringAsFixed(2);
      return '$formatted%';
    } else {
      final formatted = discountValue! % 1 == 0
          ? discountValue!.toInt().toString()
          : discountValue!.toStringAsFixed(2);
      return '$formatted QAR';
    }
  }
Color get returnColor=>isReturn?AppColors.accent:AppColors.primary;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.65, // 🔥 max only
        minHeight: MediaQuery.sizeOf(context).height * 0.4, // 🔥 max only
      ),
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: BorderDirectional(
          start: BorderSide(
            color: returnColor,
            width: 8,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ── HEADER ─────────────────────────
          _Header(),
          12.verticalSpace,

          Divider(color: AppColors.background),

          14.verticalSpace,

          /// ── TABLE HEADER ───────────────────
          _TableHeader(),
          16.verticalSpace,

          /// ── ITEMS ───────────────────────────
          // Flexible(
          //   child: ConstrainedBox(
          //     constraints: BoxConstraints(
          //       maxHeight: MediaQuery.sizeOf(context).height * 0.35,
          //     ),
          //     child: ListView.builder(
          //       itemCount: items.length,
          //       shrinkWrap: true,
          //       physics: const BouncingScrollPhysics(),
          //       itemBuilder: (context, index) {
          //         return _InvoiceItemRow(item: items[index]);
          //       },
          //     ),
          //   ),
          // ),

          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.35,
              ),
              child: ListView.builder(
                itemCount: items.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = items[index];
                  final isLast = index == items.length - 1;

                  // ✅ Show divider only when next item is a different product
                  final isLastOfProduct =
                      isLast || items[index + 1].name != item.name;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _InvoiceItemRow(item: item),

                      // ✅ Thin divider between different products only
                      if (isLastOfProduct && !isLast)
                        const Divider(
                          height: 8,
                          thickness: 0.8,
                          color: Color(0xFFEEEEEE),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
          // SizedBox(
          //   height: items.length < 5
          //       ? null
          //       : maxHeight, // 🔥 control scroll area
          //   child: ListView.builder(
          //     itemCount: items.length,
          //     shrinkWrap: items.length <= 5,
          //     physics: items.length <= 5
          //         ? const NeverScrollableScrollPhysics()
          //         : const BouncingScrollPhysics(),
          //     itemBuilder: (context, index) {
          //       final item = items[index];

          //       return _ItemRow(item: item);
          //     },
          //   ),
          // ),
          16.verticalSpace,

          /// ── DASHED DIVIDER ─────────────────
          _DashedDivider(),

          16.verticalSpace,

          /// ── AMOUNT HEADER ──────────────────
          _AmountHeader(),

          12.verticalSpace,

          /// ── SUBTOTAL ───────────────────────
          _AmountRow(
            title: 'subtotal',
            value: subtotal,
          ),

          8.verticalSpace,

          /// ── deliveyFee ───────────────────────────
          if (deliveyFee != null)
            _AmountRow(
              title: 'delivery_fee',
              value: deliveyFee!,
            ),

          16.verticalSpace,

          _DashedDivider(),

          16.verticalSpace,

          /// ── DISCOUNT ROW ───────────────────  ✅ NEW
          if (_hasDiscount) ...[
            8.verticalSpace,
            _DiscountRow(
              label: _discountLabel,
              amount: discountAmount ?? '0',
            ),
            16.verticalSpace,
            _DashedDivider(),
            16.verticalSpace,
          ],

          /// ── TOTAL ─────────────────────────
          _TotalRow(total: total),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'invoice'.tr(),
        style: AppTextStyle.interSemiBold20.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Item name
        Expanded(
          flex: 6,
          child: Text(
            'selected_items'.tr(),
            style: AppTextStyle.interBold12.copyWith(color: AppColors.primary),
          ),
        ),

        // UOM
        SizedBox(
          width: 38,
          child: Text(
            'uom'.tr(),
            style: AppTextStyle.interBold12.copyWith(color: AppColors.primary),
            textAlign: TextAlign.center,
          ),
        ),

        const SizedBox(width: 6),

        // Qty × Price
        Expanded(
          flex: 4,
          child: Text(
            'qty'.tr(), // e.g. "Qty × Price"
            style: AppTextStyle.interBold12.copyWith(color: AppColors.primary),
            textAlign: TextAlign.center,
          ),
        ),

        const SizedBox(width: 6),

        // Total
        SizedBox(
          width: 60,
          child: Text(
            'total'.tr(),
            style: AppTextStyle.interBold12.copyWith(color: AppColors.primary),
            // textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

// ── Item Row ────────────────────────────────────────────────────────────────
class _InvoiceItemRow extends StatelessWidget {
  final InvoiceItemUI item;

  const _InvoiceItemRow({required this.item});

  @override
  Widget build(BuildContext context) {
    final hasFoc = item.focQuantity > 0;
    final paidQty = item.paidCount ?? item.count;
    final hasFree = item.freeQuantity > 0;

    final allFoc = paidQty == 0 && hasFoc;
    final allFree = item.isAllFree || (paidQty == 0 && hasFree);

    // ── Case 1: All Free — single green row, no paid row ──────────
    if (item.isAllFree) {
      return _ItemLine(
        name: item.name,
        uom: item.uom,
        quantity: item.count,
        pricePerItem: '0.00',
        total: '0.00',
        isFoc: true,
      );
    }

    // ── Case 2: Normal + FOC (different UOM) ──────────────────────
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Paid row — always shown when not all free
        _ItemLine(
          name: item.name,
          uom: item.uom,
          quantity: paidQty,
          pricePerItem: item.pricePerItem,
          total: item.total,
          isFoc: false,
          originalPricePerItem: item.originalPricePerItem, // ✅ pass it
        ),

        // FOC row — shown only when FOC is enabled with quantity
        if (hasFoc)
          _ItemLine(
            name: item.name,
            uom: item.focUom ?? item.uom, // ✅ use FOC uom (can differ)
            quantity: item.focQuantity,
            pricePerItem: '0.00',
            total: '0.00',
            isFoc: true,
          ),
      ],
    );
  }
}
// ── Single line ───────────────────────────────────────────────────────────────

class _ItemLine extends StatelessWidget {
  const _ItemLine({
    required this.name,
    required this.uom,
    required this.quantity,
    required this.pricePerItem,
    required this.total,
    required this.isFoc,
    this.originalPricePerItem,
  });

  final String name;
  final String uom;
  final int quantity;
  final String pricePerItem; // ✅ always required now
  final String total;
  final bool isFoc;
  final String? originalPricePerItem;
  @override
  Widget build(BuildContext context) {
    // ── Colors ──────────────────────────────────────────────────────────────
    final Color nameColor = isFoc ? Colors.green[700]! : AppColors.textPrimary;
    final Color metaColor =
        isFoc ? Colors.green[600]! : AppColors.textSecondary;
    final Color totalColor = isFoc ? Colors.green[700]! : AppColors.textPrimary;

    // ── Text styles ──────────────────────────────────────────────────────────
    final TextStyle nameStyle = isFoc
        ? AppTextStyle.interMedium12.copyWith(color: nameColor)
        : AppTextStyle.interSemiBold14.copyWith(color: nameColor);

    final TextStyle metaStyle =
        AppTextStyle.interRegular12.copyWith(color: metaColor);

    final TextStyle qtyPriceStyle = isFoc
        ? AppTextStyle.interMedium12.copyWith(color: metaColor)
        : AppTextStyle.interSemiBold12.copyWith(color: metaColor);

    final TextStyle totalStyle = isFoc
        ? AppTextStyle.interMedium12.copyWith(color: totalColor)
        : AppTextStyle.interSemiBold14.copyWith(color: totalColor);
    final bool hasPriceChange = originalPricePerItem != null;

    return Container(
      color: isFoc ? Colors.green.withOpacity(0.05) : Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ── Name ────────────────────────────────────────────────────────
          Expanded(
            flex: 6,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (isFoc) ...[
                  Icon(
                    Icons.card_giftcard_rounded,
                    size: 12,
                    color: Colors.green[600],
                  ),
                  const SizedBox(width: 4),
                ],
                Expanded(
                  child: Text(
                    isFoc ? '$name (${'FOC'.tr()})' : name,
                    style: nameStyle,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          // ── UOM ─────────────────────────────────────────────────────────
          SizedBox(
            width: 38,
            child: Text(
              uom,
              style: metaStyle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),

          const SizedBox(width: 6),

          // ── Qty × Price ──────────────────────────────────────────────────
          // Uses Expanded so long prices never overflow
          // Expanded(
          //   flex: 4,
          //   child: Text(
          //     '$quantity × $pricePerItem',
          //     style: qtyPriceStyle,
          //     textAlign: TextAlign.center,
          //     maxLines: 1,
          //     overflow: TextOverflow.ellipsis,
          //   ),
          // ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // ✅ Show original price struck through if price was changed
                // if (hasPriceChange)
                //   Text(
                //     '$quantity × $originalPricePerItem',
                //     style: AppTextStyle.interRegular10.copyWith(
                //       color: AppColors.textGrey,
                //       decoration: TextDecoration.lineThrough,
                //     ),
                //     textAlign: TextAlign.center,
                //     maxLines: 1,
                //     overflow: TextOverflow.ellipsis,
                //   ),

                // ✅ Effective price (highlighted if changed)
                Text(
                  '$quantity × $pricePerItem',
                  style: qtyPriceStyle.copyWith(
                    color: hasPriceChange ? AppColors.accent : metaColor,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          const SizedBox(width: 6),

          // ── Total ────────────────────────────────────────────────────────
          SizedBox(
            width: 60,
            child: Text(
              total,
              style: totalStyle,
              // textAlign: TextAlign.end,
              maxLines: 1,
              // overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// class _ItemRow extends StatelessWidget {
//   const _ItemRow({required this.item});

//   final InvoiceItemUI item;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             flex: 7,
//             child: Text(
//               item.name,
//               style: AppTextStyle.interRegular14.copyWith(
//                 color: AppColors.textPrimary,
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           Spacer(),
//           // ── UOM column ──
//           SizedBox(
//             width: 30,
//             child: Text(
//               item.uom,
//               style: AppTextStyle.interSemiBold14.copyWith(
//                 color: AppColors.textSecondary,
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           Spacer(),
//           FittedBox(
//             // flex: 2,
//             child: SizedBox(
//               width: 100,
//               child: Text(
//                 '${item.count} X ${item.pricePerItem}',
//                 style: AppTextStyle.interSemiBold12.copyWith(
//                   color: AppColors.textSecondary,
//                 ),
//               ),
//             ),
//           ),
//           Spacer(),
//           Expanded(
//             flex: 3,
//             child: Text(
//               item.total,
//               style: AppTextStyle.interSemiBold14.copyWith(
//                 color: AppColors.textSecondary,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _AmountHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'amount_details'.tr(),
          style: AppTextStyle.interBold12.copyWith(
            color: AppColors.primary,
          ),
        ),
        Text(
          'net_amount'.tr(),
          style: AppTextStyle.interBold12.copyWith(
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}

class _AmountRow extends StatelessWidget {
  const _AmountRow({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.tr(),
          style: AppTextStyle.interRegular14.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          value,
          style: AppTextStyle.interSemiBold14.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _DiscountRow extends StatelessWidget {
  const _DiscountRow({
    required this.label,
    required this.amount,
  });

  final String label;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'discount'.tr(),
              style: AppTextStyle.interRegular14.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                label,
                style: AppTextStyle.interSemiBold12.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        Text(
          '- $amount',
          style: AppTextStyle.interSemiBold14.copyWith(
            color: AppColors.errorRed,
          ),
        ),
      ],
    );
  }
}

class _TotalRow extends StatelessWidget {
  const _TotalRow({required this.total});

  final String total;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'total_amount'.tr(),
          style: AppTextStyle.interBold12.copyWith(
            color: AppColors.primary,
          ),
        ),
        Text(
          total,
          style: AppTextStyle.interBold20.copyWith(
            color: AppColors.dark,
          ),
        ),
      ],
    );
  }
}

class _DashedDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dashWidth = 6.0;
        final dashCount = (constraints.maxWidth / (dashWidth * 2)).floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return Container(
              width: dashWidth,
              height: 1,
              color: AppColors.grayBorder,
            );
          }),
        );
      },
    );
  }
}
