import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/customers/domain/model/customer_model.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

import '../../domain/model/customer_action.dart';
import '../widgets/customer_details/customer_details_action.dart';
import '../widgets/customer_details/customer_details_card.dart';
import '../widgets/customer_details/customer_details_profile_header.dart';

class CustomerDetailsPage extends StatelessWidget {
  const CustomerDetailsPage({super.key, required this.customer});

  final Customer customer;

  // ── Stat cards ─────────────────────────────────────────────────────────────

  static const CustomerStat _balance = CustomerStat(
    labelKey:    'outstanding_balance',
    value:       r'$1,240.50',
    subtitleKey: 'due_in_days',
    subtitleArgs: {'days': '5'},
  );

  static const CustomerStat _totalSales = CustomerStat(
    labelKey:         'total_sales',
    value:            '24',
    growth:           '↑ 12% from last month',
    isGrowthPositive: true,
  );

  // ── Actions ────────────────────────────────────────────────────────────────

  List<CustomerAction> _buildActions(BuildContext context) => [
        CustomerAction(
          labelKey:  'new_order',
          icon:      Icons.shopping_cart_outlined,
          isPrimary: true,
          onTap: () {
            context.push(AppRoutes.newOrderScreen,extra: customer);
          },
        ),
        CustomerAction(
          labelKey: 'new_payment',
          icon:     Icons.payment_outlined,
          onTap: () {
          },
        ),
        CustomerAction(
          labelKey: 'sales_return',
          icon:     Icons.undo_rounded,
          onTap: () {
          },
        ),
      ];

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final actions = _buildActions(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          16.verticalSpace,

          // ── Profile card ─────────────────────────────────────────
          CustomerDetailsProfileHeader(customer: customer),
          16.verticalSpace,

          // ── Outstanding balance ──────────────────────────────────
          CustomerDetailsCard(
            stat:        _balance,
            iconData:    Icons.account_balance_wallet_outlined,
            iconBgColor: AppColors.stockLowBg,
            iconColor: AppColors.red,
          ),
          16.verticalSpace,

          // ── Total sales ──────────────────────────────────────────
          CustomerDetailsCard(
            stat:        _totalSales,
            iconData:    Icons.shopping_cart_outlined,
            iconBgColor: AppColors.primaryBg,
            iconColor: AppColors.avatarBlueText,
          ),
          24.verticalSpace,

          // ── Action buttons ───────────────────────────────────────
          ...actions.map(
            (a) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CustomerDetailsAction(action: a),
            ),
          ),
          16.verticalSpace,
        ],
      ),
    );
  }

  // ── AppBar ─────────────────────────────────────────────────────────────────

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor:AppColors.background,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
      ),
      title: Text(
        'customer_details'.tr(),
        style: AppTextStyle.interBold20.copyWith(color: AppColors.dark),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert, color: AppColors.textPrimary),
          onPressed: () {
          },
        ),
      ],
     
    );
  }
}