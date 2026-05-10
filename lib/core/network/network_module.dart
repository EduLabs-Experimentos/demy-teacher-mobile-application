import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demy_teachers/config/app_config.dart';
import 'package:demy_teachers/config/environment/environment.dart' as app_env;
import 'package:demy_teachers/core/di/injection.dart';
import 'package:demy_teachers/core/network/api_client.dart';
import 'package:demy_teachers/core/network/interceptors/auth_interceptor.dart';
import 'package:demy_teachers/core/network/interceptors/language_interceptor.dart';
import 'package:demy_teachers/core/network/interceptors/logging_interceptor.dart';
import 'package:demy_teachers/core/network/network_info.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  AppConfig appConfig() {
    const envName = String.fromEnvironment('ENV', defaultValue: 'dev');
    final env = envName == 'prod' ? app_env.Environment.prod : app_env.Environment.dev;
    return AppConfig.forEnvironment(env);
  }

  @lazySingleton
  Connectivity connectivity() => Connectivity();

  @lazySingleton
  Dio dio(AppConfig config) {
    final dio = Dio(BaseOptions(
      baseUrl: config.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      headers: {'Content-Type': 'application/json'},
    ));

    dio.interceptors.add(getIt<LanguageInterceptor>());
    dio.interceptors.add(getIt<LoggingInterceptor>());
    dio.interceptors.add(getIt<AuthInterceptor>());

    return dio;
  }

  @lazySingleton
  ApiClient apiClient(Dio dio) => ApiClient(dio);

  @lazySingleton
  NetworkInfo networkInfo(Connectivity connectivity) =>
      NetworkInfoImpl(connectivity);
}