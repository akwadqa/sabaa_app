import 'package:easy_localization/easy_localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/order/data/repository/order_repository.dart';
import 'package:sabaa/features/order/domain/hyper_market_order_summary/hyper_market_order_summary_model.dart';
import 'package:sabaa/features/order/domain/hyper_market_order_summary_params.dart';
import 'package:sabaa/features/order/domain/stock_update_input.dart';
import 'package:sabaa/features/order/presentation/controller/hyper_market_order_state.dart';

part 'hyper_market_order_controller.g.dart';

@riverpod
class HyperMarketOrderController extends _$HyperMarketOrderController {
  @override
  FutureOr<HyperMarketOrderState> build() {
    return HyperMarketOrderState.initial();
  }

  void changeFilterFromDate(DateTime? fromDate) {
    state = AsyncData(state.value!.copyWith(filterFromDate: fromDate));
  }

  void changeFilterToDate(DateTime? toDate) {
    state = AsyncData(state.value!.copyWith(filterToDate: toDate));
  }

  void changeProductName(String? productName) {
    state = AsyncData(state.value!.copyWith(productName: productName));
  }

  void clearFilters() {
    state = AsyncData(HyperMarketOrderState.initial());
  }

  void addNewStockInput(String itemCode) {
    final current = state.value!;
    final updatedStockInputs =
        List<StockUpdateInput>.from(current.stockUpdateInputs)
          ..add(StockUpdateInput(
              item_code: itemCode,
              selectedUnit: current.hyperMarketOrdersSummaryResponse.value!
                  .items.first.availableUoms.first));
    state = AsyncData(current.copyWith(stockUpdateInputs: updatedStockInputs));
  }

  void resetInputFields() {
    final current = state.value!;
    final updatedStockInputs = <StockUpdateInput>[];
    state = AsyncData(current.copyWith(stockUpdateInputs: updatedStockInputs));
  }

  void changeUnitForFiled(int index, String? selectedUnit) {
    final current = state.value!;
    final updatedStockInputs =
        List<StockUpdateInput>.from(current.stockUpdateInputs);
    updatedStockInputs[index] = StockUpdateInput(
      item_code: updatedStockInputs[index].item_code,
      selectedUnit: selectedUnit,
      expiryDate: updatedStockInputs[index].expiryDate,
      currentStock: updatedStockInputs[index].currentStock,
    );
    state = AsyncData(current.copyWith(stockUpdateInputs: updatedStockInputs));
  }

  void changeDateForFiled(int index, String expiryDate) {
    final current = state.value!;
    final updatedStockInputs =
        List<StockUpdateInput>.from(current.stockUpdateInputs);
    updatedStockInputs[index] = StockUpdateInput(
      item_code: updatedStockInputs[index].item_code,
      selectedUnit: updatedStockInputs[index].selectedUnit,
      expiryDate: expiryDate,
      currentStock: updatedStockInputs[index].currentStock,
    );
    state = AsyncData(current.copyWith(stockUpdateInputs: updatedStockInputs));
  }

  void changestockForFiled(int index, int currentStock) {
    final current = state.value!;
    final updatedStockInputs =
        List<StockUpdateInput>.from(current.stockUpdateInputs);
    updatedStockInputs[index] = StockUpdateInput(
      item_code: updatedStockInputs[index].item_code,
      selectedUnit: updatedStockInputs[index].selectedUnit,
      expiryDate: updatedStockInputs[index].expiryDate,
      currentStock: currentStock,
    );
    state = AsyncData(current.copyWith(stockUpdateInputs: updatedStockInputs));
  }

  bool canUpdate() {
    final current = state.value!;
    for (var input in current.stockUpdateInputs) {
      if (input.selectedUnit == null ||
          input.expiryDate == 'Select Date' ||
          input.currentStock <= 0) {
        return false;
      }
    }
    return true;
  }

  Future<HyperMarketOrdersSummaryResponse?> getHyperMarketOderSummary(
      String customerId) async {
    final current = state.value!;

    state = AsyncData(current.copyWith(
        hyperMarketOrdersSummaryResponse: const AsyncLoading()));

    try {
      final params = HyperMarketOrderSummaryParams(
        customer: customerId,
        item: current.productName ?? '',
        from_date: current.filterFromDate != null
            ? DateFormat('yyyy-MM-dd').format(current.filterFromDate!)
            : null,
        to_date: current.filterToDate != null
            ? DateFormat('yyyy-MM-dd').format(current.filterToDate!)
            : null,
      );

      final response = await ref
          .read(orderRepositoryProvider)
          .hyperMarketOrderSummary(params);

      state = AsyncData(
        current.copyWith(
          hyperMarketOrdersSummaryResponse: AsyncData(response.data!),
        ),
      );

      return response.data;
    } catch (e, st) {
      state = AsyncData(current.copyWith(
          hyperMarketOrdersSummaryResponse: AsyncError(e, st)));

      return null;
    }
  }

  Future<void> hyperMarketUpdateStock(String visitId) async {
    final current = state.value!;

    state = AsyncData(current.copyWith(updateStock: const AsyncLoading()));

    try {
      final response = await ref
          .read(orderRepositoryProvider)
          .hyperMarketUpdateStock(visitId, current.stockUpdateInputs);

      state = AsyncData(
        current.copyWith(
          updateStock: AsyncData(response.data),
        ),
      );

      return response.data;
    } catch (e, st) {
      state = AsyncData(current.copyWith(updateStock: AsyncError(e, st)));

      return null;
    }
  }
}
