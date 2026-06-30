import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/src/infrastructure/storage/local_storage_service.dart';

dynamic checkRole(
  // String role, {
  WidgetRef ref, {
  dynamic salesMan,
  dynamic vanSales,
  dynamic delivery,
  dynamic hyperMarket,
  required dynamic defaultWidget,
}) {
  final role = ref.watch(localStorageServiceProvider).userInfo.role;
  switch (role) {
    case 'Pre-Order':
      return salesMan ?? defaultWidget;
    case 'Van Sales':
      return vanSales ?? defaultWidget;
    case 'Delivery':
      return delivery ?? defaultWidget;

    case 'Hyper-Market':
      return hyperMarket ?? defaultWidget;
    default:
      return defaultWidget;
  }
}
