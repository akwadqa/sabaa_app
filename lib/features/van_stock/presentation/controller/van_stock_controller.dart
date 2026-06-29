import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/van_stock/data/repositories/van_stock_repository.dart';
import 'package:sabaa/features/van_stock/domain/model/van_stock_model.dart';
import 'package:sabaa/src/infrastructure/storage/local_storage_service.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';

import '../../domain/model/product_model.dart';
import '../../domain/model/stock_category.dart';
import '../../domain/model/stock_item.dart';
import '../../domain/model/stock_summary.dart';
import 'van_stock_state.dart';

part 'van_stock_controller.g.dart';

@riverpod
class VanStockController extends _$VanStockController {
  final List<ProductModel> _products = [];

  int _currentPage = 1;
  int _totalPages = 1;

  /// =====================
  /// INITIAL LOAD
  /// =====================
  @override
  FutureOr<VanStockState> build() async {
    final role = ref.read(localStorageServiceProvider).userInfo.role;
    if (role != 'Pre-Order') {
      ref.keepAlive();
    return await fetchStock(page: 1);
    }
    return const VanStockState();
  }

  /// =====================
  /// FETCH
  /// =====================
  Future<VanStockState> fetchStock({
    required int page,
    String? search,
    String? category,
    bool showLoading = true,
  }) async {
    try {
      if (showLoading) state = const AsyncLoading();

      final repo = ref.read(vanStockRepositoryProvider);
      final response = await repo.getVanStock(
        page: page,
        search: search,
        category: category,
      ); // 🔥 IMPORTANT

      _currentPage = response.pagination?.currentPage ?? 1;
      _totalPages = response.pagination?.totalPages ?? 1;

      if (page == 1) {
        _products
          ..clear()
          ..addAll(response.data!.products);
      } else {
        _products.addAll(response.data!.products);
      }

      final data = response.data!;

      // ── Map API model → UI models ────────────────────────────────────────
      final summary = _mapSummary(data);
      final items = _mapItems(data);
      final categories = _mapCategories(data);

      final previous = state.value ?? const VanStockState();

      final nextState = previous.copyWith(
        allItems: items,
        filteredItems: items, // filtering is server-side
        summary: summary,
        categories: categories,
        listState: const AsyncData(null),
      );

      state = AsyncData(nextState);
      return nextState;
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }

  /// =====================
  /// LOAD NEXT PAGE
  /// =====================
  Future<bool> loadNextPage() async {
    if (_currentPage >= _totalPages) return false;
    final current = state.value;
    await fetchStock(
      page: _currentPage + 1,
      search: current?.searchQuery.trim().isEmpty == true
          ? null
          : current?.searchQuery.trim(),
      category: current?.selectedCategory,
      showLoading: false,
    );
    return true;
  }

  Future<void> search(String query) async {
    final current = state.value;
    if (current == null) return;

    // Update query in state immediately so the TextField stays responsive
    state = AsyncData(
      current.copyWith(
        searchQuery: query,
        listState: const AsyncLoading(),
      ),
    );

    _resetPagination();
    await fetchStock(
      page: 1,
      search: query.trim().isEmpty ? null : query.trim(),
      category: current.selectedCategory,
      showLoading: false,
    );
  }

  /// =====================
  /// REFRESH
  /// =====================
  Future<bool> refresh() async {
    _currentPage = 1;
    _totalPages = 1;
    _products.clear();

    await fetchStock(page: 1);
    return true;
  }

  Future<void> selectCategory(int index) async {
    final current = state.value;
    if (current == null) return;

    // index 0 = "All" → no category filter
    final category = index == 0 ? null : current.categories[index].labelKey;

    state = AsyncData(
      current.copyWith(
        selectedCategoryIndex: index,
        selectedCategory: category,
        listState: const AsyncLoading(),
      ),
    );

    _resetPagination();
    await fetchStock(
      page: 1,
      search: current.searchQuery.trim().isEmpty
          ? null
          : current.searchQuery.trim(),
      category: category,
      showLoading: false,
    );
  }

  StockSummary _mapSummary(VanStockModel data) {
    return StockSummary(
      totalSkuKey: 'total_sku',
      totalSkuValue: data.statistics.totalStockItems.toString(),
      // lowStockKey:   'low_stock',
      // lowStockValue: data.statistics.lowStockItems.toString(),
      valueKey: 'stock_value',
      valueAmount: data.statistics.totalStockValue,
    );
  }

  List<StockItem> _mapItems(VanStockModel data) {
    return List.from(_products).map((p) {
      return StockItem(
        name: p.productName,
        sku: p.itemCode,
        stockLabel: '${p.availableStock.toStringAsFixed(0)}',
        // stockLevel: p.stockLevel,
        price: p.price,
        imageUrl: p.productImage ?? 'https://placehold.co/64x64',
      );
    }).toList();
  }

  List<StockCategory> _mapCategories(VanStockModel data) {
    final apiCategories = data.categories.map((c) {
      return StockCategory(labelKey: c.name);
    }).toList();

    Dev.logList(apiCategories);

    if (apiCategories.isEmpty) return [];

    return [
      const StockCategory(labelKey: 'category_all'),
      ...apiCategories,
    ];
  }

  void _resetPagination() {
    _currentPage = 1;
    _totalPages = 1;
    _products.clear();
  }
}
