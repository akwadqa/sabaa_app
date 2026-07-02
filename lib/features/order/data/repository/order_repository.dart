import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/order/data/data_source/order_remote_data_source.dart';
import 'package:sabaa/features/order/domain/create_payment/create_payment_response.dart';
import 'package:sabaa/features/order/domain/hyper_market_order_summary/hyper_market_order_summary_model.dart';
import 'package:sabaa/features/order/domain/hyper_market_order_summary_params.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/features/order/domain/stock_update_input.dart';
import 'package:sabaa/features/order/domain/upload_capture/upload_capture_response.dart';
import 'package:sabaa/src/infrastructure/api/response/api_response.dart';
import 'package:sabaa/src/infrastructure/network/exception/dio_exceptions.dart';
import 'package:sabaa/src/infrastructure/network/services/dio_client.dart';

import '../../domain/order_summary/payment_response_model.dart';

part 'order_repository.g.dart';

@Riverpod(keepAlive: true)
OrderRepository orderRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return OrderRepository(OrderRemoteDataSource(networkService));
}

class OrderRepository {
  final OrderRemoteDataSource _remoteDataSource;

  OrderRepository(this._remoteDataSource);

  Future<ApiResponse<OrderSummaryModel>> getOrderSummary(
      {required String customerId, String? status, required int page}) async {
    final response = await _remoteDataSource.getOrderSummary(
        customerId: customerId, status: status, page: page);

    if (response.status == 200) {
      return response;
    }

    throw AppException(response.message);
  }

  Future<ApiResponse<PaymentResponseModel>> createPayment({
    required String invoiceId,
    required String amount,
    required String paymentMethod,
  }) async {
    final response = await _remoteDataSource.createPayment(
      invoiceId: invoiceId,
      amount: amount,
      paymentMethod: paymentMethod,
    );

    if (response.hasSucceeded) {
      return response;
    }

    throw AppException(response.message);
  }

  Future<ApiResponse<UploadCaptureResponse>> upladCapture({
    required String visitId,
    required List<File> images,
    required String captureNote,
  }) async {
    final response = await _remoteDataSource.upladCapture(
      visitId: visitId,
      images: images,
      captureNote: captureNote,
    );

    if (response.status == 200) {
      return response;
    }

    throw AppException(response.message);
  }

  Future<ApiResponse<HyperMarketOrdersSummaryResponse>> hyperMarketOrderSummary(
      HyperMarketOrderSummaryParams params) async {
    final response = await _remoteDataSource.hyperMarketOrderSummary(params);

    if (response.status == 200) {
      return response;
    }

  throw AppException(response.message);
}

Future<String> getDocumentHtml({
  required String docName,
  String docType = 'Sales Invoice',
}) async {
  final response = await _remoteDataSource.getDocumentHtml(
    docName: docName,
    docType: docType,
  );

  if (response.hasSucceeded && response.data != null) {
    return response.data!;
  }

  throw AppException(response.message ?? 'Failed to fetch document HTML');
}
 Future<ApiResponse> hyperMarketUpdateStock(String visitId , List<StockUpdateInput> items) async {
  final response = await _remoteDataSource.hyperMarketUpdateStock(visitId, items);

  if (response.status == 200) {
    return response;
  }

  throw AppException(response.message);
}
}
