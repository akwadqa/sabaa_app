import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/order/data/repository/order_repository.dart';
import 'package:sabaa/features/order/domain/create_payment/create_payment_response.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/features/order/presentation/controller/order_state.dart';

part 'order_controller.g.dart';

@riverpod
class OrderController extends _$OrderController {
  @override
  FutureOr<OrderState> build() {
    return OrderState.init();
  }

  void changeSelectedType(String? type) {
    state = AsyncData(state.value!.copyWith(ordersTypeFilter: type));
  }

  void changeSelectedPaymentMethod(String? method) {
    state = AsyncData(state.value!.copyWith(paymentMethod: method));
  }

  Future<OrderSummaryModel?> getOrderSummary(String customerId) async {
    try {
      state =
          AsyncData(state.value!.copyWith(orderSummary: const AsyncLoading()));
      final orderSummary = await ref
          .read(orderRepositoryProvider)
          .getOrderSummary(
              customerId: customerId, status: state.value!.ordersTypeFilter);
      state = AsyncData(
          state.value!.copyWith(orderSummary: AsyncData(orderSummary.data!)));

      return orderSummary.data;
    } catch (e, st) {
      state = AsyncData(state.value!.copyWith(orderSummary: AsyncError(e, st)));
      return null;
    }
  }

  Future<CreatePaymentResponse?> createPayment(
      {required String invoiceId, required String paidAmount}) async {
    try {
      state = AsyncData(
          state.value!.copyWith(createPaymentResponse: const AsyncLoading()));
      final response = await ref.read(orderRepositoryProvider).createPayment(
            invoiceId: invoiceId,
            paidAmount: paidAmount,
          );
      state = AsyncData(state.value!
          .copyWith(createPaymentResponse: AsyncData(response.data!)));

      return response.data;
    } catch (e, st) {
      state = AsyncData(
          state.value!.copyWith(createPaymentResponse: AsyncError(e, st)));
      return null;
    }
  }
}
