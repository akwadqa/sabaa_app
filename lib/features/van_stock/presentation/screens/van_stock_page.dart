import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/van_stock/domain/model/stock_summary.dart';
import 'package:sabaa/features/van_stock/presentation/controller/van_stock_controller.dart';
import 'package:sabaa/src/core/shared_widgets/app_empty_data_widget.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/shared_widgets/app_pagination_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';

import '../../../../src/core/utils/extenssions/int_extenssion.dart';
import '../../../../src/resourses/font_manager/app_text_style.dart';
import '../../domain/model/stock_category.dart';
import '../../domain/model/stock_item.dart';
import '../controller/van_stock_state.dart';
import '../widgets/stock_category_filter.dart';
import '../widgets/stock_item_card.dart';
import '../widgets/filter_search_bar.dart';
import '../widgets/stock_summary_row.dart';

class VanStockPage extends ConsumerStatefulWidget {
  const VanStockPage({super.key});

  @override
  ConsumerState<VanStockPage> createState() => _VanStockPageState();
}

class _VanStockPageState extends ConsumerState<VanStockPage> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  // ── Static data (replace with BLoC / provider later) ──────────────────────

  // ── Lifecycle ──────────────────────────────────────────────────────────────

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();

    super.dispose();
  }

  // ── Build ──────────────────────────────────────────────────────────────────
  void _onSearchChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(vanStockControllerProvider.notifier).search(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    final stockAsync = ref.watch(vanStockControllerProvider);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: stockAsync.when(
          loading: () => const Center(child: AppLoader()),
          error: (e, _) => Center(child: Text(e.toString())),
          data: (data) {
            return _StockBody(
              state: data,
              searchController: _searchController,
              onSearchChanged: _onSearchChanged,
            );
            // ── Summary ─────────────────────────────
            // final summary = StockSummary(
            //   totalSkuKey: 'total_sku',
            //   totalSkuValue:
            //       data.statistics.totalStockItems.toString(),
            //   lowStockKey: 'low_stock',
            //   lowStockValue:
            //       data.statistics.lowStockItems.toString(),
            //   valueKey: 'stock_value',
            //   valueAmount:
            //       data.statistics.totalStockValue.toStringAsFixed(2),
            // );

            // // ── Items ───────────────────────────────
            // final items = data.products.map((p) {
            //   return StockItem(
            //     name: p.productName,
            //     sku: p.itemCode,
            //     stockLabel: '${p.availableStock}',
            //     stockLevel: p.stockLevel,
            //     price: p.price.toString(),
            //     imageUrl:
            //         p.productImage ?? 'https://placehold.co/64x64',
            //   );
            // }).toList();

            // // ── Search Filter ───────────────────────
            // final filteredItems = items.where((item) {
            //   final query = _searchController.text.toLowerCase();
            //   return item.name.toLowerCase().contains(query);
            // }).toList();

            // return Column(
            //   spacing: 18,
            //   children: [
            //     _buildAppBar(),

            //     FilterSearchBar(
            //       hint: 'search_items',
            //       controller: _searchController,
            //       onChanged: (_) => setState(() {}),
            //     ),

            //     StockSummaryRow(summary: summary),

            //     StockCategoryFilter(
            //       categories: _categories,
            //       selectedIndex: _selectedCategoryIndex,
            //       onSelected: (i) =>
            //           setState(() => _selectedCategoryIndex = i),
            //     ),

            //   Expanded(
            //     child: AppPaginationWidget(
            //       enablePullDown: true,

            //       onRefresh: () => ref
            //           .read(vanStockControllerProvider.notifier)
            //           .refresh(),

            //       onLoading: (page) => ref
            //           .read(vanStockControllerProvider.notifier)
            //           .loadNextPage(),

            //       child: ListView(
            //         physics: const AlwaysScrollableScrollPhysics(),
            //         children: [
            //           ...filteredItems.map(
            //             (item) => Padding(
            //               padding: const EdgeInsets.only(bottom: 12),
            //               child: StockItemCard(item: item),
            //             ),
            //           ),
            //           8.verticalSpace,
            //         ],
            //       ),
            //     ),
            //   ),
            //   ],
            // );
          },
        ),
      ),
    );
  }

  // ── App bar ────────────────────────────────────────────────────────────────
}

class _StockBody extends ConsumerWidget {
  const _StockBody({
    required this.state,
    required this.searchController,
    required this.onSearchChanged,
  });

  final VanStockState state;
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      spacing: 18,
      children: [
        // ── App bar ────────────────────────────────────────────────
        _buildAppBar(),

        // ── Search bar ─────────────────────────────────────────────
        FilterSearchBar(
          hint: 'search_items',
          controller: searchController,
          onChanged: onSearchChanged,
        ),

        // ── Summary cards ──────────────────────────────────────────
        StockSummaryRow(summary: state.summary),

        // ── Category filter ────────────────────────────────────────
        StockCategoryFilter(
          categories: state.categories,
          selectedIndex: state.selectedCategoryIndex,
          onSelected: (i) =>
              ref.read(vanStockControllerProvider.notifier).selectCategory(i),
        ),

        // ── Item list with pull-to-refresh + infinite scroll ───────
        Expanded(
          child: AppPaginationWidget(
            enablePullDown: true,
            onRefresh: () =>
                ref.read(vanStockControllerProvider.notifier).refresh(),
            onLoading: (_) =>
                ref.read(vanStockControllerProvider.notifier).loadNextPage(),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                // Non-blocking loading indicator (search / category change)
                if (state.listState is AsyncLoading)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: LinearProgressIndicator(
                      color: AppColors.primary,
                      backgroundColor: AppColors.white,
                    ),
                  ),
                if (state.filteredItems.isEmpty) AppEmptyDataWidget(),
                ...state.filteredItems.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: StockItemCard(item: item),
                  ),
                ),
                8.verticalSpace,
              ],
            ),
          ),
        ),
      ],
    );
  }

  static const List<StockCategory> _defaultCategories = [
    StockCategory(labelKey: 'category_all'),
    StockCategory(labelKey: 'category_beverages'),
    StockCategory(labelKey: 'category_snacks'),
    StockCategory(labelKey: 'category_dairy'),
    StockCategory(labelKey: 'category_household'),
  ];

  Widget _buildAppBar() {
    return Center(
      child: Text(
        'van_stock'.tr(),
        style: AppTextStyle.interBold20.copyWith(
          color: AppColors.dark,
        ),
      ),
    ).symmetricPadding(vertical: 20);
  }
}
