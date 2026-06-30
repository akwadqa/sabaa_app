import 'package:dartz/dartz.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/src/infrastructure/api/endpoint/api_endpoints.dart';
import 'package:sabaa/src/infrastructure/api/response/api_response.dart';
import 'package:sabaa/src/infrastructure/network/services/network_service.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';

import '../../../van_stock/domain/model/van_stock_model.dart';


class NewOrderDatasource {
  final NetworkService _networkService;

  NewOrderDatasource(this._networkService);

  Future<ApiResponse<VanStockModel>> getProducts({required int page,  String? search, String? category}) async {
    try {
      final response = await _networkService.get(
        ApiEndPoints.getVanStock,
         queryParameters: {
          'page': page,
        if(search!=null)  "search":search,
        if(category!=null)  "category":category,

        },
      );

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Request getProducts failed');
      }

      return ApiResponse.fromJson(
        response.data,
        (json) => VanStockModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      Dev.logLine('Error in getProducts: $e');
      rethrow;
    }
  }

Future<ApiResponse<InvoiceModel>> createInvoice({
  required String customerId,
   String? remark,
  required String deliveryFee,
  required List<Map<String, dynamic>> items,
}) async {
  try {
    final response = await _networkService.post(
      ApiEndPoints.createInvoice, 
      data: {
        "customer_id": customerId,
        "items": items,
        "delivery_charge": deliveryFee,
                if (remark != null && remark.isNotEmpty) "remarks": remark,

      },
    );

    if ( response.statusCode != 201) {
      Dev.logError("Create invoice failed in data source");
      throw Exception('Create invoice failed');
    }

    return ApiResponse.fromJson(response.data, (json) =>InvoiceModel.fromJson(json as Map<String,dynamic>));
  } catch (e) {
    Dev.logError('Error in createInvoice: $e');
    rethrow;
  }
}


  Future<ApiResponse<InvoiceModel>> createReturnOrder({
    // required String invoiceId,
    required List<Map<String, dynamic>> items,
    
  required String customerId,
   String? remark,
  required String deliveryFee,
    String? returnReason,
  }) async {
    try {
      final response = await _networkService.post(
        ApiEndPoints.createReturnOrder, // Assuming endpoint exists
        data: {
          // "invoice_id": invoiceId,
        if (remark != null && remark.isNotEmpty) "remarks": remark,

        "delivery_charge": deliveryFee,
        "customer_id": customerId,

          "items": items,
          // if (returnReason != null) "return_reason": returnReason,
          "is_return": true,
        },
      );

      if (response.statusCode != 201) {
        Dev.logError("Create return order failed in datasource");
        throw Exception('Create return order failed');
      }

    return ApiResponse.fromJson(response.data, (json) =>InvoiceModel.fromJson(json as Map<String,dynamic>));
    } catch (e) {
      Dev.logError('Error in createReturnOrder: $e');
      rethrow;
    }
  }

}
