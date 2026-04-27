
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/order/presentation/controller/order_controller.dart';
import 'package:sabaa/features/order/presentation/widgets/order_summary_filter_chip.dart';

class OrderSummaryFiltersList extends ConsumerWidget {
  const OrderSummaryFiltersList({
    super.key,
    required this.selectedFilter,
  });

  final String selectedFilter;

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          OrderSummaryFilterChip(
            label: 'all',
            isSelected: selectedFilter == 'all',
            onTap: () => ref
                .read(orderControllerProvider.notifier)
                .changeSelectedType('all'),
          ),
          OrderSummaryFilterChip(
            label: 'paid',
            isSelected: selectedFilter == 'paid',
            onTap: () => ref
                .read(orderControllerProvider.notifier)
                .changeSelectedType('paid'),
          ),
          OrderSummaryFilterChip(
            label: 'unpaid',
            isSelected: selectedFilter == 'unpaid',
            onTap: () => ref
                .read(orderControllerProvider.notifier)
                .changeSelectedType('unpaid'),
          ),
          OrderSummaryFilterChip(
            label: 'return',
            isSelected: selectedFilter == 'return',
            onTap: () => ref
                .read(orderControllerProvider.notifier)
                .changeSelectedType('return'),
          ),
          OrderSummaryFilterChip(
            label: 'partly_paid',
            isSelected: selectedFilter == 'partly_paid',
            onTap: () => ref
                .read(orderControllerProvider.notifier)
                .changeSelectedType('partly_paid'),
          ),
        ],
      ),
    );
  }
}
