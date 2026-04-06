import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/features/van_stock/domain/model/stock_summary.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';

import '../../../../src/core/utils/extenssions/int_extenssion.dart';
import '../../../../src/resourses/font_manager/app_text_style.dart';
import '../../domain/model/stock_category.dart';
import '../../domain/model/stock_item.dart';
import '../widgets/stock_category_filter.dart';
import '../widgets/stock_item_card.dart';
import '../widgets/filter_search_bar.dart';
import '../widgets/stock_summary_row.dart';

class VanStockPage extends StatefulWidget {
  const VanStockPage({super.key});

  @override
  State<VanStockPage> createState() => _VanStockPageState();
}

class _VanStockPageState extends State<VanStockPage> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedCategoryIndex = 0;

  // ── Static data (replace with BLoC / provider later) ──────────────────────

  static const StockSummary _summary = StockSummary(
    totalSkuKey: 'total_sku',
    totalSkuValue: '145',
    lowStockKey: 'low_stock',
    lowStockValue: '3',
    valueKey: 'stock_value',
    valueAmount: r'$2.4k',
  );

  static const List<StockCategory> _categories = [
    StockCategory(labelKey: 'category_all'),
    StockCategory(labelKey: 'category_beverages'),
    StockCategory(labelKey: 'category_snacks'),
    StockCategory(labelKey: 'category_dairy'),
    StockCategory(labelKey: 'category_household'),
  ];

  static const List<StockItem> _items = [
    StockItem(
      name: 'Coca-Cola 330ml Can',
      sku: 'CC-330-CAN',
      stockLabel: '45 cases',
      stockLevel: StockLevel.high,
      price: r'$12.50',
      imageUrl: 'https://placehold.co/64x64',
    ),
    StockItem(
      name: 'Lays Classic Salted 50g',
      sku: 'LAYS-CS-50',
      stockLabel: '22 boxes',
      stockLevel: StockLevel.medium,
      price: r'$24.00',
      imageUrl: 'https://placehold.co/64x64',
    ),
    StockItem(
      name: 'Fresh Orange Juice 1L',
      sku: 'FOJ-1L-BOT',
      stockLabel: '3 units',
      stockLevel: StockLevel.low,
      price: r'$4.50',
      imageUrl: 'https://placehold.co/64x64',
    ),
    StockItem(
      name: 'Dairy Milk Silk 60g',
      sku: 'CAD-DM-60',
      stockLabel: '120 units',
      stockLevel: StockLevel.high,
      price: r'$1.20',
      imageUrl: 'https://placehold.co/64x64',
    ),
    StockItem(
      name: 'Aquafina Water 500ml',
      sku: 'AQU-500-PET',
      stockLabel: '200 cases',
      stockLevel: StockLevel.high,
      price: r'$8.00',
      imageUrl: 'https://placehold.co/64x64',
    ),
  ];

  // ── Lifecycle ──────────────────────────────────────────────────────────────

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          spacing: 18,
          children: [
            _buildAppBar(),
            // 16.verticalSpace,
            FilterSearchBar(
              hint: 'search_items',
              controller: _searchController,
              onChanged: (_) => setState(() {}),
            ),
            // 16.verticalSpace,
            StockSummaryRow(summary: _summary),
            // 16.verticalSpace,
            StockCategoryFilter(
              categories: _categories,
              selectedIndex: _selectedCategoryIndex,
              onSelected: (i) => setState(() => _selectedCategoryIndex = i),
            ),
            // 16.verticalSpace,
            Expanded(
              child: ListView(
                // padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  ..._items.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: StockItemCard(item: item),
                    ),
                  ),
                  8.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── App bar ────────────────────────────────────────────────────────────────

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
