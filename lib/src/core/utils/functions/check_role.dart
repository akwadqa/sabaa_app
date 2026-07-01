import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/src/infrastructure/storage/local_storage_service.dart';

dynamic checkRole(
  // String role, {
  Object ref, {
  dynamic salesMan,
  dynamic vanSales,
  dynamic delivery,
  dynamic hyperMarket,
  required dynamic defaultWidget,
}) {
  final String role;

  if (ref is Ref) {
    role = ref.read(localStorageServiceProvider).userInfo.role;
  } else if (ref is WidgetRef) {
    role = ref.read(localStorageServiceProvider).userInfo.role;
  } else {
    throw ArgumentError('ref must be Ref or WidgetRef');
  }  switch (role) {
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
