import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/order/presentation/controller/order_controller.dart';
import 'package:sabaa/features/order/presentation/widgets/order_widgets/order_summary_filter_chip.dart';

class OrderSummaryFiltersList extends ConsumerWidget {
  const OrderSummaryFiltersList({
    super.key,
    required this.selectedFilter,
    required this.customerId,
  });

  final String selectedFilter;
  final String customerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          OrderSummaryFilterChip(
            label: 'all',
            isSelected: selectedFilter == 'all',
            onTap: () => ref
                .read(orderControllerProvider.notifier)
                .changeSelectedType(type: 'all', customerId: customerId),
          ),
          OrderSummaryFilterChip(
            label: 'paid',
            isSelected: selectedFilter == 'paid',
            onTap: () => ref
                .read(orderControllerProvider.notifier)
                .changeSelectedType(type: 'paid', customerId: customerId),
          ),
          OrderSummaryFilterChip(
            label: 'unpaid',
            isSelected: selectedFilter == 'unpaid',
            onTap: () => ref
                .read(orderControllerProvider.notifier)
                .changeSelectedType(type: 'unpaid', customerId: customerId),
          ),
          OrderSummaryFilterChip(
            label: 'return',
            isSelected: selectedFilter == 'return',
            onTap: () => ref
                .read(orderControllerProvider.notifier)
                .changeSelectedType(type: 'return', customerId: customerId),
          ),
          OrderSummaryFilterChip(
            label: 'partly_paid',
            isSelected: selectedFilter == 'partly_paid',
            onTap: () => ref
                .read(orderControllerProvider.notifier)
                .changeSelectedType(
                    type: 'partly_paid', customerId: customerId),
          ),
        ],
      ),
    );
  }
}
