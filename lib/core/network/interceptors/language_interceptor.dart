import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class LanguageInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final locale = PlatformDispatcher.instance.locale;
    final languageCode = locale.languageCode;

    options.headers['Accept-Language'] = languageCode;

    handler.next(options);
  }
}