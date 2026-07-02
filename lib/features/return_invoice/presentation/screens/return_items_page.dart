import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/customers/domain/model/customer_model.dart';
import 'package:sabaa/features/new_order/presentation/widgets/order_category_filter.dart';
import 'package:sabaa/features/new_order/presentation/widgets/order_search_bar.dart';
import 'package:sabaa/features/order/presentation/pages/unified_invoice_review_page.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/app_dialogs.dart';
import 'package:sabaa/src/core/shared_widgets/app_empty_data_widget.dart';
import 'package:sabaa/src/core/shared_widgets/app_error_widget.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/shared_widgets/app_pagination_widget.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

import '../../../customers/domain/model/create_customer_response/create_customer_response.dart';
import '../controller/return_order_controller.dart';
import '../widgets/order_item_card_return.dart';

class ReturnItemsPage extends ConsumerStatefulWidget {
  const ReturnItemsPage(
      {super.key, required this.customer, required this.invoiceId});

  final CustomerModel customer;
  final String invoiceId;

  @override
  ConsumerState<ReturnItemsPage> createState() => _ReturnItemsPageState();
}

class _ReturnItemsPageState extends ConsumerState<ReturnItemsPage> {
  Timer? _debounce;
  final TextEditingController _searchController = TextEditingController();

  void _onSearchChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(returnOrderControllerProvider.notifier).search(query);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(returnOrderControllerProvider.notifier)
          .addInvoiceID(widget.invoiceId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncProducts = ref.watch(returnOrderControllerProvider);
    final hasItems = asyncProducts.maybeWhen(
      data: (s) => s.hasSelection,
      orElse: () => false,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: CustomButtonWidget(
            text: "",
            onTap: hasItems
                ? () {
                    ref
                        .read(returnOrderControllerProvider.notifier)
                        .addCustomer(widget.customer);
                    context.push(AppRoutes.invoiceReviewScreen, extra: {
                      'mode': InvoiceReviewMode.returnOrder,
                    });
                    // context.push(AppRoutes.returnInvoiceReviewScreen,extra: {"isReturn":true});
                  }
                : null,
            isFiled: true,
            height: 48,
            width: double.infinity,
            backgroundColor: hasItems ? AppColors.primary : AppColors.gray,
            radius: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Icon(Icons.check_circle_outline,
                    color: AppColors.white, size: 25),
                Text(
                  'confirm_return'.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
      body: asyncProducts.when(
        loading: () => const Center(child: AppLoader()),
        error: (e, _) => AppErrorWidget(),
        data: (state) => _ReturnOrderBody(
          state: state,
          searchController: _searchController,
          onSearchChanged: _onSearchChanged,
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
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
            'return_items_title'.tr(),
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
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, color: AppColors.navBorder),
      ),
    );
  }
}

class _ReturnOrderBody extends ConsumerWidget {
  const _ReturnOrderBody({
    required this.state,
    required this.searchController,
    required this.onSearchChanged,
  });

  final ReturnOrderState state;
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: Column(
        spacing: 18,
        children: [
          16.verticalSpace,
          OrderSearchBar(
            controller: searchController,
            hintKey: 'search_items_barcode',
            onChanged: onSearchChanged,
            onBarcodeTap: () {
              context.push(AppRoutes.barcodeScreen, extra: {'fromNewOrder': false});
            },
          ),
          // OrderCategoryFilter(
          //   categories: state.categories.isNotEmpty
          //       ? state.categories.map((e) => e.name).toList()
          //       : ['All'],
          //   selectedIndex: state.selectedCategoryIndex,
          //   onSelected: (i) => ref
          //       .read(returnOrderControllerProvider.notifier)
          //       .selectCategory(i),
          // ),
          _SectionHeader(
            titleKey: 'items',
            count: state.allItems.length,
            isReturn: true,
          ),
          Expanded(
            child: AppPaginationWidget(
              enablePullDown: true,
              onRefresh: () =>
                  ref.read(returnOrderControllerProvider.notifier).refresh(),
              onLoading: (_) => ref
                  .read(returnOrderControllerProvider.notifier)
                  .loadNextPage(),
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
                  // if (state.filteredItems.isEmpty) AppEmptyDataWidget(),
                  ...state.filteredItems.map((item) {
                    final isSelected =
                        state.selectedItems.containsKey(item.itemCode);
                    final selected = state.selectedItems[item.itemCode];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: () {
                          if (!isSelected) {
                            ref
                                .read(returnOrderControllerProvider.notifier)
                                .toggleItem(item);
                          }
                        },
                        child: OrderItemCardReturn(
                          item: item,
                          quantity: selected?.quantity ?? 0,
                          selectedUnit: selected?.unit ?? 'Box',
                          isSelected: isSelected,
                          maxReturnQuantity: item.qty,
                          onIncrement: () => ref
                              .read(returnOrderControllerProvider.notifier)
                              .increment(item),
                          onDecrement: () => ref
                              .read(returnOrderControllerProvider.notifier)
                              .decrement(item.itemCode),
                          onDelete: () async {
                            final confirm =
                                await showRemoveConfirmDialog(context);
                            if (confirm) {
                              ref
                                  .read(returnOrderControllerProvider.notifier)
                                  .toggleItem(item);
                            }
                          },
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

// ── Section Header ───────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.titleKey,
    required this.count,
    required this.isReturn,
  });

  final String titleKey;
  final int count;
  final bool isReturn;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          titleKey.tr(),
          style: AppTextStyle.interBold18.copyWith(
            color: AppColors.textHeading,
            letterSpacing: -0.27,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: isReturn ? const Color(0xFFFEECDF) : AppColors.dateBadge,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '$count ${'items_label'.tr()}',
            style: AppTextStyle.interSemiBold14.copyWith(
              fontSize: 12,
              color: isReturn ? AppColors.accent : AppColors.primary,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.6,
            ),
          ),
        ),
      ],
    );
  }
}
