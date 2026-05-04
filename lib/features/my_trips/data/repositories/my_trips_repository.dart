import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/src/infrastructure/api/response/api_response.dart';
import 'package:sabaa/src/infrastructure/network/services/dio_client.dart';
import 'package:sabaa/src/logger/failure/exceptions/app_exception.dart';

import '../../domain/model/trip_model.dart';
import '../datasources/my_trips_data_source.dart';

part 'my_trips_repository.g.dart';

@Riverpod(keepAlive: true)
MyTripsRepository myTripsRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return MyTripsRepository(MyTripsDataSource(networkService));
}

class MyTripsRepository {
  MyTripsRepository(this._datasource);

  final MyTripsDataSource _datasource;

  Future<ApiResponse<List<TripModel>>> getTrips({
    required String date,
  }) async {
    final response = await _datasource.getTrips(date: date);
    if (response.hasSucceeded) return response;
    throw AppException(message: response.message);
  }
  Future<void> updateVisitStatus({
  required String visitId,
  required String status,
}) async {
  final response = await _datasource.updateVisitStatus(
    visitId: visitId,
    status: status,
  );

  if (response.hasSucceeded) return;

  throw AppException(message: response.message);
}
}