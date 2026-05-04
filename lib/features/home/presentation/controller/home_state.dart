// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sabaa/features/home/presentation/widgets/performance_card.dart';
import 'package:sabaa/features/home/presentation/widgets/quick_action_card_button.dart';

// part 'home_state.freezed.dart';

// @freezed
// abstract class HomeState with _$HomeState {
//   const factory HomeState({
//     @Default([])  List<PerformanceMetric> metrics,
//     @Default([])  List<QuickAction>       quickActions,
//     @Default('')  String                       userName,
//     @Default('')  String                       todayDate,
//     AsyncValue<void>?                          pageState,
//   }) = _HomeState;
// }

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sabaa/features/home/domain/model/home_dashboard_model.dart';

import '../../domain/model/home_trip_model.dart';
part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default([])  List<PerformanceMetric> metrics,
    @Default([])  List<QuickAction>       quickActions,
    @Default('')  String                       userName,
    @Default('')  String                       todayDate,

    // ── Trip ──────────────────────────────────────────────────────────────
    HomeTripModel?    trip,               // null → no trip assigned today
    @Default(false)   bool tripStarted,   // true after startTrip succeeds

    // ── Async states ──────────────────────────────────────────────────────
    AsyncValue<void>? pageState,          // main load / refresh
    AsyncValue<void>? tripActionState,    // startTrip call in progress
  }) = _HomeState;
}