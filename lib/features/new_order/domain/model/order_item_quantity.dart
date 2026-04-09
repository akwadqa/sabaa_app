/// Holds the live quantity for a single OrderItem.
/// Kept separate from the domain model so OrderItem stays immutable/const.
class OrderItemQuantity {
  OrderItemQuantity({this.quantity = 0});

  int quantity;

  OrderItemQuantity copyWith({int? quantity}) =>
      OrderItemQuantity(quantity: quantity ?? this.quantity);
}