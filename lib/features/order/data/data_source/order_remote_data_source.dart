import 'package:flutter/material.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/src/infrastructure/api/endpoint/api_endpoints.dart';
import 'package:sabaa/src/infrastructure/api/response/api_response.dart';
import 'package:sabaa/src/infrastructure/network/services/network_service.dart';

class OrderRemoteDataSource {
  final NetworkService _networkService;

  OrderRemoteDataSource(this._networkService);

  Future<ApiResponse<OrderSummaryModel>> getOrderSummary(
      {required String customerId, String? status}) async {
    try {
      final response = await _networkService.get(
        ApiEndPoints.orderSummary,
        queryParameters: {
          // 'customer_id': customerId,
          'customer_id': 1017,
          // 'status': status,
        },
      );

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Failed to load data');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => OrderSummaryModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      debugPrint('Error in getOrderSummary: $e');
      rethrow;
    }
  }
}
