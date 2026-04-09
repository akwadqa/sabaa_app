import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sabaa/features/home/presentation/widgets/performance_card.dart';
import 'package:sabaa/features/home/presentation/widgets/quick_action_card_button.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default([])  List<PerformanceMetric> metrics,
    @Default([])  List<QuickAction>       quickActions,
    @Default('')  String                       userName,
    @Default('')  String                       todayDate,
    AsyncValue<void>?                          pageState,
  }) = _HomeState;
}