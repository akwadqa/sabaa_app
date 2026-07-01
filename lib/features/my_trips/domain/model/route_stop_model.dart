// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

enum RouteStopStatus {
  @JsonValue('In Progress')
  inProgress,
  @JsonValue('Pending')
  pending,

  @JsonValue('Completed')
  completed,
  @JsonValue('Skipped')
  skipped,
  @JsonValue('Failed')
  failed,
}

class RouteStop {
  const RouteStop({
    required this.id,
    required this.order,
    required this.customerName,
    required this.address,
    required this.status,
    this.elapsedTime, // e.g. "00:12:45" — only for inProgress
    this.checkedOutAt,
    required this.customerPhone,
    required this.customerId, // e.g. "09:45 AM"  — only for visited
  });

  final String id;
  final int order;
  final String customerName;
  final String customerId;
  final String address;
  final String customerPhone;
  final RouteStopStatus status;
  final String? elapsedTime;
  final String? checkedOutAt;

  RouteStop copyWith({
    String? id,
    int? order,
    String? customerName,
    String? customerId,
    String? address,
    String? customerPhone,
    RouteStopStatus? status,
    String? elapsedTime,
    String? checkedOutAt,
  }) {
    return RouteStop(
      id: id ?? this.id,
      order: order ?? this.order,
      customerName: customerName ?? this.customerName,
      customerId: customerId ?? this.customerId,
      address: address ?? this.address,
      customerPhone: customerPhone ?? this.customerPhone,
      status: status ?? this.status,
      elapsedTime: elapsedTime ?? this.elapsedTime,
      checkedOutAt: checkedOutAt ?? this.checkedOutAt,
    );
  }
}
