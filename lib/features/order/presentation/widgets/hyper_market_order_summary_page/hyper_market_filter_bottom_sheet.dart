import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/order/presentation/controller/hyper_market_order_controller.dart';

class HyperMarketFilterBottomSheet extends ConsumerStatefulWidget {
  const HyperMarketFilterBottomSheet({super.key, required this.customerId});
  final String customerId;

  @override
  ConsumerState<HyperMarketFilterBottomSheet> createState() =>
      _HyperMarketFilterBottomSheetState();
}

class _HyperMarketFilterBottomSheetState
    extends ConsumerState<HyperMarketFilterBottomSheet> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _fromDate =
        ref.watch(hyperMarketOrderControllerProvider).value!.filterFromDate;
    final _toDate =
        ref.watch(hyperMarketOrderControllerProvider).value!.filterToDate;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffF7F9FC),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. Header Row (Close, Title, Clear All)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.close, size: 20, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              const Text(
                'Filters',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {
                  _searchController.clear();
                  ref
                      .read(hyperMarketOrderControllerProvider.notifier)
                      .clearFilters();
                },
                child: const Text(
                  'Clear all',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff005AAB),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),

          // 2. Search & Scan Bar Code Row
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xffE2E8F0)),
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) => ref
                        .read(hyperMarketOrderControllerProvider.notifier)
                        .changeProductName(value),
                    decoration: const InputDecoration(
                      hintText: 'Search product name or SKU.',
                      hintStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: Color(0xff64748B),
                      ),
                      prefixIcon: Icon(Icons.search,
                          color: Color(0xff64748B), size: 18),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xffE2E8F0)),
                ),
                child: IconButton(
                  icon: const Icon(Icons.qr_code_scanner,
                      color: Color(0xff005AAB), size: 24),
                  onPressed: () {
                    // ويدجت الكاميرا أو مسح الباركود الخاص بك
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),

          // 3. "From" Date Picker Selector
          Align(
            alignment: Alignment.centerLeft,
            child: const Text(
              'From',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff111418),
              ),
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: _fromDate ?? DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: _toDate ?? DateTime(2030),
              );
              if (picked != null) {
                ref
                    .read(hyperMarketOrderControllerProvider.notifier)
                    .changeFilterFromDate(picked);
              }
            },
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xffDBE0E6)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _fromDate == null
                        ? "Select Date"
                        : DateFormat('yyyy-MM-dd').format(_fromDate),
                    style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        color: Color(0xff64748B)),
                  ),
                  const Icon(Icons.calendar_today_outlined,
                      size: 18, color: Color(0xff9CA3AF)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),

          // 4. "To" Date Picker Selector
          Align(
            alignment: Alignment.centerLeft,
            child: const Text(
              'To',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff111418),
              ),
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: _toDate ?? _fromDate ?? DateTime.now(),
                firstDate: _fromDate ?? DateTime(2020),
                lastDate: DateTime(2030),
              );
              if (picked != null) {
                ref
                    .read(hyperMarketOrderControllerProvider.notifier)
                    .changeFilterToDate(picked);
              }
            },
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xffDBE0E6)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _toDate == null
                        ? "Select Date"
                        : DateFormat('yyyy-MM-dd').format(_toDate),
                    style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        color: Color(0xff64748B)),
                  ),
                  const Icon(Icons.calendar_today_outlined,
                      size: 18, color: Color(0xff9CA3AF)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),

          // 5. Apply Filters Action Button
          Container(
            width: 300,
            height: 48,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff3B82F6).withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 10),
                ),
                BoxShadow(
                  color: const Color(0xff3B82F6).withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                context.pop();
                ref
                    .read(hyperMarketOrderControllerProvider.notifier)
                    .getHyperMarketOderSummary(widget.customerId); 
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff005AAB),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: const Text(
                'Apply Filters',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
