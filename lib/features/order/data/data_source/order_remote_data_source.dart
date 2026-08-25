import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/features/order/domain/create_payment/create_payment_response.dart';
import 'package:sabaa/features/order/domain/hyper_market_order_summary/hyper_market_order_summary_model.dart';
import 'package:sabaa/features/order/domain/hyper_market_order_summary_params.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/features/order/domain/stock_update_input.dart';
import 'package:sabaa/features/order/domain/upload_capture/upload_capture_response.dart';
import 'package:sabaa/src/infrastructure/api/endpoint/api_endpoints.dart';
import 'package:sabaa/src/infrastructure/api/response/api_response.dart';
import 'package:sabaa/src/infrastructure/network/services/network_service.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';

import '../../../customers/domain/model/customer_details_model.dart';
import '../../domain/create_payment/credit_note_reconcile_response.dart';
import '../../domain/order_summary/credit_note_model.dart';
import '../../domain/order_summary/payment_response_model.dart';

class OrderRemoteDataSource {
  final NetworkService _networkService;

  OrderRemoteDataSource(this._networkService);

  Future<ApiResponse<OrderSummaryModel>> getOrderSummary({
    required String customerId,
    String? status,
    required int page,
    String? action, // 👈 add this
    String? fromDate, // yyyy-MM-dd
    String? toDate,
  }) async {
    try {
      final response = await _networkService.get(
        ApiEndPoints.orderSummary,
        queryParameters: {
          'customer_id': customerId,
          // 'customer_id': 1017,
          if (status != null) 'status': status,
          'page': page,
          if (action != null) 'action': action, // 👈 send only if provided
          if (fromDate != null) 'from_date': fromDate, // ✅
          if (toDate != null) 'to_date': toDate, // ✅
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
// In order_remote_data_source.dart add:

  Future<ApiResponse<CustomerDetailsModel>> getCustomerDetails({
    required String customerId,
  }) async {
    try {
      final response = await _networkService.get(
        ApiEndPoints.getCustomerDetails,
        queryParameters: {
          'customer_id': customerId,
        },
      );

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Failed to get customer details');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => CustomerDetailsModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      Dev.logError('Error in getCustomerDetails: $e');
      rethrow;
    }
  }

  Future<ApiResponse<CreditNoteReconcileResponse>> reconcileCreditNotes({
    required String invoiceId,
    required List<String> creditNoteIds,
  }) async {
    try {
      final response = await _networkService.get(
        ApiEndPoints.reconcileCreditNotes,
        queryParameters: {
          'invoice_id': invoiceId,
          'credit_notes': jsonEncode(creditNoteIds),
        },
      );

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Failed to reconcile credit notes');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) =>
            CreditNoteReconcileResponse.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      Dev.logError('Error in reconcileCreditNotes: $e');
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

  Future<ApiResponse<HyperMarketOrdersSummaryResponse>> hyperMarketOrderSummary(
      HyperMarketOrderSummaryParams params) async {
    try {
      final response = await _networkService.get(
        ApiEndPoints.hyperMarketOrderSummary,
        queryParameters: {
          'item': params.item,
          'customer': params.customer,
          'from_date': params.from_date,
          'to_date': params.to_date,
        },
      );

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Failed to load data');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => HyperMarketOrdersSummaryResponse.fromJson(
            json as Map<String, dynamic>),
      );
    } catch (e) {
      debugPrint('Error in getData: $e');
      rethrow;
    }
  }

  Future<ApiResponse> hyperMarketUpdateStock(
      String visitId, List<StockUpdateInput> items) async {
    try {
      final response = await _networkService.get(
        ApiEndPoints.hyperMarketUpdateStock,
        queryParameters: {
          'visit_id': visitId,
          'items': jsonEncode(items.map((item) => item.toJson()).toList()),
        },
      );

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Failed to load data');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) {},
      );
    } catch (e) {
      debugPrint('Error in getData: $e');
      rethrow;
    }
  }

// order_remote_data_source.dart

  Future<ApiResponse<String>> getDocumentHtml({
    required String docName,
    required String docType,
    String? fromDate,
    String? toDate,
  }) async {
    try {
      final response = await _networkService.get(
        ApiEndPoints.getDocumentHtml,
        queryParameters: {
          'doctype': docType,
          'doc_name': docName,
          if (fromDate != null) 'from_date': fromDate,
          if (toDate != null) 'to_date': toDate,
        },
      );

      Dev.logLine('📄 HTML response status: ${response.statusCode}');
      Dev.logLine('📄 HTML response data keys: ${(response.data as Map).keys}');
      Dev.logLine('📄 Data.data type: ${response.data['data'].runtimeType}');

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Failed to get document HTML');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) {
          // ✅ Handle both flat and nested response shapes
          if (json is Map<String, dynamic>) {
            final html = json['html'] as String?;
            Dev.logLine('📄 HTML length: ${html?.length ?? 0}');
            return html ?? '';
          }
          return '';
        },
      );
    } catch (e, st) {
      Dev.logError('❌ getDocumentHtml error: $e');
      Dev.logError('❌ Stack: $st');
      rethrow;
    }
  }
}
