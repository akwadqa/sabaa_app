import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/van_stock/domain/model/stock_category.dart';
import 'package:sabaa/features/van_stock/domain/model/stock_item.dart';
import 'package:sabaa/features/van_stock/domain/model/stock_summary.dart';

class VanStockState {
  const VanStockState({
    this.allItems          = const [],
    this.filteredItems     = const [],
    this.categories        = const [],
    this.summary           = const StockSummary.empty(),
    this.searchQuery       = '',
    this.selectedCategory,          // null = "All"
    this.selectedCategoryIndex = 0,
    this.listState,
  });

  final List<StockItem>     allItems;
  final List<StockItem>     filteredItems;
  final List<StockCategory> categories;
  final StockSummary        summary;
  final String              searchQuery;
  final String?             selectedCategory;
  final int                 selectedCategoryIndex;
  final AsyncValue<void>?   listState;

  VanStockState copyWith({
    List<StockItem>?     allItems,
    List<StockItem>?     filteredItems,
    List<StockCategory>? categories,
    StockSummary?        summary,
    String?              searchQuery,
    String?              selectedCategory,
    int?                 selectedCategoryIndex,
    AsyncValue<void>?    listState,
  }) {
    return VanStockState(
      allItems:              allItems              ?? this.allItems,
      filteredItems:         filteredItems         ?? this.filteredItems,
      categories:            categories            ?? this.categories,
      summary:               summary               ?? this.summary,
      searchQuery:           searchQuery           ?? this.searchQuery,
      selectedCategory:      selectedCategory      ?? this.selectedCategory,
      selectedCategoryIndex: selectedCategoryIndex ?? this.selectedCategoryIndex,
      listState:             listState             ?? this.listState,
    );
  }
}