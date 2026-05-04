import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/van_stock/domain/model/van_stock_model.dart';
import 'package:sabaa/src/infrastructure/api/response/api_response.dart';
import 'package:sabaa/src/infrastructure/network/services/dio_client.dart';
import 'package:sabaa/src/logger/failure/exceptions/app_exception.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';

import '../datasources/new_order_datasource.dart';

part 'new_order_repository.g.dart';
@Riverpod(keepAlive: true)
NewOrderRepository newOrderRepository(Ref ref) {
  final network = ref.watch(networkServiceProvider());
  return NewOrderRepository(NewOrderDatasource(network));
}

class NewOrderRepository {
  final NewOrderDatasource _datasource;

  NewOrderRepository(this._datasource);

  Future<ApiResponse<VanStockModel>> getProducts({
    required int page,
    String? search,
    String? category,
  }) async {
    final response = await _datasource.getProducts(
      page: page,
      search: search,
      category: category,
    );

    if (response.hasSucceeded) return response;

    throw AppException(message: response.message);
  }
  Future<ApiResponse<void>> createInvoice({
  required String customerId,
  required String deliveryFee,
  required List<Map<String, dynamic>> items,
}) async {
    final response = await _datasource.createInvoice(
     customerId:customerId, items: items,deliveryFee:deliveryFee
    );

  if (response.hasSucceeded ) {
      return response;
    }
      Dev.logError("Create invoice failed in repo");
    
    throw AppException(message: response.message);
  }


}