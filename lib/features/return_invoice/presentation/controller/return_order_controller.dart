// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:sabaa/features/customers/domain/model/create_customer_response/create_customer_response.dart';
import 'package:sabaa/features/customers/domain/model/customer_model.dart';
import 'package:sabaa/features/return_invoice/data/repositories/return_order_repository.dart';
import 'package:sabaa/features/return_invoice/domain/model/return_invoice_model.dart';
import 'package:sabaa/features/return_invoice/domain/model/selected_item_model.dart';
import 'package:sabaa/features/van_stock/domain/model/product_model.dart';
import 'package:sabaa/features/van_stock/domain/model/stock_category_model.dart';
import 'package:sabaa/src/core/shared_widgets/app_toast.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';

part 'return_order_controller.g.dart';

class ReturnOrderState {
  const ReturnOrderState({
    this.allItems = const [],
    this.filteredItems = const [],
    this.categories = const [],
    this.searchQuery = '',
    this.selectedCategory,
    this.selectedCategoryIndex = 0,
    this.selectedItems = const {}, // key = itemCode, value = SelectedItem
    this.listState,
    this.customer,
    this.invoiceId,
    this.isSubmitting = false,
  });

  final List<InvoiceItemModel> allItems;
  final List<InvoiceItemModel> filteredItems;
  final List<StockCategoryModel> categories;

  final String searchQuery;
  final String? selectedCategory;
  final String? invoiceId;
  final int selectedCategoryIndex;

  /// Items pre-selected with current stock quantities (cannot exceed)
  final Map<String, SelectedItem> selectedItems;

  final AsyncValue<void>? listState;

  final CustomerModel? customer;
  final bool isSubmitting;

  bool get hasSelection => selectedItems.isNotEmpty;

  ReturnOrderState copyWith({
    List<InvoiceItemModel>? allItems,
    List<InvoiceItemModel>? filteredItems,
    List<StockCategoryModel>? categories,
    String? searchQuery,
    String? selectedCategory,
    String? invoiceId,
    int? selectedCategoryIndex,
    Map<String, SelectedItem>? selectedItems,
    AsyncValue<void>? listState,
    CustomerModel? customer,
    bool? isSubmitting,
  }) {
    return ReturnOrderState(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      categories: categories ?? this.categories,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      invoiceId: invoiceId ?? this.invoiceId,
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      selectedItems: selectedItems ?? this.selectedItems,
      listState: listState ?? this.listState,
      customer: customer ?? this.customer,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}

@riverpod
class ReturnOrderController extends _$ReturnOrderController {
  int _currentPage = 1;
  int _totalPages = 1;
  final List<InvoiceItemModel> _items = [];
  @override
  FutureOr<ReturnOrderState> build() async {
    final initial = const ReturnOrderState(listState: AsyncLoading());
    state = AsyncData(initial);
    // await fetchInvoiceDetails(page: 1);
    return state.value!;
  }

  Future<void> addInvoiceID(String id) async {
    final current = state.value ?? const ReturnOrderState();

    state = AsyncData(
      current.copyWith(
        invoiceId: id,
        listState: const AsyncLoading(),
      ),
    );

    await fetchInvoiceDetails(page: 1, invoiceId: id);
  }

  Future<void> fetchInvoiceDetails({
    required int page,
    String? invoiceId,
    String? category,
    bool showLoading = true,
  }) async {
    final current = state.value!;
    if (showLoading) state = const AsyncLoading();

    try {
      final repo = ref.read(returnOrderRepositoryProvider);
      Dev.logLine("DSAfdsfds");
      Dev.logLine(current.invoiceId);

      final response = await repo.getInvoiceDetails(
        page: page,
        invoiceId: invoiceId ?? current.invoiceId!,
        category: category,
      );

      // _currentPage = response.pagination?.currentPage ?? 1;
      // _totalPages = response.pagination?.totalPages ?? 1;

      if (page == 1) {
        _items
          ..clear()
          ..addAll(response.data!.items);
      } else {
        _items.addAll(response.data!.items);
      }
final selectedMap = {
  for (var item in _items)
    item.itemCode: SelectedItem(
      product: item,
      quantity: item.qty, // 🔥 full quantity by default
      unit: item.uom ?? 'Box',
    )
};
  state = AsyncData(
  current.copyWith(
    allItems: _items,
    filteredItems: _items,
    selectedItems: selectedMap, // ✅ AUTO SELECTED
    listState: const AsyncData(null),
  ),
);

    } catch (e, st) {
      state = AsyncData(
        current.copyWith(listState: AsyncError(e, st)),
      );
    }
  }

  List<StockCategoryModel> _mapCategories(dynamic data) {
    final apiCategories = data.categories.map((c) {
      return StockCategoryModel(id: c.name, name: c.name);
    }).toList();

    if (apiCategories.isEmpty) return [];

    return [
      const StockCategoryModel(id: "all", name: "All"),
      ...apiCategories,
    ];
  }

  Future<bool> loadNextPage() async {
    if (_currentPage >= _totalPages) return false;
    final current = state.value;

    await fetchInvoiceDetails(
      page: _currentPage + 1,
      invoiceId: current?.invoiceId,
      category: current?.selectedCategory,
      showLoading: false,
    );
    return true;
  }

  Future<bool> refresh() async {
    _currentPage = 1;
    _totalPages = 1;
    _items.clear();
    await fetchInvoiceDetails(page: 1);
    return true;
  }

Future<void> search(String query) async {
  final current = state.value;
  if (current == null) return;

  final filtered = current.allItems.where((item) {
    return item.itemName.toLowerCase().contains(query.toLowerCase()) ||
           item.itemCode.toLowerCase().contains(query.toLowerCase());
  }).toList();

  state = AsyncData(
    current.copyWith(
      searchQuery: query,
      filteredItems: filtered,
    ),
  );
}

  void _resetPagination() {
    _currentPage = 1;
    _totalPages = 1;
  }

  Future<void> selectCategory(int index) async {
    final current = state.value;
    if (current == null) return;

    final category = index == 0 ? null : current.categories[index].id;

    state = AsyncData(
      current.copyWith(
        selectedCategoryIndex: index,
        selectedCategory: category,
        listState: const AsyncLoading(),
      ),
    );

    _resetPagination();
    await fetchInvoiceDetails(
      page: 1,
      invoiceId: current.invoiceId,
      category: category,
      showLoading: false,
    );
  }

  void toggleItem(InvoiceItemModel item) {
    final current = state.value!;
    final map = Map<String, SelectedItem>.from(current.selectedItems);

    if (map.containsKey(item.itemCode)) {
      map.remove(item.itemCode);
    } else {
      // For returns, start with quantity = 1, cannot exceed available stock
      map[item.itemCode] = SelectedItem(
        product: item,
        quantity: item.qty,
        unit: item.uom ?? 'Box',
      );
    }

    state = AsyncData(current.copyWith(selectedItems: map));
  }

  /// Increment quantity but don't exceed available stock
  void increment(InvoiceItemModel item) {
    final current = state.value!;
    final map = Map<String, SelectedItem>.from(current.selectedItems);

    final existing = map[item.itemCode];
    if (existing == null) return;

    // Cannot exceed the original available stock
    if (existing.quantity >= item.qty) {
      AppToast.errorToast('Cannot exceed available stock');
      return;
    }

    map[item.itemCode] = existing.copyWith(
      quantity: existing.quantity + 1,
    );

    state = AsyncData(current.copyWith(selectedItems: map));
  }

  /// Decrement quantity
  void decrement(String itemCode) {
    final current = state.value!;
    final map = Map<String, SelectedItem>.from(current.selectedItems);

    final existing = map[itemCode];
    if (existing == null) return;

    if (existing.quantity <= 1) {
      map.remove(itemCode);
    } else {
      map[itemCode] = existing.copyWith(
        quantity: existing.quantity - 1,
      );
    }

    state = AsyncData(current.copyWith(selectedItems: map));
  }

  /// Set exact quantity (with validation)
  void setQuantity(InvoiceItemModel item, int qty) {
    if (qty > item.qty) {
      AppToast.errorToast('Cannot exceed available stock: ${item.qty}');
      return;
    }

    if (qty < 1) {
      decrement(item.itemCode);
      return;
    }

    final current = state.value!;
    final map = Map<String, SelectedItem>.from(current.selectedItems);
    final existing = map[item.itemCode];

    if (existing == null) return;

    map[item.itemCode] = existing.copyWith(quantity: qty);
    state = AsyncData(current.copyWith(selectedItems: map));
  }

  void addCustomer(CustomerModel customer) {
    final current = state.value!;
    state = AsyncData(current.copyWith(customer: customer));
  }

  /// Unit is read-only for returns, so no updateUnit method

  Future<bool> createReturnOrder() async {
    final current = state.value!;
    state = AsyncData(current.copyWith(isSubmitting: true));

    try {
      final customerId = current.customer?.customerId;
      final repo = ref.read(returnOrderRepositoryProvider);

      final items = current.selectedItems.values.map((e) {
        return {
          "itemCode": e.product.itemCode,
          "qty": e.quantity,
          "uom": e.unit,
        };
      }).toList();

      if (customerId == null) {
        Dev.logError('customer?.id==null');
        return false;
      }

      // Call repository to create return order (adjust endpoint as needed)
      await repo.createReturnOrder(
        invoiceId: current.invoiceId!, // ✅ correct
        items: items,
        // deliveryFee: '0',
      );

      final latest = state.value!;
      state = AsyncData(latest.copyWith(
        selectedItems: {},
        isSubmitting: false,
      ));

      AppToast.successToast('Return order created successfully');
      return true;
    } catch (e) {
      final latest = state.value!;
      state = AsyncData(latest.copyWith(isSubmitting: false));
      AppToast.errorToast('Failed to create return order');
      Dev.logError('Return order error: $e');
      return false;
    }
  }

  void clearOrder() {
    final current = state.value!;

    state = AsyncData(
      current.copyWith(
        selectedItems: {},
        searchQuery: '',
        selectedCategory: null,
        selectedCategoryIndex: 0,
      ),
    );
  }
}
