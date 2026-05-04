import 'package:sabaa/src/infrastructure/api/endpoint/api_endpoints.dart';
import 'package:sabaa/src/infrastructure/api/response/api_response.dart';
import 'package:sabaa/src/infrastructure/network/services/network_service.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';

import '../../domain/model/van_stock_model.dart';

class VanStockDatasource {
  final NetworkService _networkService;

  VanStockDatasource(this._networkService);

  Future<ApiResponse<VanStockModel>> getVanStock({required int page,  String? search, String? category}) async {
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
        throw Exception('Request getVanStock failed');
      }

      return ApiResponse.fromJson(
        response.data,
        (json) => VanStockModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      Dev.logLine('Error in getVanStock: $e');
      rethrow;
    }
  }
}
