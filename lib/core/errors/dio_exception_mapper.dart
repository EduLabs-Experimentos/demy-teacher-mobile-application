import 'package:dio/dio.dart';
import 'package:demy_teachers/core/errors/failure.dart';
import 'package:demy_teachers/core/network/models/error_resource.dart';

class DioExceptionMapper {
  static Failure map(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutFailure('Connection timed out');

      case DioExceptionType.connectionError:
        return const NetworkFailure('No internet connection');

      case DioExceptionType.badResponse:
        final data = error.response?.data;
        if (data is Map<String, dynamic>) {
          try {
            final err = ErrorResource.fromJson(data);
            return ServerFailure(err.message, statusCode: err.status);
          } catch (_) {
            return const ServerFailure('Failed to parse server error');
          }
        }
        return ServerFailure(
          error.response?.statusMessage ?? 'Server error',
          statusCode: error.response?.statusCode,
        );

      default:
        return const UnknownFailure('Unexpected error occurred');
    }
  }
}