import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/van_stock/data/datasources/van_stock_datasource.dart';
import 'package:sabaa/features/van_stock/domain/model/van_stock_model.dart';
import 'package:sabaa/src/infrastructure/api/response/api_response.dart';
import 'package:sabaa/src/infrastructure/network/services/dio_client.dart';
import 'package:sabaa/src/logger/failure/exceptions/app_exception.dart';

part 'van_stock_repository.g.dart';

@Riverpod(keepAlive: true)
VanStockRepository vanStockRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return VanStockRepository(VanStockDatasource(networkService));
}

class VanStockRepository {
  final VanStockDatasource _datasource;

  VanStockRepository(this._datasource);

  Future<ApiResponse<VanStockModel>> getVanStock({required int page}) async {
    final response = await _datasource.getVanStock(page);

    if (response.hasSucceeded) return response;

    throw AppException(message: response.message);
  }
}