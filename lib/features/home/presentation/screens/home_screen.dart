import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/home/domain/model/home_trip_model.dart';
import 'package:sabaa/features/home/presentation/controller/home_controller.dart';
import 'package:sabaa/features/home/presentation/controller/home_state.dart';
import 'package:sabaa/features/home/presentation/widgets/date_badge_widget.dart';
import 'package:sabaa/features/home/presentation/widgets/home_banner.dart';
import 'package:sabaa/features/home/presentation/widgets/performance_card.dart';
import 'package:sabaa/features/home/presentation/widgets/quick_action_card_button.dart';
import 'package:sabaa/features/home/presentation/widgets/section_header.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/app_error_widget.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/shared_widgets/app_toast.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/functions/app_spacing.dart';
import 'package:sabaa/src/infrastructure/storage/local_storage_service.dart';

import '../../../../src/resourses/color_manager/app_colors.dart';
import '../../../../src/resourses/font_manager/app_text_style.dart';

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
    // ── Listen to tripActionState for side-effects (toast) ────────────────
    ref.listen(homeControllerProvider, (_, next) {
      final s = next.value;
      if (s == null) return;

      final tripState = s.tripActionState;
      if (tripState == null) return;

      tripState.whenOrNull(
        data: (_) {
          if (s.tripStarted) {
            AppToast.successToast('trip_started_successfully'.tr());
          }
        },
        error: (e, _) {
          AppToast.errorToast(e.toString());
        },
      );
    });
    return Scaffold(
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () => ref.read(homeControllerProvider.notifier).refresh(),
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Align(
                //   alignment: AlignmentGeometry.centerRight,
                //   child: GestureDetector(
                //       onTap: () {
                //         ref.read(localStorageServiceProvider).logout();
                //         context.goNamed(AppRoutes.signInScreen);
                //       },
                //       child: Icon(Icons.logout,color: Colors.red,)),
                // ),
                // 20.verticalSpace,

                // ── Banner ───────────────────────────────────────────
                HeaderBanner(userName: state.userName),
                24.verticalSpace,
                // ── Quick Actions ────────────────────────────────────
                const SectionHeader(title: 'quick_actions'),
                16.verticalSpace,
                Row(
                  children: state.quickActions
                      .map<Widget>(
                        (a) => QuickActionCardButton(
                          action: a,
                          onTap: a.onTap,
                          trip: state.trip,
                          tripStarted: state.tripStarted,
                          tripActionState: state.tripActionState,
                        ),
                      )
                      .expand((w) => [w, const SizedBox(width: AppSpacing.lg)])
                      .toList(),
                ),
                24.verticalSpace,

                // ── Today's Performance ──────────────────────────────
                SectionHeader(
                  title: 'todays_performance',
                  trailing: DateBadge(label: state.todayDate),
                ),
                16.verticalSpace,
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.metrics.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (_, i) =>
                      PerformanceCard(metric: state.metrics[i]),
                ),
                24.verticalSpace,

                // ── Loading / Error overlay (non-blocking) ───────────
                if (state.pageState is AsyncLoading)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: AppLoader(),
                    ),
                  ),
                if (state.trip != null) ...[
                  _TripProgressCard(trip: state.trip!),
                  24.verticalSpace,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TripProgressCard extends StatelessWidget {
  const _TripProgressCard({required this.trip});

  final HomeTripModel trip;

  @override
  Widget build(BuildContext context) {
    final progress = (trip.progressPercentage / 100).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 25,
            offset: Offset(2, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Trip name + status ───────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                trip.tripName,
                style: AppTextStyle.interSemiBold14.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              _StatusBadge(status: trip.status),
            ],
          ),
          12.verticalSpace,

          // ── Progress bar ─────────────────────────────────────────
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: AppColors.navBorder,
              valueColor: AlwaysStoppedAnimation<Color>(
                trip.status.toLowerCase() == 'completed'
                    ? AppColors.green
                    : AppColors.primary,
              ),
            ),
          ),
          8.verticalSpace,

          // ── Visit counts ─────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${'completed_visits'.tr()}: ${trip.completedVisits}/${trip.totalVisitsPlanned}',
                style: AppTextStyle.interRegular12.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                '${trip.progressPercentage.toStringAsFixed(0)}%',
                style: AppTextStyle.interSemiBold14.copyWith(
                  fontSize: 12,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final String status;

  Color get _bgColor {
    switch (status.toLowerCase()) {
      case 'in progress':
        return AppColors.dateBadge;
      case 'completed':
        return const Color(0xFFDCFCE7);
      default:
        return AppColors.navBorder;
    }
  }

  Color get _textColor {
    switch (status.toLowerCase()) {
      case 'in progress':
        return AppColors.primary;
      case 'completed':
        return AppColors.green;
      default:
        return AppColors.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status,
        style: AppTextStyle.interMedium12.copyWith(
          color: _textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
