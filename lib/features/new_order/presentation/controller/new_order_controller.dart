import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/new_order/data/repositories/new_order_repository.dart';
import 'package:sabaa/features/van_stock/domain/model/stock_category.dart';
import 'package:sabaa/features/van_stock/domain/model/stock_category_model.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';

import '../../../../src/core/shared_widgets/app_toast.dart';
import '../../../customers/domain/model/customer_model.dart';
import '../../../van_stock/domain/model/product_model.dart';
import '../../../van_stock/domain/model/van_stock_model.dart';
import '../../domain/model/order_item.dart';
import 'new_order_state.dart';

part 'new_order_controller.g.dart';

@riverpod
class NewOrderController extends _$NewOrderController {
  int _currentPage = 1;
  int _totalPages = 1;
  final List<ProductModel> _products = [];

  @override
  FutureOr<NewOrderState> build() async {
    final initial = const NewOrderState(listState: AsyncLoading());
    state = AsyncData(initial);

    await fetchItems(page: 1);
    return state.value!;
  }

  void addCustomer(Customer customer) {
    final current = state.value!;

    state = AsyncData(current.copyWith(customer: customer));
  }

  Future<void> fetchItems({
    required int page,
    String? search,
    String? category,
    bool showLoading = true,
  }) async {
    final current = state.value!;
    if (showLoading) state = const AsyncLoading();

    try {
      final repo = ref.read(newOrderRepositoryProvider);

      final response = await repo.getProducts(
          page: page, search: current.searchQuery, category: category
          // current.selectedCategory == null ? null : current.selectedCategory,
          );

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

      // final items = page == 1
      //     ? res.data!.products
      //     : [...current.allItems, ...res.data!.products];

      final newState = current.copyWith(
        allItems: _products,
        filteredItems: _products,
        categories: _mapCategories(response.data!),
        listState: const AsyncData(null),
      );

      state = AsyncData(newState);
    } catch (e, st) {
      state = AsyncData(
        current.copyWith(listState: AsyncError(e, st)),
      );
    }
  }

  List<StockCategoryModel> _mapCategories(VanStockModel data) {
    final apiCategories = data.categories.map((c) {
      return StockCategoryModel(id: c.name, name: c.name);
    }).toList();

    Dev.logList(apiCategories);

    if (apiCategories.isEmpty) return [];

    return [
      const StockCategoryModel(id: "all", name: "All"),
      ...apiCategories,
    ];
  }
  // ── Pagination ─────────────────────────

  Future<bool> loadNextPage() async {
    if (_currentPage >= _totalPages) return false;
    final current = state.value;

    await fetchItems(
        page: _currentPage + 1,
        search: current?.searchQuery.trim().isEmpty == true
            ? null
            : current?.searchQuery.trim(),
        category: current?.selectedCategory,
        showLoading: false);
    return true;
  }

  Future<bool> refresh() async {
    _currentPage = 1;
    _totalPages = 1;
    _products.clear();
    await fetchItems(page: 1);
    return true;
  }

  // ── Search ─────────────────────────────

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

    await fetchItems(
      page: 1,
      search: query.trim().isEmpty ? null : query.trim(),
      category: current.selectedCategory,
      showLoading: false,
    );
  }

  void _resetPagination() {
    _currentPage = 1;
    _totalPages = 1;
    // _products.clear();
  }
  // ── Category ───────────────────────────

  Future<void> selectCategory(int index) async {
    final current = state.value;
    if (current == null) return;

    // index 0 = "All" → no category filter
    final category = index == 0 ? null : current.categories[index].id;

    state = AsyncData(
      current.copyWith(
        selectedCategoryIndex: index,
        selectedCategory: category,
        listState: const AsyncLoading(),
      ),
    );

    _resetPagination();
    await fetchItems(
      page: 1,
      search: current.searchQuery.trim().isEmpty
          ? null
          : current.searchQuery.trim(),
      category: category,
      showLoading: false,
    );
  }
// email=test@akwad.qa&password=test@saba2026
  // ── Selection ──────────────────────────

  void toggleItem(ProductModel item) {
    final current = state.value!;
    final map = Map<String, SelectedItem>.from(current.selectedItems);

    if (map.containsKey(item.itemCode)) {
      map.remove(item.itemCode);
    } else {
      map[item.itemCode] = SelectedItem(
        product: item,

        quantity: 1,
        unit: 'Box', // default
      );
    }

    state = AsyncData(current.copyWith(selectedItems: map));
  }

  void updateUnit(String itemCode, String unit) {
    final current = state.value!;
    final map = Map<String, SelectedItem>.from(current.selectedItems);

    final existing = map[itemCode];
    if (existing == null) return;

    map[itemCode] = existing.copyWith(unit: unit);

    state = AsyncData(current.copyWith(selectedItems: map));
  }

  void increment(ProductModel item) {
    final current = state.value!;
    final map = Map<String, SelectedItem>.from(current.selectedItems);

    // final currentQty = map[item.itemCode] ?? 0;

    // if (currentQty >= item.availableStock) return;

    final existing = map[item.itemCode];

    if (existing == null) return;

    if (existing.quantity >= item.availableStock) return;
    map[item.itemCode] = existing.copyWith(
      quantity: existing.quantity + 1,
    );

    state = AsyncData(current.copyWith(selectedItems: map));
  }

  void decrement(String id) {
    final current = state.value!;
    final map = Map<String, SelectedItem>.from(current.selectedItems);

    final existing = map[id];
    if (existing == null) return;

    if (existing.quantity <= 1) {
      map.remove(id);
    } else {
      map[id] = existing.copyWith(
        quantity: existing.quantity - 1,
      );
    }

    state = AsyncData(current.copyWith(selectedItems: map));
  }

  void setQuantity(ProductModel item, int qty) {
    if (qty > item.availableStock) {
      AppToast.errorToast('Not enough stock');
      return;
    }
    final current = state.value!;

    final map = Map<String, SelectedItem>.from(state.value!.selectedItems);
    final existing = map[item.itemCode];
    if (existing == null) return;

    map[item.itemCode] = existing.copyWith(quantity: qty);

    state = AsyncData(current.copyWith(selectedItems: map));
  }

  Future<bool> createInvoice() async {
    final current = state.value!;
    final repo = ref.read(newOrderRepositoryProvider);
    state = AsyncData(current.copyWith(isSubmitting: true));

    try {
      final items = current.selectedItems.values.map((e) {
        return {
          "itemCode": e.product.itemCode,
          "qty": e.quantity,
          "uom": e.unit,
        };
      }).toList();
      if (current.customer?.id == null) {
        AppToast.errorToast('customer?.id==null');

        return false;
      }
      await repo.createInvoice(
        customerId: "1017",
        items: items,
      );

      state = AsyncData(current.copyWith(isSubmitting: false));

      return true;
    } catch (e) {
      state = AsyncData(current.copyWith(isSubmitting: false));
      AppToast.errorToast('Failed to create invoice');
      return false;
    }
  }
}
