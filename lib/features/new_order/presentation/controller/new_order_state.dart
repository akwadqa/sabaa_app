// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sabaa/features/customers/domain/model/customer_model.dart';
import 'package:sabaa/features/new_order/domain/model/order_item.dart';
import 'package:sabaa/features/van_stock/domain/model/product_model.dart';
import 'package:sabaa/features/van_stock/domain/model/stock_category_model.dart';

import '../../../customers/domain/model/create_customer_response/create_customer_response.dart';

enum DiscountType { percentage, amount }

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
    this.isReturn = false,
    this.isSubmitting = false,
    this.deliveryFee,
    this.remark,
    this.discountType,
    this.discountValue,
    this.selectedLines = const [],
  });

  final List<ProductModel> allItems;
  final List<ProductModel> filteredItems;
  final List<StockCategoryModel> categories;
  final String? remark;
  final String searchQuery;
  final String? selectedCategory;
  final int selectedCategoryIndex;
  final CustomerModel? customer;
  final bool isSubmitting;
  final bool isReturn;

  /// 🔥 key = itemCode
  final Map<String, SelectedItem> selectedItems;
  final DiscountType? discountType;
  final double? discountValue;
  final AsyncValue<void>? listState;
  final String? deliveryFee;
  final List<SelectedItemLine> selectedLines;

  bool get hasSelection => selectedItems.isNotEmpty;

  bool get hasDiscount =>
      discountType != null && discountValue != null && discountValue! > 0;

  NewOrderState copyWith({
    List<ProductModel>? allItems,
    List<ProductModel>? filteredItems,
    List<StockCategoryModel>? categories,
    String? remark,
    String? searchQuery,
    String? selectedCategory,
    int? selectedCategoryIndex,
    CustomerModel? customer,
    bool? isSubmitting,
    bool? isReturn,
    Map<String, SelectedItem>? selectedItems,
    AsyncValue<void>? listState,
    String? deliveryFee,
    bool clearRemark = false,
    DiscountType? discountType,
    double? discountValue,
    bool clearDiscount = false,
    List<SelectedItemLine>? selectedLines,
  }) {
    return NewOrderState(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      categories: categories ?? this.categories,
      remark: clearRemark ? null : (remark ?? this.remark),
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      customer: customer ?? this.customer,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isReturn: isReturn ?? this.isReturn,
      selectedItems: selectedItems ?? this.selectedItems,
      listState: listState ?? this.listState,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      discountType: clearDiscount ? null : (discountType ?? this.discountType),
      discountValue:
          clearDiscount ? null : (discountValue ?? this.discountValue),
      selectedLines: selectedLines ?? this.selectedLines,
    );
  }
}
