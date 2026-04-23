// import 'package:flutter/material.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:sabaa/features/home/data/repositories/home_repository.dart';
// import 'package:sabaa/features/home/presentation/widgets/performance_card.dart';
// import 'package:sabaa/features/home/presentation/widgets/quick_action_card_button.dart';
// import 'package:sabaa/features/main/presentation/screens/main_screen.dart';
// import 'package:sabaa/src/application/router/app_routes.dart';
// import 'package:sabaa/src/infrastructure/storage/local_storage_service.dart';
// import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
// import 'home_state.dart';
// import 'package:flutter_riverpod/legacy.dart';

// part 'home_controller.g.dart';

// @Riverpod(keepAlive: true)
// class HomeController extends _$HomeController {

//   // ──────────────────────────────────────────────────────────────────────────
//   // Build
//   // ──────────────────────────────────────────────────────────────────────────

//   // @override
//   // FutureOr<HomeState> build() async {
//   //   final initial = HomeState(
//   //     userName:     _mockUserName(),
//   //     todayDate:    _mockTodayDate(),
//   //     metrics:      _mockMetrics(),
//   //     quickActions: _mockQuickActions(),
//   //     pageState:    const AsyncData(null),
//   //   );

//   //   state = AsyncData(initial);
//   //   return initial;

//   //   // ── Uncomment when API is ready ────────────────────────────────────────
//   //   // return await loadDashboard();
//   // }
// @override
// FutureOr<HomeState> build() async {
//   return await loadDashboard();
// }
//   // ──────────────────────────────────────────────────────────────────────────
//   // Public actions
//   // ──────────────────────────────────────────────────────────────────────────

// Future<HomeState> loadDashboard() async {
//   try {
//     final repo = ref.read(homeRepositoryProvider);
//     final userInf=ref.read(localStorageServiceProvider).userInfo;

//     final response = await repo.getDashboard();

//     final data = response.data!;

//     final stateData = HomeState(
//       userName: userInf.fullName, // أو لاحقًا من user info
//       todayDate: data.date.formattedDate,
//       pageState: const AsyncData(null),

//       metrics: [
//         PerformanceMetric(
//           label: 'total_sales',
//           value: data.dailyPerformance.totalSales.toString(),
//           iconColor: AppColors.metricPurple,
//           icon: Icons.inventory_2_outlined,
//         ),
//         PerformanceMetric(
//           label: 'todays_visits',
//           value: data.dailyPerformance.totalVisitsCompleted.toString(),
//           iconColor: AppColors.metricPink,
//           icon: Icons.trending_up_rounded,
//         ),
//         // PerformanceMetric(
//         //   label: 'orders_created',
//         //   value: data.dailyPerformance.totalOrdersCreated.toString(),
//         //   iconColor: AppColors.metricPurple,
//         //   icon: Icons.shopping_cart_outlined,
//         // ),
//         // PerformanceMetric(
//         //   label: 'payments_collected',
//         //   value: data.dailyPerformance.totalPaymentsCollected.toString(),
//         //   iconColor: AppColors.metricPink,
//         //   icon: Icons.payments_outlined,
//         // ),
//       ],

      // quickActions: [
      //   QuickAction(
      //     label: 'begin_trip',
      //     color: AppColors.primary,
      //     icon: Icons.local_shipping_outlined,
      //     onTap: () =>
      //         ref.read(bottomNavIndexProvider.notifier).state = 1,
      //   ),
      //   QuickAction(
      //     label: 'new_order',
      //     color: AppColors.accent,
      //     icon: Icons.shopping_cart_outlined,
      //     onTap: () =>
      //         ref.read(bottomNavIndexProvider.notifier).state = 2,
      //   ),
      // ],
//     );

//     state = AsyncData(stateData);

//     return stateData;
//   } catch (e, st) {
//     final errorState = HomeState(
//       userName: '',
//       todayDate: '',
//       metrics: [],
//       quickActions: [],
//       pageState: AsyncError(e, st),
//     );

//     state = AsyncData(errorState);

//     return errorState;
//   }
// }


//   // Future<void> loadDashboard() async {
//   //   try {
//   //     state = AsyncData(
//   //       state.value!.copyWith(pageState: const AsyncLoading()),
//   //     );

//   //     final repo     = ref.read(homeRepositoryProvider);
//   //     final response = await repo.getDashboard();

//   //     if (response.hasFailed) {
//   //       state = AsyncData(
//   //         state.value!.copyWith(
//   //           pageState: AsyncError(
//   //             response.message ?? 'Something went wrong',
//   //             StackTrace.fromString(response.message ?? ''),
//   //           ),
//   //         ),
//   //       );
//   //       return;
//   //     }

//   //     final data = response.data!;

//   //     state = AsyncData(
//   //       state.value!.copyWith(
//   //         userName:  data.userName,
//   //         todayDate: data.todayDate,
//   //         pageState: const AsyncData(null),
//   //         metrics: [
//   //           PerformanceMetric(
//   //             label:  'sales_volume',
//   //             value:     data.salesVolume,
//   //             iconColor: AppColors.metricPurple,
//   //             icon:      Icons.inventory_2_outlined,
//   //           ),
//   //           PerformanceMetric(
//   //             label:  'todays_visits',
//   //             value:     '${data.todaysVisits}',
//   //             iconColor: AppColors.metricPink,
//   //             icon:      Icons.trending_up_rounded,
//   //           ),
//   //         ],
//   //       ),
//   //     );
//   //   } catch (e, st) {
//   //     state = AsyncData(
//   //       state.value!.copyWith(pageState: AsyncError(e, st)),
//   //     );
//   //   }
//   // }

//  Future<void> refresh() async {
//   state = const AsyncLoading();
//   await loadDashboard();
// }

//   // ──────────────────────────────────────────────────────────────────────────
//   // Mock data  ← remove/replace when API is ready
//   // ──────────────────────────────────────────────────────────────────────────

//   String _mockUserName() => 'Alex';

//   String _mockTodayDate() => 'APR 24, 2026';

//   List<PerformanceMetric> _mockMetrics() => [
//         const PerformanceMetric(
//           label:  'sales_volume',
//           value:     r'$1,250',
//           iconColor: AppColors.metricPurple,
//           icon:      Icons.inventory_2_outlined,
//         ),
//         const PerformanceMetric(
//           label:  'todays_visits',
//           value:     '10',
//           iconColor: AppColors.metricPink,
//           icon:      Icons.trending_up_rounded,
//         ),
//       ];

//   List<QuickAction> _mockQuickActions() => [
//         QuickAction(
//           label:  'begin_trip',
//           color:     AppColors.primary,
//           icon:      Icons.local_shipping_outlined,
//           onTap:()=>ref.read(bottomNavIndexProvider.notifier).state = 1
//         ),
//         QuickAction(
//           label:   'new_order',
//           color:      AppColors.accent,
//           icon:       Icons.shopping_cart_outlined,
//           onTap:()=>ref.read(bottomNavIndexProvider.notifier).state = 2

//           // onTap:  AppRoutes.newOrderScreen,
//           // routeExtra: 'Al mouna shop',
//         ),
//       ];
// }
// // final bottomNavIndexProvider = StateProvider<int>((ref) => 0);
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/home/data/repositories/home_repository.dart';
import 'package:sabaa/features/home/presentation/controller/home_state.dart';
import 'package:sabaa/features/home/presentation/widgets/performance_card.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
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
      final repo    = ref.read(homeRepositoryProvider);
      final userInf = ref.read(localStorageServiceProvider).userInfo;
      final response = await repo.getDashboard();

      final data = response.data!;

      // Derive tripStarted from the API status field
      final tripStarted = data.trip.status.toLowerCase() == 'in progress';

      final stateData = HomeState(
        userName:  userInf.fullName,
        todayDate: data.date.formattedDate,
        trip:      data.trip,
        tripStarted: tripStarted,
        pageState: const AsyncData(null),
        metrics: [
          PerformanceMetric(
            label:  'total_sales',
            value:     data.dailyPerformance.totalSales.toString(),
            iconColor: AppColors.metricPurple,
            icon:      Icons.inventory_2_outlined,
          ),
          PerformanceMetric(
            label:  'todays_visits',
            value:     data.dailyPerformance.totalVisitsCompleted.toString(),
            iconColor: AppColors.metricPink,
            icon:      Icons.trending_up_rounded,
          ),
        ],
            quickActions: [
        QuickAction(
          label: 'begin_trip',
          color: AppColors.primary,
          icon: Icons.local_shipping_outlined,
          onTap: () =>
              ref.read(bottomNavIndexProvider.notifier).state = 1,
        ),
        QuickAction(
          label: 'new_order',
          color: AppColors.accent,
          icon: Icons.shopping_cart_outlined,
          onTap: () =>
              ref.read(bottomNavIndexProvider.notifier).state = 2,
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
      final repo     = ref.read(homeRepositoryProvider);
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
          tripStarted:     true,
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