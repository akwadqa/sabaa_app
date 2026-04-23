import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/customers/data/repository/customer_repository.dart';
import 'package:sabaa/features/customers/domain/model/create_customer_response/create_customer_response.dart';
import 'package:sabaa/features/customers/domain/model/customer_avatar.dart';
import 'package:sabaa/features/customers/domain/model/customer_model.dart';
import 'package:sabaa/features/customers/presentation/controller/customer_controller.dart';
import 'package:sabaa/features/customers/presentation/widgets/customer_card.dart';
import 'package:sabaa/features/van_stock/presentation/widgets/filter_search_bar.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/shared_widgets/app_pagination_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

// ── Avatar palette (add to AppColors) ────────────────────────────────────────
//
//   static const Color avatarOrangeBg   = Color(0xFFFFEDD5);
//   static const Color avatarOrangeText = Color(0xFFEA580C);
//   static const Color avatarBlueBg     = Color(0xFFDBEAFE);
//   static const Color avatarBlueText   = Color(0xFF2563EB);
//   static const Color avatarPurpleBg   = Color(0xFFF3E8FF);
//   static const Color avatarPurpleText = Color(0xFF9333EA);
//   static const Color imageBorderBlue  = Color(0x33137FEC);

class CustomersPage extends ConsumerStatefulWidget {
  const CustomersPage({super.key});

  @override
  ConsumerState<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends ConsumerState<CustomersPage> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() =>
        ref.read(customersControllerProvider.notifier).getCustomers(page: 1));
  }

  // ── Static data (replace with BLoC / provider) ────────────────────────────
  // static const List<Customer> _allCustomers = [
  //   Customer(
  //     id: 'c1',
  //     name: 'Fresh Mart Ltd.',
  //     address: '45 West Ave, Block B',
  //     status: VisitStatus.open,
  //     orderAmount: r'$420.00',
  //     avatar: InitialsAvatar(
  //       initials: 'FM',
  //       backgroundColor: AppColors.statusPendingBg,
  //       textColor: AppColors.avatarOrangeText,
  //     ),
  //   ),
  //   Customer(
  //     id: 'c2',
  //     name: 'Al Dibaj Supermarket',
  //     address: 'Dubai, Business Bay',
  //     status: VisitStatus.pending,
  //     avatar: ImageAvatar(
  //       imageUrl: 'https://placehold.co/64x64',
  //       borderColor: Color(0x33137FEC),
  //     ),
  //   ),
  //   Customer(
  //     id: 'c3',
  //     name: '7-Eleven Corner',
  //     address: '45 West Ave, Block B',
  //     status: VisitStatus.visited,
  //     avatar: InitialsAvatar(
  //       initials: '7E',
  //       backgroundColor: AppColors.avatarBlueBg,
  //       textColor: AppColors.avatarBlueText,
  //     ),
  //   ),
  //   Customer(
  //     id: 'c4',
  //     name: 'City Grocery',
  //     address: '45 West Ave, Block B',
  //     status: VisitStatus.pending,
  //     orderAmount: null,
  //     avatar: ImageAvatar(
  //       imageUrl: 'https://placehold.co/64x64',
  //     ),
  //   ),
  //   Customer(
  //     id: 'c5',
  //     name: 'Fresh Mart Ltd.',
  //     address: '45 West Ave, Block B',
  //     status: VisitStatus.open,
  //     orderAmount: r'$420.00',
  //     avatar: InitialsAvatar(
  //       initials: 'FM',
  //       backgroundColor: AppColors.statusPendingBg,
  //       textColor: AppColors.statusPendingText,
  //     ),
  //   ),
  //   Customer(
  //     id: 'c6',
  //     name: 'Quick Mart',
  //     address: '22 Station Road',
  //     status: VisitStatus.pending,
  //     avatar: InitialsAvatar(
  //       initials: 'QK',
  //       backgroundColor: AppColors.avatarPurpleBg,
  //       textColor: AppColors.statusOpenText,
  //     ),
  //   ),
  // ];

  // List<Customer> get _filtered {
  //   if (_query.isEmpty) return _allCustomers;
  //   final q = _query.toLowerCase();
  //   return _allCustomers
  //       .where(
  //         (c) =>
  //             c.name.toLowerCase().contains(q) ||
  //             c.address.toLowerCase().contains(q),
  //       )
  //       .toList();
  // }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(customersControllerProvider
            .select((value) => value.value?.customersList)) ??
        AsyncLoading();
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            16.verticalSpace,
            FilterSearchBar(
              hint: 'search_by_customer_name',
              controller: _searchController,
              onChanged: (val) {
                ref.read(customersControllerProvider.notifier).search = val;
                ref
                    .read(customersControllerProvider.notifier)
                    .getCustomers(page: 1, showLoading: true);
              },
            ),
            Expanded(
              child: controller.when(
                data: (customers) => _buildBody(context, customers),
                loading: () => const AppLoader(),
                error: (e, __) => Center(child: Text('Error: $e')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, List<CustomerModel> _filtered) {
    return AppPaginationWidget(
      onLoading: (page) =>
          ref.read(customersControllerProvider.notifier).loadNextPage(),
      onRefresh: () => ref.read(customersControllerProvider.notifier).refresh(),
      enablePullDown: true,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          16.verticalSpace,
          ..._filtered.map(
            (c) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CustomerCard(
                customer: c,
                onTap: () {
                  context.push(AppRoutes.orderSummaryScreen,
                      extra: c.customerId);
                },
              ),
            ),
          ),
          8.verticalSpace,
        ],
      ),
    );
  }

  // ── App bar ─────────────────────────────────────────────────────────────────

  Widget _buildAppBar() {
    return Center(
      child: Text(
        'customers'.tr(),
        style: AppTextStyle.interBold20.copyWith(color: AppColors.dark),
      ),
    ).symmetricPadding(vertical: 20);
  }
}
