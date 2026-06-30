import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/new_order/domain/model/order_item.dart';

part 'order_mode_controller.g.dart';

@riverpod
class OrderModeController extends _$OrderModeController {
  @override
  OrderMode build() => OrderMode.newOrder;

  void setMode(OrderMode mode) => state = mode;
}