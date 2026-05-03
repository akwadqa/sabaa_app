import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/van_stock/domain/model/van_stock_model.dart';
import 'package:sabaa/src/infrastructure/api/response/api_response.dart';
import 'package:sabaa/src/infrastructure/network/services/dio_client.dart';
import 'package:sabaa/src/logger/failure/exceptions/app_exception.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';

import '../../domain/model/return_invoice_model.dart';
import '../datasources/return_order_datasource.dart';

part 'return_order_repository.g.dart';

@Riverpod(keepAlive: true)
ReturnOrderRepository returnOrderRepository(Ref ref) {
  final network = ref.watch(networkServiceProvider());
  return ReturnOrderRepository(ReturnOrderDatasource(network));
}

class ReturnOrderRepository {
  final ReturnOrderDatasource _datasource;

  ReturnOrderRepository(this._datasource);

  /// Get products available for return
  Future<ApiResponse<ReturnInvoiceModel>> getInvoiceDetails({
    required int page,
  required  String invoiceId,
    String? category,
  }) async {
    try {
      final response = await _datasource.getInvoiceDetails(
        page: page,
        invoiceId: invoiceId,
        category: category,
      );

      if (response.hasSucceeded) return response;

      throw AppException(message: response.message);
    } catch (e) {
      Dev.logError('Error in getProducts: $e');
      rethrow;
    }
  }

  /// Create return order
  Future<ApiResponse<void>> createReturnOrder({
  required  String invoiceId,
    required List<Map<String, dynamic>> items,
    String? returnReason,
  }) async {
    try {
      final response = await _datasource.createReturnOrder(
        invoiceId: invoiceId,
        items: items,
        returnReason: returnReason,
      );

      if (response.hasSucceeded) {
        return response;
      }

      Dev.logError("Create return order failed in repo");
      throw AppException(message: response.message);
    } catch (e) {
      Dev.logError('Error in createReturnOrder: $e');
      rethrow;
    }
  }


}