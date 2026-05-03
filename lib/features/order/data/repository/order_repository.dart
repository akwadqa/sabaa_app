import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/order/data/data_source/order_remote_data_source.dart';
import 'package:sabaa/features/order/domain/create_payment/create_payment_response.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/src/infrastructure/api/response/api_response.dart';
import 'package:sabaa/src/infrastructure/network/exception/dio_exceptions.dart';
import 'package:sabaa/src/infrastructure/network/services/dio_client.dart';

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

  Future<ApiResponse<CreatePaymentResponse>> createPayment({
    required String invoiceId,
    required String paidAmount,
  }) async {
    final response = await _remoteDataSource.createPaymeny(
      invoice_id: invoiceId,
      paid_amount: paidAmount,
    );

    if (response.status == 201) {
      return response;
    }

    throw AppException(response.message);
  }
}
