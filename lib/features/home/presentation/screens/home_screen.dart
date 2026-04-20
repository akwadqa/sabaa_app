import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/home/presentation/controller/home_controller.dart';
import 'package:sabaa/features/home/presentation/controller/home_state.dart';
import 'package:sabaa/features/home/presentation/widgets/date_badge_widget.dart';
import 'package:sabaa/features/home/presentation/widgets/home_banner.dart';
import 'package:sabaa/features/home/presentation/widgets/performance_card.dart';
import 'package:sabaa/features/home/presentation/widgets/quick_action_card_button.dart';
import 'package:sabaa/features/home/presentation/widgets/section_header.dart';
import 'package:sabaa/src/core/shared_widgets/app_error_widget.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/functions/app_spacing.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(homeControllerProvider);

    return asyncState.when(
      loading: () => AppLoader(),
      error: (e, _) => AppErrorWidget(),
      data: (state) => _HomeBody(state: state),
    );
  }
}

// ── Body — only rebuilt when state changes ────────────────────────────────────

class _HomeBody extends ConsumerWidget {
  const _HomeBody({required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(homeControllerProvider.notifier).refresh(),
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,

                // ── Banner ───────────────────────────────────────────
                HeaderBanner(userName: state.userName),
                24.verticalSpace,

                // ── Today's Performance ──────────────────────────────
                SectionHeader(
                  title:    'todays_performance',
                  trailing: DateBadge(label: state.todayDate),
                ),
                16.verticalSpace,
                Row(
                  children: state.metrics
                      .map<Widget>((m) => PerformanceCard(metric: m))
                      .expand((w) => [w, const SizedBox(width: AppSpacing.lg)])
                      .toList(),
                ),
                24.verticalSpace,

                // ── Quick Actions ────────────────────────────────────
                const SectionHeader(title: 'quick_actions'),
                16.verticalSpace,
                Row(
                  children: state.quickActions
                      .map<Widget>(
                        (a) => QuickActionCardButton(
                          action: a,
                          onTap:  a.onTap
                        ),
                      )
                      .expand((w) => [w, const SizedBox(width: AppSpacing.lg)])
                      .toList(),
                ),
                24.verticalSpace,

                // ── Loading / Error overlay (non-blocking) ───────────
                if (state.pageState is AsyncLoading)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}