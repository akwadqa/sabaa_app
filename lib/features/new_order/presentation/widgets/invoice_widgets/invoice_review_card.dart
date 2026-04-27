import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class InvoiceItemUI {
  final String name;
  final int count;
  final String total;

  InvoiceItemUI({
    required this.name,
    required this.count,
    required this.total,
  });
}

class InvoiceReviewCard extends StatelessWidget {
  const InvoiceReviewCard({
    super.key,
    required this.items,
    required this.subtotal,
    required this.tax,
    required this.total,
  });

  final List<InvoiceItemUI> items;
  final String subtotal;
  final String tax;
  final String total;

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.sizeOf(context).height / 3.3;
    return AnimatedContainer(
      // height:MediaQuery.sizeOf(context).height /1.5 ,
        constraints: BoxConstraints(
    maxHeight: MediaQuery.sizeOf(context).height * 0.65, // 🔥 max only
    minHeight: MediaQuery.sizeOf(context).height * 0.4, // 🔥 max only

  ),

      // padding: const EdgeInsets.all(14),
      duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),

      curve: Curves.easeInOut,
      decoration: BoxDecoration(
          color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: BorderDirectional(
          start: BorderSide(
            color: AppColors.primary,
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
              return _ItemRow(item: items[index]);
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
            
          /// ── TAX ───────────────────────────
          _AmountRow(
            title: 'tax',
            value: tax,
          ),
            
           16.verticalSpace,
            
          _DashedDivider(),
            
           16.verticalSpace,
            
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
        Expanded(
          flex: 8,
          child: Text(
            'selected_items'.tr(),
            style: AppTextStyle.interBold12.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
        Spacer(),
        Expanded(
          flex: 3,
          child: Text(
            'count'.tr(),
            style: AppTextStyle.interBold12.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),

        // const SizedBox(width: 24),
        Expanded(
          flex: 2,
          child: Text(
            'total'.tr(),
            style: AppTextStyle.interBold12.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}

class _ItemRow extends StatelessWidget {
  const _ItemRow({required this.item});

  final InvoiceItemUI item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 10,
            child: Text(
              item.name,
              style: AppTextStyle.interRegular14.copyWith(
                color: AppColors.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          Expanded(
            flex: 2,
            child: Text(
              '${item.count}',
              style: AppTextStyle.interSemiBold14.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              item.total,
              style: AppTextStyle.interSemiBold14.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
