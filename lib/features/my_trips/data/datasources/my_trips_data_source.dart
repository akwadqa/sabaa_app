import 'package:sabaa/src/infrastructure/api/endpoint/api_endpoints.dart';
import 'package:sabaa/src/infrastructure/api/response/api_response.dart';
import 'package:sabaa/src/infrastructure/network/services/network_service.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';

import '../../domain/model/trip_model.dart';

class MyTripsDataSource {
  MyTripsDataSource(this._networkService);

  final NetworkService _networkService;

  /// Fetch all trips for a given date.
  Future<ApiResponse<List<TripModel>>> getTrips({
    required String date,
  }) async {
    try {
      final response = await _networkService.get(
        ApiEndPoints.getTripsData,          
        queryParameters: {'date': date},
      );

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Failed to load trips');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => (json as List)
            .map((e) => TripModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      Dev.logLine('MyTripsDataSource.getTrips error: $e');
      rethrow;
    }
  }

Future<ApiResponse<void>> updateVisitStatus({
  required String visitId,
  required String status,
}) async {
  try {
    final response = await _networkService.post(
      ApiEndPoints.updateVisitStatus,
      data: {
        'visit_id': visitId,
        'status': status,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update visit status');
    }

    return ApiResponse.fromJson(
      response.data,
      (_) => Null,
    );
  } catch (e) {
    Dev.logLine('updateVisitStatus error: $e');
    rethrow;
  }
}
}