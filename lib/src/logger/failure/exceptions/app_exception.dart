
import '../../error/error_response.dart';

class ServerException implements Exception {
  final ErrorResponse errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
  });
}

class LocalDatabaseException implements Exception {
  final String message;

  const LocalDatabaseException({
    required this.message,
  });
}

class AppException implements Exception {
  String? message;
  ErrorResponse? errorResponse;

  AppException({this.message, this.errorResponse});

  @override
  String toString() {
    return message ?? '';
  }
}

class FetchDataException extends AppException {
  FetchDataException(String message)
      : super(message: 'Error During Communication: $message');
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message: 'Invalid Request: $message');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message: 'Unauthorised: $message');
}

class JsonObjectSerializeException extends AppException {
  JsonObjectSerializeException([message])
      : super(message: 'Json is not matching with any of models : $message');
}
