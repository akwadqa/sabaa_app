import 'package:flutter/material.dart';
import 'package:sabaa/features/customers/domain/model/create_customer_params.dart';
import 'package:sabaa/features/customers/domain/model/create_customer_response/create_customer_response.dart';
import 'package:sabaa/src/infrastructure/api/endpoint/api_endpoints.dart';
import 'package:sabaa/src/infrastructure/api/response/api_response.dart';
import 'package:sabaa/src/infrastructure/network/services/network_service.dart';

class CustomerRemoteDataSource {
  final NetworkService _networkService;

  CustomerRemoteDataSource(this._networkService);

  Future<ApiResponse<CustomerModel>> createCustomer(
      CreateCustomerParams params) async {
    try {
      final response = await _networkService.post(
        ApiEndPoints.createCustomer,
        queryParameters: params.toJson(),
      );

      if (response.data == null || response.statusCode > 201) {
        throw Exception('Failed to load data');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => CustomerModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      debugPrint('Error in getData: e');
      rethrow;
    }
  }

  Future<ApiResponse<List<CustomerModel>>> getCustomers(
      int page, String name) async {
    try {
      final response = await _networkService.get(
        ApiEndPoints.getCustomers,
        queryParameters: {
          'page': page,
          'name': name,
        },
      );

      return ApiResponse.fromJson(
        response.data,
        (json) => (json as List)
            .map((item) => CustomerModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  // Future<ApiResponse<List<CustomerModel>>> searchCustomers(
  //     String query, int page) async {
  //   try {
  //     final response = await _networkService.get(
  //       ApiEndPoints.searchCustomers,
  //       queryParameters: {
  //         'page': page,
  //         'name': query,
  //       },
  //     );

  //     return ApiResponse.fromJson(
  //       response.data,
  //       (json) => (json as List)
  //           .map((item) => CustomerModel.fromJson(item as Map<String, dynamic>))
  //           .toList(),
  //     );
  //   } catch (e) {
  //     return ApiResponse.error(message: e.toString());
  //   }
  // }
}
