
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/home/data/repositories/home_repository.dart';
import 'package:sabaa/features/home/presentation/controller/home_state.dart';
import 'package:sabaa/features/home/presentation/widgets/performance_card.dart';
import 'package:sabaa/src/infrastructure/storage/local_storage_service.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';

import '../../../main/presentation/screens/main_screen.dart';
import '../widgets/quick_action_card_button.dart';

part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeController extends _$HomeController {

  // ──────────────────────────────────────────────────────────────────────────
  // Build
  // ──────────────────────────────────────────────────────────────────────────

  @override
  FutureOr<HomeState> build() async {
    return await loadDashboard();
  }

  // ──────────────────────────────────────────────────────────────────────────
  // Load dashboard
  // ──────────────────────────────────────────────────────────────────────────

  Future<HomeState> loadDashboard() async {
    try {
      final repo = ref.read(homeRepositoryProvider);
      final userInf = ref.read(localStorageServiceProvider).userInfo;
      final response = await repo.getDashboard();

      final data = response.data!;

      // Derive tripStarted from the API status field
      final tripStarted = data.trip?.status.toLowerCase() == 'in progress';
      final trip = data.trip;

      final completed = trip?.completedVisits??0;
      final total = trip?.totalVisitsPlanned??0;

// 🔥 always safe calculation (in case backend changes)
      final percent = total == 0 ? 0 : ((completed / total) * 100).round();
      final stateData = HomeState(
        userName: userInf.fullName,
        todayDate: data.date.formattedDate,
        trip: data.trip,
        tripStarted: tripStarted,
        pageState: const AsyncData(null),
        metrics: [
          PerformanceMetric(
            label: 'total_sales',
            value: data.dailyPerformance.totalSales.toString(),
            iconColor: AppColors.metricGreenIcon,
            icon: Icons.trending_up_rounded,
          ),
          PerformanceMetric(
            label: 'skip_visit',
            value: '3',
            icon: Icons.block_flipped,
            iconColor: AppColors.metricOrangeIcon,
            subtitle: "today_skips",
          ),
          PerformanceMetric(
            label: 'todays_visits',
            value: '$completed / $total',
            icon: Icons.route_outlined,
            iconColor: AppColors.metricPinkIcon,

            /// 🔥 subtitle
            subtitle: '$percent% complete',

            /// optional color (green if high progress)
            subtitleColor: percent >= 50
                ? AppColors.metricGreenIcon
                : AppColors.textSecondary,
          ),
          PerformanceMetric(
            label: 'sales_volume',
            value: data.dailyPerformance.totalSales.toString(),
            icon: Icons.inventory_2_outlined,
            iconColor: AppColors.metricPurpleIcon,
            subtitle: 'mtd_total',
          ),
        ],
        quickActions: [
          QuickAction(
            label: 'begin_trip',
            color: AppColors.primary,
              isBeginTrip: true,

            icon: Icons.local_shipping_outlined,
            onTap: () => ref.read(bottomNavIndexProvider.notifier).state = 1,
          ),
          QuickAction(
            label: 'new_order',
            color: AppColors.accent,
            icon: Icons.shopping_cart_outlined,
            onTap: () => ref.read(bottomNavIndexProvider.notifier).state = 2,
          ),
        ],
      );

      state = AsyncData(stateData);
      return stateData;
    } catch (e, st) {
      final errorState = HomeState(
        pageState: AsyncError(e, st),
      );
      state = AsyncData(errorState);
      return errorState;
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    await loadDashboard();
  }

  // ──────────────────────────────────────────────────────────────────────────
  // Start trip
  // ──────────────────────────────────────────────────────────────────────────

  /// Returns `true` on success, `false` on failure.
  /// The screen observes [tripActionState] to show toast and update button.
  Future<bool> startTrip() async {
    final current = state.value;
    if (current == null) return false;

    final tripId = current.trip?.tripName;
    if (tripId == null || tripId.isEmpty) return false;

    // ── 1. Set loading ───────────────────────────────────────────────────
    state = AsyncData(
      current.copyWith(tripActionState: const AsyncLoading()),
    );

    try {
      final repo = ref.read(homeRepositoryProvider);
      final response = await repo.startTrip(tripId: tripId);

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            tripActionState: AsyncError(
              response.message ?? 'Something went wrong',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );
        return false;
      }

      // ── 2. Flip tripStarted + clear action state ──────────────────────
      state = AsyncData(
        state.value!.copyWith(
          tripStarted: true,
          tripActionState: const AsyncData(null),
        ),
      );
      return true;
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(tripActionState: AsyncError(e, st)),
      );
      return false;
    }
  }
}
