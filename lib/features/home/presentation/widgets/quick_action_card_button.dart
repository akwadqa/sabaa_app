import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/features/home/domain/model/home_trip_model.dart';
import 'package:sabaa/features/main/presentation/screens/main_screen.dart';
import 'package:sabaa/features/my_trips/presentation/controller/my_trips_controller.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sabaa/features/home/domain/model/quick_action_model.dart';
import 'package:sabaa/features/home/presentation/controller/home_controller.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';

class QuickAction {
  const QuickAction({
    required this.label,
    required this.color,
    required this.icon,
    required this.onTap,
    this.isBeginTrip = false,
  });

  final String label;
  final Color color;
  final IconData icon;
  final VoidCallback onTap;
  final bool isBeginTrip;
}
// ── Quick action button with Begin Trip special behaviour ─────────────────────

class QuickActionCardButton extends ConsumerWidget {
  const QuickActionCardButton({
    super.key,
    required this.action,
    required this.trip,
    required this.tripStarted,
    required this.tripActionState,
    required this.onTap,
  });

  final QuickAction action;
  final HomeTripModel? trip;
  final bool tripStarted;
  final AsyncValue<void>? tripActionState;
  final VoidCallback onTap;

  bool get _isBeginTrip => action.isBeginTrip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ── Begin Trip button adapts based on trip state ──────────────────────
    if (_isBeginTrip) {
      final isLoading = tripActionState is AsyncLoading;
      final label = tripStarted ? 'trip_in_progress' : 'begin_trip';
      final color = tripStarted ? AppColors.green : action.color;

      return Expanded(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: isLoading
              ? null
              : () async {
                  if (tripStarted) {
                    // Already started — navigate to Route tab
                    // context.push(action.routePath);
                    Dev.logLine("bottomNavIndexProvider");

                    ref.read(bottomNavIndexProvider.notifier).state = 1;
                  } else {
                    Dev.logLine("startTrip");

                    await ref.read(homeControllerProvider.notifier).startTrip();
                    if (_isBeginTrip) {
                      await Future.delayed(Duration(seconds: 3));
                      ref.read(bottomNavIndexProvider.notifier).state = 1;
                      ref.read(myTripsControllerProvider.notifier).refresh();
                    }
                  }
                },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLoading
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Icon(
                        tripStarted
                            ? Icons.directions_bus_outlined
                            : action.icon,
                        color: Colors.white,
                        size: 26,
                      ),
                8.verticalSpace,
                Text(
                  label.tr(),
                  style: AppTextStyle.interSemiBold16.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // ── All other actions — standard button ───────────────────────────────
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: action.color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(action.icon, color: Colors.white, size: 26),
              8.verticalSpace,
              Text(
                action.label.tr(),
                style: AppTextStyle.interSemiBold16.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Trip progress card ────────────────────────────────────────────────────────

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

// ── Status badge ──────────────────────────────────────────────────────────────

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
