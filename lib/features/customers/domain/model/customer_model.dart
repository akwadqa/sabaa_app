import 'customer_avatar.dart';

enum VisitStatus { open, pending, visited }

/// Represents a single customer in the route list.
class Customer {
  const Customer({
    required this.id,
    required this.name,
    required this.address,
    required this.status,
    required this.avatar,
    this.phone,
    this.orderAmount,         // null when visited with no sale ($0.00)
  });

  final String      id;
  final String      name;
  final String      address;
  final String?     phone;
  final VisitStatus status;
  final CustomerAvatar avatar;
  final String?     orderAmount;  // e.g. "$420.00" | null
}