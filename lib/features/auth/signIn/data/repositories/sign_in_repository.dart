
import 'package:sabaa/src/infrastructure/api/response/api_response.dart';
import 'package:sabaa/src/infrastructure/network/services/dio_client.dart';
import 'package:sabaa/src/logger/failure/exceptions/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/model/signin_response_model.dart';
import '../datasources/sign_in_data_source.dart';
part 'sign_in_repository.g.dart';

@Riverpod(keepAlive: true)
SignInRepository signInRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return SignInRepository(SignInRemoteDataSource(networkService));
}
class SignInRepository {
  final SignInRemoteDataSource _remoteDataSource;

  SignInRepository(this._remoteDataSource);
  Future<ApiResponse<SigninResponseModel>> signIn(String phone) async {
    final response = await _remoteDataSource.signIn(phone);
  
    if (response.status == 200) {
      return response;
    }
  
    throw AppException(message: response.message);
  }

}