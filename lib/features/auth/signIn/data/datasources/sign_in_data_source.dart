
import 'package:sabaa/features/auth/signIn/domain/model/signin_response_model.dart';
import 'package:sabaa/src/infrastructure/api/endpoint/api_endpoints.dart';
import 'package:sabaa/src/infrastructure/api/response/api_response.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';

import '../../../../../src/infrastructure/network/services/network_service.dart';

class SignInRemoteDataSource {
  final NetworkService _networkService;

  SignInRemoteDataSource(this._networkService);


Future<ApiResponse<SigninResponseModel>> signIn(String phone) async {
  try {
    final response = await _networkService.post(
      ApiEndPoints.signIn,
      queryParameters: {
        "mobile_no":phone,
      },
    );

    if (response.data == null || response.statusCode != 200) {
      throw Exception('Request signIn failed');
    }

    return ApiResponse.fromJson(
      response.data ,
      (json) =>SigninResponseModel.fromJson(json as Map<String,dynamic>),
    );
  } catch (e) {
    Dev.logLine('Error in signIn: $e');
    rethrow;
  }
}
}
