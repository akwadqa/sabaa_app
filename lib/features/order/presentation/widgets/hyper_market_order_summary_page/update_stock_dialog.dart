import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/order/domain/hyper_market_order_summary/hyper_market_order_summary_model.dart';
import 'package:sabaa/features/order/presentation/controller/hyper_market_order_controller.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class UpdateStockDialog extends ConsumerWidget {
  final HyperMarketStockItemModel stockItem;
  final String visitId;

  const UpdateStockDialog(
      {super.key, required this.stockItem, required this.visitId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputList = ref.watch(hyperMarketOrderControllerProvider
        .select((state) => state.value!.stockUpdateInputs));

    return AlertDialog(
      backgroundColor: const Color(0xffF7F9FC),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      content: SizedBox(
        width: 335,
        // تحديد أقصى ارتفاع للديالوج لمنع الخروج عن الشاشة وجعل السحب داخلي
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header: Title & Close Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 24), // موازن بصري لعنوان المنتصف
                Text('update_stock'.tr(), style: AppTextStyle.rubikBold20),
                IconButton(
                  icon: const Icon(Icons.close, size: 20, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 22),

            // Total Stock Indicator Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xffE6ECF7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('total_stock'.tr(),
                      style: AppTextStyle.rubikSemiBold14
                          .copyWith(color: AppColors.textSecondary)),
                  Text(
                    stockItem.totalQty,
                    style: AppTextStyle.rubikBold14
                        .copyWith(color: AppColors.primary),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),

            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(inputList.length, (index) {
                    final item = inputList[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index > 0)
                          const Divider(height: 40, color: Color(0xffDBE0E6)),

                        // 1. Select Unit Dropdown
                        Text(
                          'select_unit'.tr(),
                          style: AppTextStyle.rubikSemiBold16,
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xffDBE0E6)),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: item.selectedUnit ??
                                  stockItem.availableUoms.first,
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down,
                                  color: Color(0xff878787)),
                              items:
                                  stockItem.availableUoms.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: AppTextStyle.rubikRegular16
                                          .copyWith(
                                              color: AppColors.textSecondary)),
                                );
                              }).toList(),
                              onChanged: (val) {
                                if (val != null)
                                  ref
                                      .read(hyperMarketOrderControllerProvider
                                          .notifier)
                                      .changeUnitForFiled(index, val);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),

                        // 2. Expiry Date Picker
                        Text(
                          'expiry_date'.tr(),
                          style: AppTextStyle.rubikSemiBold16,
                        ),
                        const SizedBox(height: 12),
                        InkWell(
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2035),
                            );
                            if (picked != null) {
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(picked);
                              ref
                                  .read(hyperMarketOrderControllerProvider
                                      .notifier)
                                  .changeDateForFiled(index, formattedDate);
                            }
                          },
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: const Color(0xffDBE0E6)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.expiryDate ?? 'select_date'.tr(),
                                  style: AppTextStyle.rubikRegular16
                                      .copyWith(color: AppColors.textSecondary),
                                ),
                                const Icon(Icons.calendar_today_outlined,
                                    size: 18, color: Color(0xff9CA3AF)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),

                        // 3. Current Stock Input
                        Text(
                          'current_stock'.tr(),
                          style: AppTextStyle.rubikSemiBold16,
                        ),
                        const SizedBox(height: 12),
                        Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xffDBE0E6)),
                          ),
                          child: TextField(
                            style: AppTextStyle.rubikRegular16
                                .copyWith(color: AppColors.textSecondary),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'enter_current_stock'.tr(),
                              hintStyle: AppTextStyle.rubikRegular16
                                  .copyWith(color: AppColors.textSecondary),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 12),
                            ),
                            onChanged: (val) {
                              int stock = int.tryParse(val) ?? 0;
                              ref
                                  .read(hyperMarketOrderControllerProvider
                                      .notifier)
                                  .changestockForFiled(index, stock);
                            },
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 22),

            // Add Another Button Trigger
            InkWell(
              onTap: () {
                ref
                    .read(hyperMarketOrderControllerProvider.notifier)
                    .addNewStockInput(stockItem.itemCode);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add_circle_outline,
                      size: 18, color: Color(0xff005AAB)),
                  SizedBox(width: 8),
                  Text('add_another'.tr(),
                      style: AppTextStyle.rubikMedium16
                          .copyWith(color: AppColors.primary)),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Action Buttons (Cancel / Update)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.pop(),
                    style: OutlinedButtonFrom(
                      side:
                          const BorderSide(color: Color(0xffE0E3E6), width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text('cancel'.tr(),
                        style: AppTextStyle.rubikBold18
                            .copyWith(color: AppColors.primary)),
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff137FEC).withOpacity(0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Consumer(builder: (context, ref, child) {
                      final state = ref.watch(hyperMarketOrderControllerProvider
                          .select((val) => val.value!.updateStock));

                      final canUpdate = ref
                          .watch(hyperMarketOrderControllerProvider.notifier)
                          .canUpdate();
                      if (state is AsyncLoading) {
                        return const Center(
                          child: AppLoader(),
                        );
                      }
                      return ElevatedButton(
                        onPressed: canUpdate
                            ? () {
                                ref
                                    .read(hyperMarketOrderControllerProvider
                                        .notifier)
                                    .hyperMarketUpdateStock(visitId);
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff005AAB),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          elevation: 0,
                        ),
                        child: Text('update'.tr(),
                            style: AppTextStyle.rubikBold18
                                .copyWith(color: AppColors.white)),
                      );
                    }),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // دالة مساعدة لتسهيل كتابة الستقايل الخاص بـ OutlinedButton
  ButtonStyle OutlinedButtonFrom(
      {required BorderSide side,
      required RoundedRectangleBorder shape,
      required EdgeInsets padding}) {
    return OutlinedButton.styleFrom(side: side, shape: shape, padding: padding);
  }
}
