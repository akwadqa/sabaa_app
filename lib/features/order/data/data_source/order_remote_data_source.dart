import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/features/order/domain/create_payment/create_payment_response.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/features/order/domain/upload_capture/upload_capture_response.dart';
import 'package:sabaa/src/infrastructure/api/endpoint/api_endpoints.dart';
import 'package:sabaa/src/infrastructure/api/response/api_response.dart';
import 'package:sabaa/src/infrastructure/network/services/network_service.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';

import '../../domain/order_summary/payment_response_model.dart';

class OrderRemoteDataSource {
  final NetworkService _networkService;

  OrderRemoteDataSource(this._networkService);

  Future<ApiResponse<OrderSummaryModel>> getOrderSummary(
      {required String customerId, String? status, required int page}) async {
    try {
      final response = await _networkService.get(
        ApiEndPoints.orderSummary,
        queryParameters: {
          'customer_id': customerId,
          // 'customer_id': 1017,
          'status': status,
          'page': page,
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

  Future<ApiResponse<PaymentResponseModel>> createPayment({
    required String invoiceId,
    required String amount,
    required String paymentMethod,
  }) async {
    try {
      final response = await _networkService.post(
        ApiEndPoints.createPaymentApi,
        data: {
          "invoice_id": invoiceId,
          "paid_amount": amount,
          "mode_of_payment": paymentMethod,
        },
      );

      if (response.statusCode != 201) {
        throw Exception('Create payment failed');
      }

      return ApiResponse.fromJson(
        response.data,
        (json) => PaymentResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      debugPrint('Error in createPayment: $e');
      rethrow;
    }
  }

  Future<ApiResponse<UploadCaptureResponse>> upladCapture({
    required String visitId,
    required List<File> images,
    required String captureNote,
  }) async {
    try {
      final data = FormData.fromMap({
        'visit_id': visitId,
        'note': captureNote,
        'images': await Future.wait(
          images.map(
            (file) => MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        ),
      });
      final response = await _networkService.post(
        ApiEndPoints.uploadCapture,
        data: data,
      );

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Request failed');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => UploadCaptureResponse.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      Dev.logLine('Error in submitData: $e');
      rethrow;
    }
  }
}
