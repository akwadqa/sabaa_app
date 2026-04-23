import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/my_trips/data/repositories/my_trips_repository.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';
import 'package:toastification/toastification.dart';

import '../../../../src/core/shared_widgets/app_toast.dart';
import '../../domain/model/route_stop_model.dart';
import '../../domain/model/trip_model.dart';
import '../../domain/model/week_day_model.dart';
import 'my_trips_state.dart';

part 'my_trips_controller.g.dart';

@Riverpod(keepAlive: true)
class MyTripsController extends _$MyTripsController {

  // ──────────────────────────────────────────────────────────────────────────
  // Build
  // ──────────────────────────────────────────────────────────────────────────
Timer? _timer;
String? _activeVisitId;
int _seconds = 0;
 @override
FutureOr<MyTripsState> build() async {
  final today = DateTime.now();
  final weekDays = _buildWeekDays(today);

  final initial = MyTripsState(
    weekDays: weekDays,
    selectedDate: today,
    stops: const [], // 🔥 empty (no mock)
    trips: const [],
    pageState: const AsyncLoading(),
  );

  state = AsyncData(initial);

  /// 🔥 IMPORTANT: fetch today's trips
  await _fetchTrips(today);

  return state.value!;
}

  // ──────────────────────────────────────────────────────────────────────────
  // Calendar — builds ±15 days window centred on today
  // ──────────────────────────────────────────────────────────────────────────

  /// Generates a rolling window of [daysBefore] + 1 + [daysAfter] days
  /// centred on [anchor] (defaults to today).
  List<WeekDayModel> _buildWeekDays(
    DateTime selected, {
    int daysBefore = 20,
    int daysAfter  = 20,
  }) {
    final today = DateTime.now();
    final start = today.subtract(Duration(days: daysBefore));

    return List.generate(
      daysBefore + 1 + daysAfter,
      (i) {
        final d = start.add(Duration(days: i));
        return WeekDayModel(
          date:       DateTime(d.year, d.month, d.day),
          isSelected: _isSameDay(d, selected),
        );
      },
    );
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;


void _startTimer(String visitId) {
  _timer?.cancel();

  _activeVisitId = visitId;
  _seconds = 0;

  _timer = Timer.periodic(const Duration(seconds: 1), (_) {
    _seconds++;

    final current = state.value;
    if (current == null) return;

    final updatedStops = current.stops.map((s) {
      if (s.id == visitId) {
        return s.copyWith(
          elapsedTime: _formatDuration(_seconds),
        );
      }
      return s;
    }).toList();

    state = AsyncData(current.copyWith(stops: updatedStops));
  });
}
void _stopTimer() {
  _timer?.cancel();
  _activeVisitId = null;
  _seconds = 0;
}
String _formatDuration(int seconds) {
  final h = seconds ~/ 3600;
  final m = (seconds % 3600) ~/ 60;
  final s = seconds % 60;

  return '${h.toString().padLeft(2, '0')}:'
      '${m.toString().padLeft(2, '0')}:'
      '${s.toString().padLeft(2, '0')}';
}
  // ──────────────────────────────────────────────────────────────────────────
  // Day selection
  // ──────────────────────────────────────────────────────────────────────────

  Future<void> selectDay(DateTime date) async {
    final current = state.value;
    if (current == null) return;

    // Rebuild calendar with new selection
    final weekDays = _buildWeekDays(date);

    state = AsyncData(
      current.copyWith(
        weekDays:     weekDays,
        selectedDate: date,
        pageState:    const AsyncLoading(),
      ),
    );

    await _fetchTrips(date);
  }


  // ──────────────────────────────────────────────────────────────────────────
  // Fetch trips from API
  // ──────────────────────────────────────────────────────────────────────────

  Future<void> _fetchTrips(DateTime date) async {
    try {
      state = AsyncLoading();
      final isoDate = '${date.year}-'
          '${date.month.toString().padLeft(2, '0')}-'
          '${date.day.toString().padLeft(2, '0')}';

      final repo     = ref.read(myTripsRepositoryProvider);
      final response = await repo.getTrips(date: isoDate);

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

      final trips = response.data ?? [];
      final stops = _mapTripsToStops(trips);

      state = AsyncData(
        state.value!.copyWith(
          trips:     trips,
          stops:     stops,
          pageState: const AsyncData(null),
        ),
      );
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(pageState: AsyncError(e, st)),
      );
    }
  }

  Future<void> refresh() async {
    final date = state.value?.selectedDate ?? DateTime.now();
    await _fetchTrips(date);
  }

  // ──────────────────────────────────────────────────────────────────────────
  // Mapping — TripModel → RouteStop list for the UI
  // ──────────────────────────────────────────────────────────────────────────

  List<RouteStop> _mapTripsToStops(List<TripModel> trips) {
    final stops = <RouteStop>[];
    int order = 1;

    for (final trip in trips) {
      for (final visit in trip.visits) {
        stops.add(
          RouteStop(
            id:           visit.name,
            order:        order++,
            customerName: visit.customerName,
            customerPhone:visit.customerPhone ,
            address:      visit.location??"Location not found",   // closest field available from API
            status:       _mapStatus(visit.status),
            checkedOutAt: visit.checkOutTime != null
                ? _formatTime(visit.checkOutTime!)
                : null,
          ),
        );
      }
    }

    return stops;
  }

  RouteStopStatus _mapStatus(RouteStopStatus apiStatus) {
    switch (apiStatus) {
      case RouteStopStatus.completed:
        return RouteStopStatus.visited;
      case RouteStopStatus.inProgress:
        return RouteStopStatus.inProgress;
      case RouteStopStatus.skipped:
      case RouteStopStatus.failed:
      case RouteStopStatus.pending:
        return RouteStopStatus.pending;
      case RouteStopStatus.visited:
        return RouteStopStatus.visited;
    }
  }

  /// Converts "15:31:32.598203" → "03:31 PM"
  String _formatTime(String raw) {
    try {
      final parts = raw.split(':');
      final hour   = int.parse(parts[0]);
      final minute = parts[1];
      final suffix = hour >= 12 ? 'PM' : 'AM';
      final h12    = hour % 12 == 0 ? 12 : hour % 12;
      return '${h12.toString().padLeft(2, '0')}:$minute $suffix';
    } catch (_) {
      return raw;
    }
  }

  // ──────────────────────────────────────────────────────────────────────────
  // Mock data  ← remove / replace when API is ready
  // ──────────────────────────────────────────────────────────────────────────
  
bool _isToday(DateTime date) {
  final now = DateTime.now();
  return now.year == date.year &&
      now.month == date.month &&
      now.day == date.day;
}

Future<void> updateVisitStatus({
  required String visitId,
  required RouteStopStatus status,
}) async {
  final current = state.value;
  if (current == null) return;

  /// ❌ NOT TODAY
  if (!_isToday(current.selectedDate!)) {
    Dev.logError("You can only update today visits");
 
    AppToast.errorToast('You can only update today visits');
    return;
  }

  /// ❌ MULTIPLE CHECK-IN
  final hasActiveVisit = current.stops.any(
    (s) => s.status == RouteStopStatus.inProgress,
  );

  // if (status == RouteStopStatus.inProgress && hasActiveVisit) {
  //   Dev.logError("Finish current visit first");

  //   AppToast.errorToast('Finish current visit first');
  //   return;
  // }

  try {
    /// 🔥 optimistic update
    final updatedStops = current.stops.map((s) {
      if (s.id == visitId) {
        return s.copyWith(
          status: status,
          elapsedTime: status == RouteStopStatus.inProgress
              ? '00:00:00'
              : s.elapsedTime,
        );
      }
      return s;
    }).toList();

    state = AsyncData(current.copyWith(stops: updatedStops));

    /// ⏱ TIMER
    if (status == RouteStopStatus.inProgress) {
      _startTimer(visitId);
    } else if (status == RouteStopStatus.visited) {
      _stopTimer();
    }

    /// 🔥 API
    final repo = ref.read(myTripsRepositoryProvider);

    await repo.updateVisitStatus(
      visitId: visitId,
      status: _mapStatusToApi(status),
    );

    /// ✅ SUCCESS
    AppToast.successToast('Visit updated successfully');

    /// 🔄 REFRESH
    await _fetchTrips(current.selectedDate!);

  } catch (e) {
    AppToast.errorToast(e.toString());
  }
}

String _mapStatusToApi(RouteStopStatus status) {
  switch (status) {
    case RouteStopStatus.inProgress:
      return 'In Progress'; // ✅ FIXED
    case RouteStopStatus.visited:
      return 'Completed';   // ✅
    case RouteStopStatus.pending:
      return 'Pending';     // ✅
    case RouteStopStatus.skipped:
      return 'Skipped';     // ✅
    case RouteStopStatus.failed:
      return 'Failed';      // ✅
    case RouteStopStatus.completed:
      return 'Completed';   // ✅
  }
}
}