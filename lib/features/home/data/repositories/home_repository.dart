import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/home/data/datasources/home_datasources.dart';
import 'package:sabaa/features/home/domain/model/home_dashboard_model.dart';
import 'package:sabaa/src/infrastructure/api/response/api_response.dart';
import 'package:sabaa/src/infrastructure/network/services/dio_client.dart';
import 'package:sabaa/src/logger/failure/exceptions/app_exception.dart';

part 'home_repository.g.dart';

@Riverpod(keepAlive: true)
HomeRepository homeRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return HomeRepository(HomeDatasource(networkService));
}

class HomeRepository {
  HomeRepository(this._datasource);

  final HomeDatasource _datasource;

  Future<ApiResponse<HomeDashboardModel>> getDashboard() async {
    final response = await _datasource.getDashboard();

    if (response.hasSucceeded) return response;

    throw AppException(message: response.message);
  }
}