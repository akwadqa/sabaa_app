import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/order/data/data_source/order_remote_data_source.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
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
      {required String customerId, String? status}) async {
    final response = await _remoteDataSource.getOrderSummary(
        customerId: customerId, status: status);

    if (response.status == 200) {
      return response;
    }

    throw AppException(response.message);
  }

Future<ApiResponse<PaymentResponseModel>> createPayment({
  required String invoiceId,
  required double amount,
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
}
