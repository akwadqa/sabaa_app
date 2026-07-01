import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/customers/data/data%20source/customer_remote_data_source.dart';
import 'package:sabaa/features/customers/domain/model/create_customer_params.dart';
import 'package:sabaa/features/customers/domain/model/create_customer_response/create_customer_response.dart';
import 'package:sabaa/src/infrastructure/api/response/api_response.dart';
import 'package:sabaa/src/infrastructure/network/exception/dio_exceptions.dart';
import 'package:sabaa/src/infrastructure/network/services/dio_client.dart';

part 'customer_repository.g.dart';

@Riverpod(keepAlive: true)
CustomerRepository customerRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return CustomerRepository(CustomerRemoteDataSource(networkService));
}

class CustomerRepository {
  final CustomerRemoteDataSource _remoteDataSource;

  CustomerRepository(this._remoteDataSource);

  Future<CustomerModel> createCustomer(CreateCustomerParams params) async {
    final response = await _remoteDataSource.createCustomer(params);

    // if (response.status != 201) {
    return response.data!;
    // }

    throw AppException(response.message);
  }

  Future<ApiResponse<List<CustomerModel>>> getCustomers(
      {required int page, required String name}) async {
    try {
      final result = await _remoteDataSource.getCustomers(page, name);

      if (result.hasFailed) {
        throw AppException(result.message ?? 'Failed to fetch data');
      }

      return result;
    } catch (e) {
      throw AppException('Failed to fetch CustomerModel: $e');
    }
  }

  // Future<ApiResponse<List<CustomerModel>>> searchCustomers(
  //     String query, int page) async {
  //   try {
  //     final result = await _remoteDataSource.searchCustomers(query, page);

  //     if (result.hasFailed) {
  //       throw AppException(result.message ?? 'Failed to search customers');
  //     }

  //     return result;
  //   } catch (e) {
  //     throw AppException('Failed to search customers: e');
  //   }
  // }
}
