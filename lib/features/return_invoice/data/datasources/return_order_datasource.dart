import 'package:sabaa/src/infrastructure/api/endpoint/api_endpoints.dart';
import 'package:sabaa/src/infrastructure/api/response/api_response.dart';
import 'package:sabaa/src/infrastructure/network/services/network_service.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';

import '../../../van_stock/domain/model/van_stock_model.dart';
import '../../domain/model/return_invoice_model.dart';

class ReturnOrderDatasource {
  final NetworkService _networkService;

  ReturnOrderDatasource(this._networkService);

  Future<ApiResponse<ReturnInvoiceModel>> getInvoiceDetails({
    required int page,
   required String invoiceId,
    String? category,
  }) async {
    try {
      final response = await _networkService.get(
        ApiEndPoints.getInvoiceDetails,
        queryParameters: {
          'page': page,
           'invoice_id': invoiceId,
          if (category != null) 'category': category,
        },
      );

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Request getInvoiceDetails failed');
      }

      return ApiResponse.fromJson(
        response.data,
        (json) => ReturnInvoiceModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      Dev.logLine('Error in getInvoiceDetails: $e');
      rethrow;
    }
  }

  /// Create return order
  Future<ApiResponse<void>> createReturnOrder({
    required String invoiceId,
    required List<Map<String, dynamic>> items,
    String? returnReason,
  }) async {
    try {
      final response = await _networkService.post(
        ApiEndPoints.createReturnOrder, // Assuming endpoint exists
        data: {
          "invoice_id": invoiceId,
          "items": items,
          // if (returnReason != null) "return_reason": returnReason,
          // "is_return": true,
        },
      );

      if (response.statusCode != 201) {
        Dev.logError("Create return order failed in datasource");
        throw Exception('Create return order failed');
      }

      return ApiResponse.fromJson(response.data, (_) {});
    } catch (e) {
      Dev.logError('Error in createReturnOrder: $e');
      rethrow;
    }
  }

}