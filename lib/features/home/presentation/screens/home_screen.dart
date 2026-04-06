import 'package:flutter/material.dart';
import 'package:sabaa/features/home/presentation/widgets/date_badge_widget.dart';
import 'package:sabaa/features/home/presentation/widgets/home_banner.dart';
import 'package:sabaa/features/home/presentation/widgets/performance_card.dart';
import 'package:sabaa/features/home/presentation/widgets/quick_action_card_button.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/functions/app_spacing.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<PerformanceMetric> _metrics = [
    PerformanceMetric(
      label: 'sales_volume',
      value: r'$1,250',
      iconColor: AppColors.metricPurple,
      icon: Icons.inventory_2_outlined,
    ),
    PerformanceMetric(
      label: "todays_visits",
      value: '10',
      iconColor: AppColors.metricPink,
      icon: Icons.trending_up_rounded,
    ),
  ];

  List<QuickAction> _buildActions(BuildContext context) => [
        QuickAction(
          label: 'begin_trip',
          color: AppColors.primary,
          icon: Icons.local_shipping_outlined,
          onTap: () {},
        ),
        QuickAction(
          label: 'new_order',
          color: AppColors.accent,
          icon: Icons.shopping_cart_outlined,
          onTap: () {},
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final actions = _buildActions(context);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              const HeaderBanner(userName: 'Alex'),
              24.verticalSpace,
              SectionHeader(
                title: "todays_performance",
                trailing: const DateBadge(label: 'APR 24, 2026'),
              ),
              16.verticalSpace,
              Row(
                children: _metrics
                    .map<Widget>((m) => PerformanceCard(metric: m))
                    .expand((w) => [w, const SizedBox(width: AppSpacing.lg)])
                    .toList()
                  ..removeLast(),
              ),
              24.verticalSpace,
              const SectionHeader(title: 'quick_actions'),
              16.verticalSpace,
              Row(
                children: actions
                    .map<Widget>((a) => QuickActionCardButton(action: a))
                    .expand((w) => [w, const SizedBox(width: AppSpacing.lg)])
                    .toList()
                  ..removeLast(),
              ),
              24.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
