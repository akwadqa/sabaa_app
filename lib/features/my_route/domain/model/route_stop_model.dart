enum RouteStopStatus { inProgress, pending, visited }

class RouteStop {
  const RouteStop({
    required this.id,
    required this.order,
    required this.customerName,
    required this.address,
    required this.status,
    this.elapsedTime,      // e.g. "00:12:45" — only for inProgress
    this.checkedOutAt,     // e.g. "09:45 AM"  — only for visited
  });

  final String          id;
  final int             order;
  final String          customerName;
  final String          address;
  final RouteStopStatus status;
  final String?         elapsedTime;
  final String?         checkedOutAt;
}