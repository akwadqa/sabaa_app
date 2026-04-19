import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/src/application/router/app_router.dart';
import 'package:sabaa/src/application/router/app_routes.dart';

import '../../../core/localization/current_language.dart';
import '../../api/response/api_response.dart';
import '../../storage/local_storage_service.dart';
import '../exception/dio_exceptions.dart';

class RemoteInterceptor extends Interceptor {
  final Ref ref;
  RemoteInterceptor(this.ref);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // final token = ref.read(userDataProvider);
    final token = await ref.read(localStorageServiceProvider).getToken();
    final language = ref.read(currentLanguageProvider);

    // options.headers['Authorization'] = "token 13f237c84355ded:99a131094d2127e";

    if (token != null) {
      options.headers['Authorization'] = "token $token";
    }

    options.headers['Accept-Language'] = language;

    debugPrint("🔵 [DIO REQUEST]");
    debugPrint("➡️ ${options.method} ${options.uri}");
    debugPrint("📦 Headers: ${options.headers}");
    debugPrint("📝 Body: ${options.data}");

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("🟢 [DIO RESPONSE]");
    debugPrint("✅ ${response.statusCode} ${response.requestOptions.uri}");
    debugPrint("📦 Response data: ${_prettyJson(response.data)}");

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final request = err.requestOptions;

    debugPrint("🔴 [DIO ERROR]");
    debugPrint("⛔️ ${err.type} for ${request.method} ${request.uri}");
    debugPrint("📥 Response status: ${_prettyJson(err.response?.statusCode)}");
    debugPrint("📥 Response : ${_prettyJson(err.response)}");
    debugPrint("📥 Response data: ${_prettyJson(err.response?.data)}");

    final statusCode = err.response?.statusCode;
    final responseData = err.response?.data;

    // ✅ تحقق من إذا كان Unauthorized

    final isUnauthorized =
        (statusCode == 401 &&
            (responseData['message']?.toString().toLowerCase().contains(
                  "otp",
                )) ==
                false) ||
        (responseData['exc_type']?.toString().contains('PermissionError')) ==
            true;

    if (isUnauthorized) {
      debugPrint("🚪 Session expired → redirect to Login");

      ref.read(localStorageServiceProvider).logout();
      rootKey.currentContext!.go(AppRoutes.signInScreen);

      // ref.read().go(Routes.login);
    }

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions, "Timeout");
      case DioExceptionType.badResponse:
        switch (statusCode) {
          case 400:
            throw BadRequestException(
              request,
              responseData['message'] ?? "Bad Request",
            );
          case 401:
            throw UnauthorizedException(
              request,
              responseData['message'] ?? "Unauthorized",
            );
          case 403:
            throw AccessForbiddenException(
              request,
              responseData['message'] ?? "Forbidden",
            );
          case 404:
            throw NotFoundException(
              request,
              responseData['message'] ?? "Not Found",
            );
          case 409:
            throw ConflictException(
              request,
              responseData['message'] ?? "Conflict",
            );
          //TODO:
          case 422:
            // throw UnprocessableEntityException(request, "Unprocessable Entity");
            throw UnprocessableEntityException(
              request,
              responseData['message'] ?? "Unprocessable Entity",
            );
          case 500:
            throw InternalServerErrorException(
              request,
              responseData['message'] ?? "Server Error",
            );
          default:
            throw BadResponseException(
              request,
              responseData['message'] ?? "Bad Response",
            );
        }
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw NoInternetConnectionException(request, "No Internet");
      case DioExceptionType.badCertificate:
        throw BadCertificateException(request, "Bad Certificate");
      case DioExceptionType.connectionError:
        // 👇 لو فيه توكن → غالباً معناها Unauthorized
        // if (ref.read(userDataProvider) != null) {
        //   debugPrint("⚠️ ConnectionError but user has token → force logout");
        //   ref.read(userDataProvider.notifier).removeData();
        //   ref.read(appRouterProvider).replaceAll([const LoginRoute()]);
        // }
        throw ConnectionErrorException(request, "Connection Error");
    }

    handler.next(err);
  }

  ApiResponse _handleErrorResponse(DioException err) {
    final data = err.response?.data;
    final statusCode = err.response?.statusCode;
    final path = err.requestOptions.path;

    String message;

    if (data is Map && data['message'] != null) {
      message = data['message'].toString();
    } else {
      message =
          _getDefaultMessageForStatusCode(statusCode) ??
          err.message ??
          'Unexpected error occurred';
    }

    return ApiResponse.error(
      message: "$message\n[$statusCode] [$path]",
      error: data,
    );
  }

  String? _getDefaultMessageForStatusCode(int? status) {
    switch (status) {
      case 400:
        return 'Bad Request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not Found';
      case 409:
        return 'Conflict';
      case 422:
        return 'Unprocessable Entity';
      case 500:
        return 'Internal Server Error';
      default:
        return null;
    }
  }

  String _prettyJson(dynamic data) {
    try {
      if (data is Map || data is List) {
        return const JsonEncoder.withIndent('  ').convert(data);
      }
      return data.toString();
    } catch (_) {
      return 'Invalid JSON';
    }
  }
}
