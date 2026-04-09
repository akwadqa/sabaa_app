import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/new_order/domain/model/order_item.dart';
import 'package:sabaa/features/new_order/domain/model/order_item_quantity.dart';
import 'package:sabaa/features/new_order/presentation/controller/order_mode_controller.dart';
import 'package:sabaa/features/new_order/presentation/widgets/order_category_filter.dart';
import 'package:sabaa/features/new_order/presentation/widgets/order_item_card.dart';
import 'package:sabaa/features/new_order/presentation/widgets/order_search_bar.dart';
import 'package:sabaa/features/new_order/presentation/widgets/order_tab_switcher.dart';
import 'package:sabaa/features/new_order/presentation/widgets/return_summary_panel.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class NewOrderPage extends ConsumerStatefulWidget {
  const NewOrderPage({super.key, required this.customerName});

  final String customerName;

  @override
  ConsumerState<NewOrderPage> createState() => _NewOrderPageState();
}

class _NewOrderPageState extends ConsumerState<NewOrderPage> {
  // ── Local UI state (not mode — that lives in Riverpod) ────────────────────
  int _categoryIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  // ── Static data (replace with BLoC / provider) ────────────────────────────

  static const List<String> _categoryKeys = [
    'category_all',
    'category_beverages',
    'category_snacks',
    'category_dairy',
  ];

  static const List<OrderItem> _saleItems = [
    OrderItem(id: 'i1', name: 'Crunchy Biscuit Classic',    sku: 'BS-1033',  price: '48 QAR / Box',    isReturn: false),
    OrderItem(id: 'i2', name: 'Mango Juice 200ml – Carton', sku: 'JC-3320',  price: '52 QAR / Carton', isReturn: false),
    OrderItem(id: 'i3', name: 'Fresh Whole Milk 1L',        sku: 'MK-2100',  price: '65 QAR / Carton', isReturn: false),
    OrderItem(id: 'i4', name: 'Crunchy Biscuit Classic',    sku: 'BS-1033',  price: '48 QAR / Box',    isReturn: false),
    OrderItem(id: 'i5', name: 'Golden Crunch Biscuit',      sku: 'JC-3320',  price: '52 QAR / Carton', isReturn: false),
  ];

  static const List<OrderItem> _returnItems = [
    OrderItem(id: 'r1', name: 'Chocolate Wafer',    sku: 'CW-7788', price: '-40 QAR / Box', isReturn: true),
    OrderItem(id: 'r2', name: 'Almon Almond Lemon', sku: 'AL-8821', price: '-35 QAR / Bag', isReturn: true),
  ];

  // ── Quantity maps ──────────────────────────────────────────────────────────

  final Map<String, OrderItemQuantity> _saleQty = {
    for (final i in _saleItems) i.id: OrderItemQuantity(),
  };

  final Map<String, OrderItemQuantity> _returnQty = {
    for (final i in _returnItems) i.id: OrderItemQuantity(),
  };

  // ── Helpers ────────────────────────────────────────────────────────────────

  bool get _isReturn =>
      ref.watch(orderModeControllerProvider) == OrderMode.returnItems;

  List<OrderItem> get _activeItems => _isReturn ? _returnItems : _saleItems;

  Map<String, OrderItemQuantity> get _activeQty =>
      _isReturn ? _returnQty : _saleQty;

  int _itemCount(String id) => _activeQty[id]?.quantity ?? 0;

  void _increment(String id) =>
      setState(() => _activeQty[id]!.quantity++);

  void _decrement(String id) {
    if ((_activeQty[id]?.quantity ?? 0) > 0) {
      setState(() => _activeQty[id]!.quantity--);
    }
  }

  void _delete(String id) =>
      setState(() => _activeQty[id]!.quantity = 0);

  String get _netRefund {
    double total = 0;
    for (final item in _returnItems) {
      final qty = _returnQty[item.id]?.quantity ?? 0;
      final raw = item.price.replaceAll('-', '').trim().split(' ').first;
      total += (double.tryParse(raw) ?? 0) * qty;
    }
    return '${total.toStringAsFixed(0)} QAR';
  }

  int get _totalItemCount => _activeItems.fold(
        0,
        (sum, i) => sum + (_activeQty[i.id]?.quantity ?? 0),
      );

  @override
  void dispose() {
    _searchController.dispose();
    // Reset mode when leaving the page
    ref.read(orderModeControllerProvider.notifier).setMode(OrderMode.newSale);
    super.dispose();
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    // Watch mode so AppBar + body react to tab changes
    final isReturn = ref.watch(orderModeControllerProvider) == OrderMode.returnItems;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(isReturn),
      body: Column(
        children: [
          // ── Scrollable content ────────────────────────────────────
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                16.verticalSpace,
                const OrderTabSwitcher(),   // ← reads provider internally
                16.verticalSpace,
                OrderSearchBar(
                  controller: _searchController,
                  hintKey: isReturn ? 'search_items' : 'search_items_barcode',
                  onChanged: (_) => setState(() {}),
                ),
                16.verticalSpace,

                // Category filter — New Sale tab only
                if (!isReturn) ...[
                  OrderCategoryFilter(
                    categories:    _categoryKeys,
                    selectedIndex: _categoryIndex,
                    onSelected:    (i) => setState(() => _categoryIndex = i),
                  ),
                  16.verticalSpace,
                ],

                // Section header
                _SectionHeader(
                  titleKey: isReturn ? 'returns_list' : 'invoice_items',
                  count:    _totalItemCount,
                  isReturn: isReturn,
                ),
                14.verticalSpace,

                // Item list
                ..._activeItems.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: OrderItemCard(
                      item:        item,
                      quantity:    _itemCount(item.id),
                      onDecrement: () => _decrement(item.id),
                      onIncrement: () => _increment(item.id),
                      onDelete:    () => _delete(item.id),
                    ),
                  ),
                ),
                16.verticalSpace,
              ],
            ),
          ),

          // ── Bottom summary panel — Return tab only ────────────────
          if (isReturn)
            ReturnSummaryPanel(
              items:      _returnItems,
              quantities: _returnQty,
              netRefund:  _netRefund,
              onFinalize: () {
                // TODO: submit return invoice
              },
            ),
        ],
      ),
    );
  }

  // ── AppBar ─────────────────────────────────────────────────────────────────

  PreferredSizeWidget _buildAppBar(bool isReturn) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
      ),
      title: Column(
        children: [
          Text(
            isReturn ? 'return_items_title'.tr() : 'create_order'.tr(),
            style: AppTextStyle.interBold20.copyWith(color: AppColors.dark),
          ),
          Text(
            widget.customerName,
            style: AppTextStyle.interRegular12.copyWith(
              color: const Color(0xFF617589),
            ),
          ),
        ],
      ),
      actions: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          margin: const EdgeInsets.only(right: 16),
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: isReturn ? AppColors.primary : const Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.swap_horiz_rounded,
            color: isReturn ? AppColors.white : AppColors.textSecondary,
            size: 20,
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, color: AppColors.navBorder),
      ),
    );
  }
}

// ── Section header ────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.titleKey,
    required this.count,
    required this.isReturn,
  });

  final String titleKey;
  final int    count;
  final bool   isReturn;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          titleKey.tr(),
          style: AppTextStyle.interBold18.copyWith(
            color: AppColors.textHeading,
            letterSpacing: -0.27,
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          child: Container(
            key: ValueKey(isReturn),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isReturn
                  ? const Color(0xFFFEECDF)
                  : AppColors.dateBadge,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$count ${'items_label'.tr()}',
              style: AppTextStyle.interSemiBold14.copyWith(
                fontSize: 12,
                color: isReturn ? AppColors.accent : AppColors.primary,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.6,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
