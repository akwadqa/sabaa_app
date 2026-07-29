import 'package:easy_localization/easy_localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/customers/domain/model/create_customer_response/create_customer_response.dart';
import 'package:sabaa/features/new_order/data/repositories/new_order_repository.dart';
import 'package:sabaa/features/new_order/domain/model/new_order_model.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/features/van_stock/domain/model/stock_category_model.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';
import 'package:uuid/uuid.dart';
import '../../../../src/core/shared_widgets/app_toast.dart';
import '../../../van_stock/domain/model/product_model.dart';
import '../../../van_stock/domain/model/van_stock_model.dart';
import '../../domain/model/order_item.dart';
import 'new_order_state.dart';

part 'new_order_controller.g.dart';

class StockCheckResult {
  final bool isAvailable;
  final String message;
  StockCheckResult(this.isAvailable, this.message);
}

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

  void addCustomer(CustomerModel customer) {
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
          page: page, search: search ?? current.searchQuery, category: category
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

 void toggleItem(ProductModel item) {
  final current = state.value!;
  final map = Map<String, SelectedItem>.from(current.selectedItems);
  var lines = List<SelectedItemLine>.from(current.selectedLines);

  if (map.containsKey(item.itemCode)) {
    map.remove(item.itemCode);
    lines.removeWhere((l) => l.product.itemCode == item.itemCode);
  } else {
    // ✅ Pick first UOM with stock > 0
    final availableUom = item.uoms.firstWhere(
      (u) => u.availableStock > 0,
      orElse: () => item.uoms.first,
    );

    // ✅ Warn if all UOMs have 0 stock
    if (availableUom.availableStock == 0) {
      AppToast.errorToast('out_of_stock'.tr());
      return; // ✅ Don't add item with 0 stock
    }

    map[item.itemCode] = SelectedItem(
      product: item,
      quantity: 1,
      unit: availableUom.uom,
    );

    lines.add(SelectedItemLine(
      lineId: const Uuid().v4(),
      product: item,
      quantity: 1,
      unit: availableUom.uom,
    ));
  }

  state = AsyncData(current.copyWith(
    selectedItems: map,
    selectedLines: lines,
  ));
}
// void toggleItem(ProductModel item) {
//   final current = state.value!;
//   final map = Map<String, SelectedItem>.from(current.selectedItems);
//   var lines = List<SelectedItemLine>.from(current.selectedLines);

//   if (map.containsKey(item.itemCode)) {
//     // Remove item and ALL its lines
//     map.remove(item.itemCode);
//     lines.removeWhere((l) => l.product.itemCode == item.itemCode);
//   } else {
//     // ✅ Use product's first UOM as default (consistent everywhere)
//     final defaultUnit = item.uoms.isNotEmpty
//         ? item.uoms.first.uom
//         : (item.defaultUom ?? 'Pcs');

//     map[item.itemCode] = SelectedItem(
//       product: item,
//       quantity: 1,
//       unit: defaultUnit, // ✅ consistent with SelectedItemLine.create
//     );

//     // ✅ Create line — unit matches selectedItem unit
//     lines.add(
//       SelectedItemLine(
//         lineId: const Uuid().v4(),
//         product: item,
//         quantity: 1,
//         unit: defaultUnit, // ✅ same unit, no mismatch
//       ),
//     );
//   }

//   state = AsyncData(current.copyWith(
//     selectedItems: map,
//     selectedLines: lines,
//   ));
// }
 void updateUnit(String itemCode, String unit) {
  final current = state.value!;
  final map = Map<String, SelectedItem>.from(current.selectedItems);
  final existing = map[itemCode];
  if (existing == null) return;

  // ✅ Get stock for newly selected UOM
  final newUomModel = existing.product.uoms.firstWhere(
    (u) => u.uom == unit,
    orElse: () => existing.product.uoms.first,
  );
  final maxStock = newUomModel.availableStock;

  // ✅ Clamp quantity to new UOM's stock (min 1 if stock > 0)
  final clampedQty = maxStock == 0 ? 0 : existing.quantity.clamp(1, maxStock);

  map[itemCode] = existing.copyWith(unit: unit, quantity: clampedQty);

  // ✅ Sync first line
  final lines = current.selectedLines.map((l) {
    if (l.product.itemCode == itemCode &&
        l.lineId == _firstLineId(current, itemCode)) {
      return l.copyWith(unit: unit, quantity: clampedQty);
    }
    return l;
  }).toList();

  state = AsyncData(current.copyWith(
    selectedItems: map,
    selectedLines: lines,
  ));
}

  String? _firstLineId(NewOrderState state, String itemCode) {
    final match = state.selectedLines
        .where((l) => l.product.itemCode == itemCode)
        .toList();
    return match.isNotEmpty ? match.first.lineId : null;
  }

// In new_order_controller.dart

void increment(ProductModel item) {
  final current = state.value!;
  final map = Map<String, SelectedItem>.from(current.selectedItems);
  final existing = map[item.itemCode];
  if (existing == null) return;

  // ✅ Use UOM-specific stock, not the product-level string
  final uomModel = item.uoms.firstWhere(
    (u) => u.uom == existing.unit,
    orElse: () => item.uoms.first,
  );
  final maxStock = uomModel.availableStock; // ✅ int from UomModel

  if (existing.quantity >= maxStock) {
    AppToast.errorToast(
      '${'max_stock'.tr()}: $maxStock ${existing.unit}',
    );
    return;
  }

  final newQty = existing.quantity + 1;
  map[item.itemCode] = existing.copyWith(quantity: newQty);

  final lines = _syncFirstLineQuantity(current, item.itemCode, newQty);

  state = AsyncData(current.copyWith(
    selectedItems: map,
    selectedLines: lines,
  ));
}

void decrement(String id) {
  final current = state.value!;
  final map = Map<String, SelectedItem>.from(current.selectedItems);
  final existing = map[id];
  if (existing == null) return;

  if (existing.quantity <= 1) {
    map.remove(id);
    final lines = List<SelectedItemLine>.from(current.selectedLines)
      ..removeWhere((l) => l.product.itemCode == id);
    state = AsyncData(current.copyWith(
      selectedItems: map,
      selectedLines: lines,
    ));
    return;
  }

  final newQty = existing.quantity - 1;
  map[id] = existing.copyWith(quantity: newQty);
  final lines = _syncFirstLineQuantity(current, id, newQty);

  state = AsyncData(current.copyWith(
    selectedItems: map,
    selectedLines: lines,
  ));
}

void setQuantity(ProductModel item, int qty) {
  final current = state.value!;
  final existing = current.selectedItems[item.itemCode];
  if (existing == null) return;

  // ✅ Use UOM-specific stock
  final uomModel = item.uoms.firstWhere(
    (u) => u.uom == existing.unit,
    orElse: () => item.uoms.first,
  );
  final maxStock = uomModel.availableStock;

  if (qty > maxStock) {
    AppToast.errorToast('${'max_stock'.tr()}: $maxStock ${existing.unit}');
    return;
  }

  final clamped = qty.clamp(1, maxStock);
  final map = Map<String, SelectedItem>.from(current.selectedItems);
  map[item.itemCode] = existing.copyWith(quantity: clamped);
  final lines = _syncFirstLineQuantity(current, item.itemCode, clamped);

  state = AsyncData(current.copyWith(
    selectedItems: map,
    selectedLines: lines,
  ));
}
// ── Helper: sync first line quantity for a product ────────────────
  List<SelectedItemLine> _syncFirstLineQuantity(
    NewOrderState state,
    String itemCode,
    int qty,
  ) {
    bool synced = false;
    return state.selectedLines.map((l) {
      if (!synced && l.product.itemCode == itemCode) {
        synced = true;
        return l.copyWith(quantity: qty);
      }
      return l;
    }).toList();
  }
  
/// Returns remaining stock for a line's UOM
/// = totalStock - qty used by ALL other lines of same item+uom (excluding self)
int remainingStockForLine({
  required String lineId,
  required String itemCode,
  required String uom,
}) {
  final current = state.value!;

  final line = current.selectedLines
      .where((l) => l.lineId == lineId)
      .firstOrNull;
  if (line == null) return 0;

  final uomModel = line.product.uoms.firstWhere(
    (u) => u.uom == uom,
    orElse: () => line.product.uoms.first,
  );
  final totalStock = uomModel.availableStock;

  // ✅ Sum qty from OTHER lines of same product+uom
  final usedByOtherLines = current.selectedLines
      .where((l) =>
          l.lineId != lineId &&
          l.product.itemCode == itemCode &&
          l.unit == uom)
      .fold(0, (sum, l) => sum + l.quantity);

  return (totalStock - usedByOtherLines).clamp(0, totalStock);
}
//?
Future<InvoiceModel?> createInvoice() async {
  final current = state.value!;
  state = AsyncData(current.copyWith(isSubmitting: true));

  try {
    final repo = ref.read(newOrderRepositoryProvider);
    final items = <Map<String, dynamic>>[];

    for (final line in current.selectedLines) {
      // ── Main paid line ──────────────────────────────────────
      final mainLine = <String, dynamic>{
        'itemCode': line.product.itemCode,
        'qty': line.quantity,
        'uom': line.unit,
      };

      // Return with custom rate
      if (current.isReturn && line.customRate != null) {
        mainLine['rate'] = line.customRate;
      }

      // All Free → rate: 0
      if (line.isAllFree) {
        mainLine['rate'] = 0;
      }

      items.add(mainLine);

      // ── FOC → separate line with rate: 0 ───────────────────
      if (!line.isAllFree && line.isFocEnabled && line.focQuantity > 0) {
        items.add({
          'itemCode': line.product.itemCode,
          'qty': line.focQuantity,
          'uom': line.focUom ?? line.unit,
          'rate': 0,
        });
      }
    }

     // ── Discount fields ─────────────────────────────────────────
    double? discountAmount;
    double? additionalDiscountPercentage;

    if (current.hasDiscount && current.discountValue != null && current.discountValue! > 0) {
      if (current.discountType == DiscountType.percentage) {
        additionalDiscountPercentage = current.discountValue; // ✅ Send directly as percentage
      } else {
        discountAmount = current.discountValue; // ✅ Send directly as amount
      }
    }
    // ── Log ─────────────────────────────────────────────────────
    Dev.logLine('Body');
    Dev.logLine('customer_id: ${current.customer?.customerId}');
    Dev.logLine('items: $items');
    Dev.logLine('delivery_charge: ${current.deliveryFee ?? "0"}');
    if (discountAmount != null) {
      Dev.logLine('discount_amount: ${discountAmount.toStringAsFixed(2)}');
    if (discountAmount != null) {
      Dev.logLine('discount_amount: $discountAmount');
    }
    if (additionalDiscountPercentage != null) {
      Dev.logLine('additional_discount_percentage: $additionalDiscountPercentage');
    }    }

    if (current.isReturn) {
      final response = await repo.createReturnInvoice(
        customerId: current.customer!.customerId!,
        items: items,
        deliveryFee: current.deliveryFee ?? "0",
        remark: current.remark,
      );

      state = AsyncData(state.value!.copyWith(
        selectedItems: {},
        selectedLines: [],
        isSubmitting: false,
      ));
      return response.data;
    } else {
      final response = await repo.createInvoice(
        customerId: current.customer!.customerId!,
        items: items,
        deliveryFee: current.deliveryFee ?? "0",
        remark: current.remark,
        discountAmount: discountAmount,  
        additionalDiscountPercentage: additionalDiscountPercentage,   
      );

      state = AsyncData(state.value!.copyWith(
        selectedItems: {},
        selectedLines: [],
        isSubmitting: false,
      ));
      return response.data;
    }
  } catch (e) {
    state = AsyncData(state.value!.copyWith(isSubmitting: false));
    AppToast.errorToast(
      current.isReturn ? 'Failed to create return' : 'Failed to create invoice',
    );
    return null;
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

  void setIsReturn(bool value) {
    final current = state.value!;
    state = AsyncData(current.copyWith(isReturn: value));
  }

  void updateRate(String itemCode, double? rate) {
    final current = state.value!;
    final map = Map<String, SelectedItem>.from(current.selectedItems);

    final existing = map[itemCode];
    if (existing == null) return;

    map[itemCode] = existing.copyWith(
      customRate: rate,
      clearCustomRate: rate == null,
    );

    state = AsyncData(current.copyWith(selectedItems: map));
  }

  void editRemark(String? value) {
    if (value == null || value.trim().isEmpty) {
      // ✅ Use clearRemark flag to force null
      state = AsyncData(
        state.value!.copyWith(clearRemark: true),
      );
    } else {
      state = AsyncData(
        state.value!.copyWith(remark: value.trim()),
      );
    }
  }

  void editDeliveryFee(String value) {
    final current = state.value!;

    state = AsyncData(
      current.copyWith(
        deliveryFee: value,
      ),
    );
  }

// DISCOUNT FUNCTIONALITY

  void setDiscount(DiscountType type, double value) {
    final current = state.value!;
    state = AsyncData(current.copyWith(
      discountType: type,
      discountValue: value,
    ));
  }

  void removeDiscount() {
    final current = state.value!;
    state = AsyncData(current.copyWith(clearDiscount: true));
  }

  double calculateDiscountAmount(double subtotal) {
    final current = state.value!;
    if (!current.hasDiscount) return 0;

    if (current.discountType == DiscountType.percentage) {
      return subtotal * (current.discountValue! / 100);
    } else {
      return current.discountValue!;
    }
  }
// Inside new_order_controller.dart — add this method
  // ── FOC (Free of Charge) Methods ─────────────────────────

  /// Toggle FOC checkbox on/off
  void toggleFoc(String itemCode, {bool? value}) {
    final current = state.value!;
    final map = Map<String, SelectedItem>.from(current.selectedItems);

    final existing = map[itemCode];
    if (existing == null) return;

    final newValue = value ?? !existing.isFocEnabled;

    // When enabling FOC, default to first UOM if not set
    String? newFocUom = existing.focUom;
    if (newValue && newFocUom == null) {
      newFocUom = existing.product.uoms.isNotEmpty
          ? existing.product.uoms.first.uom
          : existing.unit;
    }

    map[itemCode] = existing.copyWith(
      isFocEnabled: newValue,
      focUom: newFocUom,
      focQuantity: newValue ? existing.focQuantity : 0, // Reset if disabled
    );

    state = AsyncData(current.copyWith(selectedItems: map));
  }

  /// Update FOC UOM (can be different from main item UOM)
  void updateFocUom(String itemCode, String uom) {
    final current = state.value!;
    final map = Map<String, SelectedItem>.from(current.selectedItems);

    final existing = map[itemCode];
    if (existing == null || !existing.isFocEnabled) return;

    map[itemCode] = existing.copyWith(
      focUom: uom,
      focQuantity: 0, // Reset quantity when UOM changes to avoid stock issues
    );

    state = AsyncData(current.copyWith(selectedItems: map));
  }

  /// Update FOC Quantity — independent from main quantity, limited by stock only
  void updateFocQuantity(String itemCode, int freeQty) {
    final current = state.value!;
    final map = Map<String, SelectedItem>.from(current.selectedItems);

    final existing = map[itemCode];
    if (existing == null || !existing.isFocEnabled) return;

    // Check stock for the specific FOC UOM
    final focUom = existing.focUom ?? existing.unit;
    final stockCheck = _checkStockForUom(existing.product, focUom, freeQty);

    if (!stockCheck.isAvailable) {
      AppToast.errorToast(
          '${'insufficient_foc_stock'.tr()}: ${stockCheck.message}');
      return;
    }

    // ✅ No clamping to existing.quantity — FOC is independent
    map[itemCode] = existing.copyWith(focQuantity: freeQty);
    state = AsyncData(current.copyWith(selectedItems: map));
  }

  void updateFreeQuantity(String itemCode, int freeQty) {
    final current = state.value!;
    final map = Map<String, SelectedItem>.from(current.selectedItems);

    final existing = map[itemCode];
    if (existing == null) return;

    // ✅ Independent from main quantity
    map[itemCode] = existing.copyWith(focQuantity: freeQty);
    state = AsyncData(current.copyWith(selectedItems: map));
  }

  /// Helper: Check stock for specific UOM
  StockCheckResult _checkStockForUom(
      ProductModel product, String uom, int requestedQty) {
    if (requestedQty <= 0) return StockCheckResult(true, '');

    final uomData = product.uoms.firstWhere(
      (u) => u.uom == uom,
      orElse: () => product.uoms.first,
    );

    final available = uomData.availableStock ?? 0;

    if (requestedQty > available) {
      return StockCheckResult(false, '${'available'.tr()}: $available $uom');
    }
    return StockCheckResult(true, '');
  }

  /// Calculate total (excluding FOC items from monetary value)
  double calculateTotal() {
    final current = state.value!;
    return current.selectedItems.values.fold(0.0, (sum, item) {
      // FOC items contribute 0 to total value
      final effectivePrice = item.customRate ?? item.product.price;
      return sum + (effectivePrice * item.quantity);
    });
  }

  void toggleAllFree(String itemCode, {required bool value}) {
    final current = state.value!;
    final map = Map<String, SelectedItem>.from(current.selectedItems);
    final existing = map[itemCode];
    if (existing == null) return;

    map[itemCode] = existing.copyWith(
      isAllFree: value,
      // ✅ When all free is ON: disable FOC
      isFocEnabled: value ? false : existing.isFocEnabled,
      // ✅ Reset freeQuantity when toggling all free
      freeQuantity: value ? existing.quantity : 0,
    );

    state = AsyncData(current.copyWith(selectedItems: map));
  }

  //! ── Add a new UOM line to an item ──────────────────────────────
  void addUomLine(String itemCode) {
    final current = state.value!;
    final map = Map<String, SelectedItem>.from(current.selectedItems);
    final existing = map[itemCode];
    if (existing == null) return;

    // Pick first UOM that isn't already used as a default suggestion
    final usedUoms = {
      existing.unit,
      ...existing.extraUomLines.map((l) => l.uom),
    };

    final availableUom = existing.product.uoms.map((u) => u.uom).firstWhere(
          (u) => !usedUoms.contains(u),
          orElse: () => existing.product.uoms.first.uom,
        );

    final newLine = UomLine(uom: availableUom, quantity: 1);
    final updatedLines = [...existing.extraUomLines, newLine];

    map[itemCode] = existing.copyWith(extraUomLines: updatedLines);
    state = AsyncData(current.copyWith(selectedItems: map));
  }

// ── Remove a UOM line by index ──────────────────────────────────
  void removeUomLine(String itemCode, int lineIndex) {
    final current = state.value!;
    final map = Map<String, SelectedItem>.from(current.selectedItems);
    final existing = map[itemCode];
    if (existing == null) return;

    final updatedLines = [...existing.extraUomLines];
    updatedLines.removeAt(lineIndex);

    map[itemCode] = existing.copyWith(extraUomLines: updatedLines);
    state = AsyncData(current.copyWith(selectedItems: map));
  }

  void removeItem(String itemCode) {
    final current = state.value!;

    final map = Map<String, SelectedItem>.from(current.selectedItems)
      ..remove(itemCode);

    final lines = List<SelectedItemLine>.from(current.selectedLines)
      ..removeWhere((l) => l.product.itemCode == itemCode);

    state = AsyncData(current.copyWith(
      selectedItems: map,
      selectedLines: lines,
    ));
  }

// ── Update UOM line UOM ─────────────────────────────────────────
  void updateUomLineUnit(String itemCode, int lineIndex, String uom) {
    final current = state.value!;
    final map = Map<String, SelectedItem>.from(current.selectedItems);
    final existing = map[itemCode];
    if (existing == null) return;

    final updatedLines = [...existing.extraUomLines];
    updatedLines[lineIndex] = updatedLines[lineIndex].copyWith(uom: uom);

    map[itemCode] = existing.copyWith(extraUomLines: updatedLines);
    state = AsyncData(current.copyWith(selectedItems: map));
  }

// ── Update UOM line quantity ────────────────────────────────────
  void updateUomLineQuantity(String itemCode, int lineIndex, int qty) {
    final current = state.value!;
    final map = Map<String, SelectedItem>.from(current.selectedItems);
    final existing = map[itemCode];
    if (existing == null) return;

    if (qty < 0) return;

    final updatedLines = [...existing.extraUomLines];
    updatedLines[lineIndex] = updatedLines[lineIndex].copyWith(quantity: qty);

    map[itemCode] = existing.copyWith(extraUomLines: updatedLines);
    state = AsyncData(current.copyWith(selectedItems: map));
  }

//! ── Add a duplicate line for same product ──────────────────────
  void addLineForItem(ProductModel item) {
    final current = state.value!;
    var lines = List<SelectedItemLine>.from(current.selectedLines);

    // ✅ Pick first UOM that has stock > 0
    final availableUom = item.uoms.firstWhere(
      (u) => (u.availableStock) > 0,
      orElse: () => item.uoms.first, // fallback even if 0
    );

    lines.add(
      SelectedItemLine(
        lineId: const Uuid().v4(),
        product: item,
        quantity: 1,
        unit: availableUom.uom,
      ),
    );

    state = AsyncData(current.copyWith(selectedLines: lines));
  }

// ── Remove a specific line ─────────────────────────────────────
  void removeLine(String lineId, String itemCode) {
    final current = state.value!;
    var lines = List<SelectedItemLine>.from(current.selectedLines);
    lines.removeWhere((l) => l.lineId == lineId);

    // If no lines remain for this product, also remove from selectedItems
    final remaining = lines.where((l) => l.product.itemCode == itemCode);
    final map = Map<String, SelectedItem>.from(current.selectedItems);
    if (remaining.isEmpty) {
      map.remove(itemCode);
    }

    state = AsyncData(current.copyWith(
      selectedLines: lines,
      selectedItems: map,
    ));
  }

// ── Update a line field ────────────────────────────────────────
  void updateLine(
      String lineId, SelectedItemLine Function(SelectedItemLine) updater) {
    final current = state.value!;
    final lines = current.selectedLines.map((l) {
      if (l.lineId == lineId) return updater(l);
      return l;
    }).toList();
    state = AsyncData(current.copyWith(selectedLines: lines));
  }


  void updateLineQuantity(String lineId, int qty) {
  final current = state.value!;

  final line = current.selectedLines
      .where((l) => l.lineId == lineId)
      .firstOrNull;
  if (line == null) return;

  // ✅ UOM-specific stock
  final uomModel = line.product.uoms.firstWhere(
    (u) => u.uom == line.unit,
    orElse: () => line.product.uoms.first,
  );
  final maxStock = uomModel.availableStock;

  if (maxStock == 0) {
    AppToast.errorToast('${'out_of_stock'.tr()} (${line.unit})');
    return;
  }

  final clamped = qty.clamp(1, maxStock);

  if (qty > maxStock) {
    AppToast.errorToast('${'max_stock'.tr()}: $maxStock ${line.unit}');
  }

  // ✅ Update line quantity
  final lines = current.selectedLines.map((l) {
    if (l.lineId == lineId) return l.copyWith(quantity: clamped);
    return l;
  }).toList();

  // ✅ Sync selectedItems if first line
  final isFirst = current.selectedLines
          .where((l) => l.product.itemCode == line.product.itemCode)
          .firstOrNull
          ?.lineId == lineId;

  final map = Map<String, SelectedItem>.from(current.selectedItems);
  if (isFirst) {
    final existing = map[line.product.itemCode];
    if (existing != null) {
      map[line.product.itemCode] = existing.copyWith(quantity: clamped);
    }
  }

  state = AsyncData(current.copyWith(
    selectedLines: lines,
    selectedItems: map,
  ));
}

void updateLineUnit(String lineId, String unit) {
  final current = state.value!;

  final line = current.selectedLines
      .where((l) => l.lineId == lineId)
      .firstOrNull;
  if (line == null) return;

  // ✅ Get stock for new UOM
  final uomModel = line.product.uoms.firstWhere(
    (u) => u.uom == unit,
    orElse: () => line.product.uoms.first,
  );
  final maxStock = uomModel.availableStock;

  // ✅ Clamp quantity to new UOM stock
  final clampedQty = maxStock == 0 ? 1 : line.quantity.clamp(1, maxStock);

  final lines = current.selectedLines.map((l) {
    if (l.lineId == lineId) {
      return l.copyWith(unit: unit, quantity: clampedQty);
    }
    return l;
  }).toList();

  // ✅ Sync selectedItems if first line
  final isFirst = current.selectedLines
          .where((l) => l.product.itemCode == line.product.itemCode)
          .firstOrNull
          ?.lineId == lineId;

  final map = Map<String, SelectedItem>.from(current.selectedItems);
  if (isFirst) {
    final existing = map[line.product.itemCode];
    if (existing != null) {
      map[line.product.itemCode] = existing.copyWith(
        unit: unit,
        quantity: clampedQty,
      );
    }
  }

  state = AsyncData(current.copyWith(
    selectedLines: lines,
    selectedItems: map,
  ));
}

  void _syncFirstLineToSelectedItems(
    String lineId,
    String itemCode,
    int qty,
    String unit,
  ) {
    final current = state.value!;

    // Only sync if this lineId is the FIRST line for this product
    final firstLine = current.selectedLines
        .where((l) => l.product.itemCode == itemCode)
        .firstOrNull;

    if (firstLine == null || firstLine.lineId != lineId) return;

    final map = Map<String, SelectedItem>.from(current.selectedItems);
    final existing = map[itemCode];
    if (existing == null) return;

    map[itemCode] = existing.copyWith(quantity: qty, unit: unit);
    state = AsyncData(current.copyWith(selectedItems: map));
  }

  void updateLineFocToggle(String lineId, bool enabled) => updateLine(
      lineId,
      (l) => l.copyWith(
            isFocEnabled: enabled,
            isAllFree: enabled ? false : l.isAllFree,
          ));

  void updateLineAllFree(String lineId, bool allFree) => updateLine(
      lineId,
      (l) => l.copyWith(
            isAllFree: allFree,
            isFocEnabled: allFree ? false : l.isFocEnabled,
          ));

  void updateLineFocUom(String lineId, String uom) =>
      updateLine(lineId, (l) => l.copyWith(focUom: uom));

void updateLineFocQuantity(String lineId, int qty) {
  final current = state.value!;

  final line = current.selectedLines
      .where((l) => l.lineId == lineId)
      .firstOrNull;
  if (line == null) return;

  final focUom = line.focUom ?? line.unit;
  final focUomModel = line.product.uoms.firstWhere(
    (u) => u.uom == focUom,
    orElse: () => line.product.uoms.first,
  );
  final focTotalStock = focUomModel.availableStock;

  // ✅ How much stock is consumed by ALL lines of same item for this UOM
  final consumedByAll = current.selectedLines
      .where((l) => l.product.itemCode == line.product.itemCode)
      .fold(0, (sum, l) {
        int consumed = 0;
        // Main qty consuming this UOM
        if (l.unit == focUom) consumed += l.quantity;
        // OTHER lines' FOC consuming this UOM
        if (l.lineId != lineId &&
            l.isFocEnabled &&
            (l.focUom ?? l.unit) == focUom) {
          consumed += l.focQuantity;
        }
        return sum + consumed;
      });

  // ✅ Remaining = total - already consumed (excluding this line's current FOC)
  final currentFocOfThisLine = line.isFocEnabled ? line.focQuantity : 0;
  final remaining = (focTotalStock - consumedByAll + currentFocOfThisLine)
      .clamp(0, focTotalStock);

  if (qty > remaining) {
    AppToast.errorToast('${'max_stock'.tr()}: $remaining $focUom');
    return;
  }

  final clamped = qty.clamp(0, remaining);
  updateLine(lineId, (l) => l.copyWith(focQuantity: clamped));
}
}
