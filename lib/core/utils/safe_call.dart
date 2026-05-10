import 'package:dartz/dartz.dart';
import 'package:demy_teachers/core/errors/failure.dart';
import 'package:dio/dio.dart';

Future<Either<Failure, T>> safeCall<T>(Future<T> Function() call) async {
  try {
    final result = await call();
    return Right(result);
  } on Failure catch (f) {
    return Left(f);
  } on DioException catch (e) {
    if (e.error is Failure) return Left(e.error as Failure);
    return Left(UnknownFailure(e.message ?? 'Unexpected Dio error'));
  } catch (_) {
    return const Left(UnknownFailure('Unexpected error'));
  }
}