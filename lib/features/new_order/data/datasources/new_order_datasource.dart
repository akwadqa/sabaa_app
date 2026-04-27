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

Future<ApiResponse<void>> createInvoice({
  required String customerId,
  required List<Map<String, dynamic>> items,
}) async {
  try {
    final response = await _networkService.post(
      ApiEndPoints.createInvoice, 
      data: {
        "customer_id": customerId,
        "items": items,
      },
    );

    if ( response.statusCode != 201) {
      throw Exception('Create invoice failed');
    }

    return ApiResponse.fromJson(response.data, (_) => Null);
  } catch (e) {
    Dev.logLine('Error in createInvoice: $e');
    rethrow;
  }
}

}
