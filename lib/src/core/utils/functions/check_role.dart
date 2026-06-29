import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/src/infrastructure/storage/local_storage_service.dart';

dynamic checkRole(
  // String role, {
  WidgetRef ref, {
  required dynamic salesMan,
  required dynamic vanSales,
}) {
  final role = ref.watch(localStorageServiceProvider).userInfo.role;
  switch (role) {
    case 'Pre-Order':
      return salesMan;
    case 'Van Sales':
      return vanSales;
    default:
      return const SizedBox.shrink();
  }
}
