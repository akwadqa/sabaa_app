import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/customers/domain/model/customer_model.dart';
import 'package:sabaa/features/new_order/domain/model/order_item.dart';
import 'package:sabaa/features/van_stock/domain/model/product_model.dart';
import 'package:sabaa/features/van_stock/domain/model/stock_category_model.dart';

import '../../../customers/domain/model/create_customer_response/create_customer_response.dart';

class NewOrderState {
  const NewOrderState({
    this.allItems = const [],
    this.filteredItems = const [],
    this.categories = const [],
    this.searchQuery = '',
    this.selectedCategory,
    this.selectedCategoryIndex = 0,
    this.selectedItems = const {}, // 🔥 important
    this.listState,
    this.customer,
    this.isSubmitting = false,
     this.deliveryFee,
  });

  final List<ProductModel> allItems;
  final List<ProductModel> filteredItems;
  final List<StockCategoryModel> categories;

  final String searchQuery;
  final String? selectedCategory;
  final int selectedCategoryIndex;
  final CustomerModel? customer;
  final bool isSubmitting;

  /// 🔥 key = itemCode
  final Map<String, SelectedItem> selectedItems;

  final AsyncValue<void>? listState;
  final String? deliveryFee;
  bool get hasSelection => selectedItems.isNotEmpty;

  NewOrderState copyWith({
    List<ProductModel>? allItems,
    List<ProductModel>? filteredItems,
    List<StockCategoryModel>? categories,
    String? searchQuery,
    String? selectedCategory,
    CustomerModel? customer,
    int? selectedCategoryIndex,
    Map<String, SelectedItem>? selectedItems,
    AsyncValue<void>? listState,
    bool? isSubmitting,
    String? deliveryFee,
  }) {
    return NewOrderState(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      categories: categories ?? this.categories,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      selectedItems: selectedItems ?? this.selectedItems,
      listState: listState ?? this.listState,
      customer: customer ?? this.customer,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      deliveryFee: deliveryFee ?? this.deliveryFee,
    );
  }
}
