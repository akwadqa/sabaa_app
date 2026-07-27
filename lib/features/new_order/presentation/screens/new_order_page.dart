import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:sabaa/features/customers/domain/model/create_customer_response/create_customer_response.dart';
import 'package:sabaa/features/customers/domain/model/customer_model.dart';
import 'package:sabaa/features/new_order/domain/model/order_item.dart';
import 'package:sabaa/features/new_order/presentation/controller/order_mode_controller.dart';
import 'package:sabaa/features/new_order/presentation/widgets/order_widgets/new_order_section_header_widget.dart';
import 'package:sabaa/features/new_order/presentation/widgets/order_widgets/order_category_filter.dart';
import 'package:sabaa/features/new_order/presentation/widgets/order_widgets/order_card/order_item_card.dart';
import 'package:sabaa/features/new_order/presentation/widgets/order_widgets/order_search_bar.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/app_empty_data_widget.dart';
import 'package:sabaa/src/core/shared_widgets/app_error_widget.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/shared_widgets/app_pagination_widget.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

import '../controller/new_order_controller.dart';
import '../controller/new_order_state.dart';
import '../widgets/order_widgets/order_tab_switcher.dart';

class NewOrderPage extends ConsumerStatefulWidget {
  const NewOrderPage({super.key, required this.customer});

  final CustomerModel customer;

  @override
  ConsumerState<NewOrderPage> createState() => _NewOrderPageState();
}

class _NewOrderPageState extends ConsumerState<NewOrderPage> {
  Timer? _debounce;
  final TextEditingController _searchController = TextEditingController();

  void _onSearchChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(newOrderControllerProvider.notifier).search(query);
    });
  }

  @override
  void initState() {
    super.initState();
    // ✅ Sync initial mode
    Future.microtask(() {
      final mode = ref.read(orderModeControllerProvider);
      ref
          .read(newOrderControllerProvider.notifier)
          .setIsReturn(mode == OrderMode.returnItems);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    // Reset mode when leaving the page
    // ref.read(orderModeControllerProvider.notifier).setMode(OrderMode.newSale);
    super.dispose();
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    // Watch mode so AppBar + body react to tab changes
    final isReturn =
        ref.watch(orderModeControllerProvider) == OrderMode.returnItems;
    final asyncProducts = ref.watch(newOrderControllerProvider);
    final controller = ref.read(newOrderControllerProvider.notifier);
    final hasItems = asyncProducts.maybeWhen(
      data: (s) => s.hasSelection,
      orElse: () => false,
    );
    // ✅ Listen to mode changes and sync into NewOrderController state
    ref.listen<OrderMode>(orderModeControllerProvider, (previous, next) {
      final isReturnMode = next == OrderMode.returnItems;
      ref.read(newOrderControllerProvider.notifier).setIsReturn(isReturnMode);
    });
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: _buildAppBar(isReturn),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: CustomButtonWidget(
              text: "",
              onTap: hasItems
                  ? () {
                      ref
                          .read(newOrderControllerProvider.notifier)
                          .addCustomer(widget.customer);
                      context.push(AppRoutes.invoiceSummaryPage);
                    }
                  : null,
              isFiled: true,
              height: 48,
              width: double.infinity,
              backgroundColor: hasItems
                  ? (isReturn ? AppColors.accent : AppColors.primary) // ✅
                  : AppColors.gray,
              radius: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Icon(Icons.check_circle_outline,
                      color: AppColors.white, size: 25),
                  // Text('add_to_order'.tr()),
                  Text(
                      isReturn
                          ? 'add_to_return'.tr()
                          : 'add_to_order'.tr(), // ✅
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500))
                ],
              ),
            ),
          ),
        ),
        body: asyncProducts.when(
            loading: () => const Center(child: AppLoader()),
            error: (e, _) => AppErrorWidget(),
            data: (state) => _OrderBody(
                  state: state,
                  searchController: _searchController,
                  onSearchChanged: _onSearchChanged,
                  isReturn: isReturn,
                )));
  }

  // ── AppBar ─────────────────────────────────────────────────────────────────

  PreferredSizeWidget _buildAppBar(bool isReturn) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
      ),
      title: Column(
        children: [
          Text(
            isReturn ? 'return_items_title'.tr() : 'create_order'.tr(),
            style: AppTextStyle.interBold20.copyWith(color: AppColors.dark),
          ),
          Text(
            widget.customer.name ?? "",
            style: AppTextStyle.interRegular12.copyWith(
              color: AppColors.blueGrey,
            ),
          ),
        ],
      ),
      // actions: [
      //   AnimatedContainer(
      //     duration: const Duration(milliseconds: 220),
      //     margin: const EdgeInsets.only(right: 16),
      //     width: 36,
      //     height: 36,
      //     decoration: BoxDecoration(
      //       color: isReturn ? AppColors.primary : AppColors.chevronBg,
      //       borderRadius: BorderRadius.circular(8),
      //     ),
      //     child: Icon(
      //       Icons.swap_horiz_rounded,
      //       color: isReturn ? AppColors.white : AppColors.textSecondary,
      //       size: 20,
      //     ),
      //   ),
      // ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, color: AppColors.navBorder),
      ),
    );
  }
}

class _OrderBody extends ConsumerWidget {
  const _OrderBody({
    required this.state,
    required this.searchController,
    required this.onSearchChanged,
    required this.isReturn, // ✅ NEW
  });

  final NewOrderState state;
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final bool isReturn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: Column(
        spacing: 18,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          const OrderTabSwitcher(),
          OrderSearchBar(
            controller: searchController,
            hintKey: 'search_items_barcode',
            onChanged: onSearchChanged,
            onBarcodeTap: () {
              context
                  .push(AppRoutes.barcodeScreen, extra: {'fromNewOrder': true});
            },
          ),
          OrderCategoryFilter(
            categories: state.categories.isNotEmpty
                ? state.categories.map((e) => e.name).toList()
                : ['All'],
            selectedIndex: state.selectedCategoryIndex,
            onSelected: (i) =>
                ref.read(newOrderControllerProvider.notifier).selectCategory(i),
          ),
          NewOrderSectionHeaderWidget(
            titleKey: isReturn ? 'return_items' : 'items', // ✅
            count: state.allItems.length,
            isReturn: isReturn, // ✅
          ),
          Expanded(
            child: AppPaginationWidget(
              enablePullDown: true,
              onRefresh: () =>
                  ref.read(newOrderControllerProvider.notifier).refresh(),
              onLoading: (_) =>
                  ref.read(newOrderControllerProvider.notifier).loadNextPage(),
              child: ListView(
                children: [
                  if (state.listState is AsyncLoading)
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: LinearProgressIndicator(
                        color: AppColors.primary,
                        backgroundColor: AppColors.white,
                      ),
                    ),
                  if (state.filteredItems.isEmpty &&
                      state.listState is! AsyncLoading)
                    AppEmptyDataWidget(),
                  ...state.filteredItems.map((item) {
                    final isSelected =
                        state.selectedItems.containsKey(item.itemCode);

                    final selected = state.selectedItems[item.itemCode];

// ✅ Use the item's first UOM as fallback, not hardcoded "Box"
                    final defaultUnit = item.uoms.isNotEmpty
                        ? item.uoms
                            .firstWhere(
                              (u) => u.availableStock > 0,
                              orElse: () => item.uoms.first,
                            )
                            .uom
                        : (item.defaultUom ?? 'Pcs');
                    final selectedUnit = selected?.unit ?? defaultUnit;
                    final selectedUomStock = item.uoms
                        .firstWhere(
                          (u) => u.uom == selectedUnit,
                          orElse: () => item.uoms.first,
                        )
                        .availableStock;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: () => ref
                            .read(newOrderControllerProvider.notifier)
                            .toggleItem(item),
                        child: OrderItemCard(
                          item: item,
                          quantity: selected?.quantity ?? 0,
                          selectedUnit: selected?.unit ?? defaultUnit,
                          isSelected: isSelected,
                          onIncrement: () => ref
                              .read(newOrderControllerProvider.notifier)
                              .increment(item),
                          onDecrement: () => ref
                              .read(newOrderControllerProvider.notifier)
                              .decrement(item.itemCode),
                          onDelete: () => ref
                              .read(newOrderControllerProvider.notifier)
                              .toggleItem(item),
                          onUnitChanged: (unit) => ref
                              .read(newOrderControllerProvider.notifier)
                              .updateUnit(item.itemCode, unit),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
