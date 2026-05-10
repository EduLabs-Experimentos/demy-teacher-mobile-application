import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    return await _dio.get(path, queryParameters: query);
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic body,
  }) async {
    return await _dio.post(path, data: body);
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic body,
  }) async {
    return await _dio.put(path, data: body);
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic body,
  }) async {
    return await _dio.delete(path, data: body);
  }
}