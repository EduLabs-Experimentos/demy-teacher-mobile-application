import 'package:demy_teachers/config/logger/logger_config.dart';
import 'package:demy_teachers/core/errors/dio_exception_mapper.dart';
import 'package:demy_teachers/core/services/token_provider.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthInterceptor extends Interceptor {
  final TokenProvider tokenProvider;

  AuthInterceptor(this.tokenProvider);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await tokenProvider.getToken();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final failure = DioExceptionMapper.map(err);

    LoggerConfig.error('[API ERROR] ${failure.message}');

    final wrappedError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: failure,
      message: failure.message,
    );

    handler.reject(wrappedError);
  }
}