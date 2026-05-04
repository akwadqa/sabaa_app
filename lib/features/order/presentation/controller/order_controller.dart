import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/order/data/repository/order_repository.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/features/order/presentation/controller/order_state.dart';
import 'package:sabaa/src/core/shared_widgets/app_toast.dart';

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

Future<bool> createPayment({
  required String invoiceId,
  required String amount,
  required String paymentMethod,
}) async {
  final current = state.value!;

  state = AsyncData(current.copyWith(isPaying: true));

  try {
    final response = await ref.read(orderRepositoryProvider).createPayment(
          invoiceId: invoiceId,
          amount: amount,
          paymentMethod: paymentMethod,
        );

    state = AsyncData(
      current.copyWith(
        isPaying: false,
        paymentData: response.data,
      ),
    );

    return true;
  } catch (e) {
    state = AsyncData(current.copyWith(isPaying: false));
    AppToast.errorToast(e.toString());
    
    return false;
  }
}
}
