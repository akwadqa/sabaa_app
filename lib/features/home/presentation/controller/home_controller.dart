import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/home/data/repositories/home_repository.dart';
import 'package:sabaa/features/home/presentation/widgets/performance_card.dart';
import 'package:sabaa/features/home/presentation/widgets/quick_action_card_button.dart';
import 'package:sabaa/features/main/presentation/screens/main_screen.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'home_state.dart';
import 'package:flutter_riverpod/legacy.dart';

part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeController extends _$HomeController {

  // ──────────────────────────────────────────────────────────────────────────
  // Build
  // ──────────────────────────────────────────────────────────────────────────

  @override
  FutureOr<HomeState> build() async {
    final initial = HomeState(
      userName:     _mockUserName(),
      todayDate:    _mockTodayDate(),
      metrics:      _mockMetrics(),
      quickActions: _mockQuickActions(),
      pageState:    const AsyncData(null),
    );

    state = AsyncData(initial);
    return initial;

    // ── Uncomment when API is ready ────────────────────────────────────────
    // return await loadDashboard();
  }

  // ──────────────────────────────────────────────────────────────────────────
  // Public actions
  // ──────────────────────────────────────────────────────────────────────────

  Future<void> loadDashboard() async {
    try {
      state = AsyncData(
        state.value!.copyWith(pageState: const AsyncLoading()),
      );

      final repo     = ref.read(homeRepositoryProvider);
      final response = await repo.getDashboard();

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            pageState: AsyncError(
              response.message ?? 'Something went wrong',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );
        return;
      }

      final data = response.data!;

      state = AsyncData(
        state.value!.copyWith(
          userName:  data.userName,
          todayDate: data.todayDate,
          pageState: const AsyncData(null),
          metrics: [
            PerformanceMetric(
              label:  'sales_volume',
              value:     data.salesVolume,
              iconColor: AppColors.metricPurple,
              icon:      Icons.inventory_2_outlined,
            ),
            PerformanceMetric(
              label:  'todays_visits',
              value:     '${data.todaysVisits}',
              iconColor: AppColors.metricPink,
              icon:      Icons.trending_up_rounded,
            ),
          ],
        ),
      );
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(pageState: AsyncError(e, st)),
      );
    }
  }

  Future<void> refresh() async => loadDashboard();

  // ──────────────────────────────────────────────────────────────────────────
  // Mock data  ← remove/replace when API is ready
  // ──────────────────────────────────────────────────────────────────────────

  String _mockUserName() => 'Alex';

  String _mockTodayDate() => 'APR 24, 2026';

  List<PerformanceMetric> _mockMetrics() => [
        const PerformanceMetric(
          label:  'sales_volume',
          value:     r'$1,250',
          iconColor: AppColors.metricPurple,
          icon:      Icons.inventory_2_outlined,
        ),
        const PerformanceMetric(
          label:  'todays_visits',
          value:     '10',
          iconColor: AppColors.metricPink,
          icon:      Icons.trending_up_rounded,
        ),
      ];

  List<QuickAction> _mockQuickActions() => [
        QuickAction(
          label:  'begin_trip',
          color:     AppColors.primary,
          icon:      Icons.local_shipping_outlined,
          onTap:()=>ref.read(bottomNavIndexProvider.notifier).state = 1
        ),
        QuickAction(
          label:   'new_order',
          color:      AppColors.accent,
          icon:       Icons.shopping_cart_outlined,
          onTap:()=>ref.read(bottomNavIndexProvider.notifier).state = 2

          // onTap:  AppRoutes.newOrderScreen,
          // routeExtra: 'Al mouna shop',
        ),
      ];
}
// final bottomNavIndexProvider = StateProvider<int>((ref) => 0);
