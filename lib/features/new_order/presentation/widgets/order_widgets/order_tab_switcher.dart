import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/new_order/domain/model/order_item.dart';
import 'package:sabaa/features/new_order/presentation/controller/order_mode_controller.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class OrderTabSwitcher extends ConsumerWidget {
  const OrderTabSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(orderModeControllerProvider);

    return DefaultTabController(
      length: OrderMode.values.length,
      initialIndex: mode.index,
      child: Builder(
        builder: (context) {
          final controller = DefaultTabController.of(context);

          controller.addListener(() {
            if (!controller.indexIsChanging) {
              ref
                  .read(orderModeControllerProvider.notifier)
                  .setMode(OrderMode.values[controller.index]);
            }
          });

          return Container(
            height: 44,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: controller,
              indicator: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0C000000),
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              indicatorSize:    TabBarIndicatorSize.tab,
              dividerColor:     Colors.transparent,
              splashFactory:    NoSplash.splashFactory,
              overlayColor:     WidgetStateProperty.all(Colors.transparent),
              labelColor:       AppColors.primary,
              unselectedLabelColor: const Color(0xFF617589),
              labelStyle: AppTextStyle.interSemiBold16.copyWith(
                fontSize:   16,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: AppTextStyle.interSemiBold16.copyWith(
                fontSize:   16,
                fontWeight: FontWeight.w600,
              ),
              tabs: [
                Tab(text: 'new_sale'.tr()),
                Tab(text: 'return_tab'.tr()),
              ],
            ),
          );
        },
      ),
    );
  }
}