import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/route_stop_model.dart';
import '../../domain/model/trip_model.dart';
import '../../domain/model/week_day_model.dart';

class MyTripsState {
  const MyTripsState({
    this.weekDays        = const [],
    this.selectedDate,
    this.trips           = const [],
    this.stops           = const [],
    this.pageState,
  });

  final List<WeekDayModel> weekDays;
  final DateTime?          selectedDate;
  final List<TripModel>    trips;
  final List<RouteStop>    stops;      // flattened UI list mapped from visits
  final AsyncValue<void>?  pageState;

  MyTripsState copyWith({
    List<WeekDayModel>? weekDays,
    DateTime?           selectedDate,
    List<TripModel>?    trips,
    List<RouteStop>?    stops,
    AsyncValue<void>?   pageState,
  }) {
    return MyTripsState(
      weekDays:     weekDays     ?? this.weekDays,
      selectedDate: selectedDate ?? this.selectedDate,
      trips:        trips        ?? this.trips,
      stops:        stops        ?? this.stops,
      pageState:    pageState    ?? this.pageState,
    );
  }
}