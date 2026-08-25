// features/reports/presentation/pages/reports_page.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/customers/domain/model/create_customer_response/create_customer_response.dart';
import 'package:sabaa/features/customers/domain/model/customer_model.dart';
import 'package:sabaa/features/customers/presentation/controller/customer_controller.dart';
import 'package:sabaa/features/customers/presentation/widgets/customer_card.dart';
import 'package:sabaa/features/reports/presentation/widgets/select_period_dialog.dart';
import 'package:sabaa/features/van_stock/presentation/widgets/filter_search_bar.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/app_error_widget.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/shared_widgets/app_pagination_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class ReportsPage extends ConsumerStatefulWidget {
  const ReportsPage({super.key});

  @override
  ConsumerState<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends ConsumerState<ReportsPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future(() =>
        ref.read(customersControllerProvider.notifier).getCustomers(page: 1));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _onCustomerTap(CustomerModel customer) async {
    final period = await showDialog<({DateTime from, DateTime to})>(
      context: context,
      barrierDismissible: true,
      builder: (_) => const SelectPeriodDialog(),
    );

    if (period == null || !mounted) return;

    context.pushNamed(
      'customerReport',
      extra: {
        'customer': customer,
        'fromDate': period.from,
        'toDate': period.to,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(
          customersControllerProvider.select((v) => v.value?.customersList),
        ) ??
        const AsyncLoading();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ───────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'reports'.tr(),
                      style: AppTextStyle.interBold20
                          .copyWith(color: AppColors.dark),
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    'select_customer'.tr(),
                    style: AppTextStyle.interBold14
                        .copyWith(color: AppColors.textPrimary),
                  ),
                  4.verticalSpace,
                  Text(
                    'choose_customer_to_generate_report'.tr(),
                    style: AppTextStyle.interRegular13
                        .copyWith(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            FilterSearchBar(
              hint: 'search_customers',
              controller: _searchController,
              isCustomer: true,
              onChanged: (val) {
                ref.read(customersControllerProvider.notifier).search = val;
                ref
                    .read(customersControllerProvider.notifier)
                    .getCustomers(page: 1, showLoading: true);
              },
            ),
            Expanded(
              child: controller.when(
                loading: () => const AppLoader(),
                error: (e, _) => AppErrorWidget(
                  errorMsg: e.toString(),
                  onTap: () => ref
                      .read(customersControllerProvider.notifier)
                      .getCustomers(page: 1),
                ),
                data: (customers) => AppPaginationWidget(
                  onLoading: (_) => ref
                      .read(customersControllerProvider.notifier)
                      .loadNextPage(),
                  onRefresh: () =>
                      ref.read(customersControllerProvider.notifier).refresh(),
                  enablePullDown: true,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      16.verticalSpace,
                      ...customers.map(
                        (c) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: CustomerCard(
                            customer: c,
                            onTap: () => _onCustomerTap(c),
                          ),
                        ),
                      ),
                      8.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}