import 'package:sabaa/features/home/domain/model/home_dashboard_model.dart';
import 'package:sabaa/src/infrastructure/api/endpoint/api_endpoints.dart';
import 'package:sabaa/src/infrastructure/api/response/api_response.dart';
import 'package:sabaa/src/infrastructure/network/services/network_service.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';

class HomeDatasource {
  HomeDatasource(this._networkService);

  final NetworkService _networkService;

  Future<ApiResponse<HomeDashboardModel>> getDashboard() async {
    try {
      final response = await _networkService.get(
        ApiEndPoints.homeDashboard, 
        queryParameters: {},
      );

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Failed to load home dashboard');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => HomeDashboardModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      Dev.logLine('HomeDatasource.getDashboard error: $e');
      rethrow;
    }
  }
}