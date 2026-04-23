import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/van_stock/data/repositories/van_stock_repository.dart';
import 'package:sabaa/features/van_stock/domain/model/van_stock_model.dart';

import '../../domain/model/product_model.dart';

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
  FutureOr<VanStockModel> build() async {
    return await fetchStock(page: 1);
  }

  /// =====================
  /// FETCH
  /// =====================
  Future<VanStockModel> fetchStock({
    required int page,
    bool showLoading = true,
  }) async {
    try {
      if (showLoading) state = const AsyncLoading();

      final repo = ref.read(vanStockRepositoryProvider);
      final response = await repo.getVanStock(page: page); // 🔥 IMPORTANT

      _currentPage = response.pagination?.currentPage ?? 1;
      _totalPages = response.pagination?.totalPages ?? 1;

      if (page == 1) {
        _products.clear();
        _products.addAll(response.data!.products);
      } else {
        _products.addAll(response.data!.products);
      }

      final updated = response.data!.copyWith(
        products: List.from(_products),
      );

      state = AsyncData(updated);

      return updated;
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

    final nextPage = _currentPage + 1;

    final result = await fetchStock(
      page: nextPage,
      showLoading: false,
    );

    return result.products.isNotEmpty;
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
}