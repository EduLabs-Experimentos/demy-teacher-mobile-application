import 'package:dartz/dartz.dart';
import 'package:demy_teachers/core/errors/failure.dart';
import 'package:demy_teachers/core/usecases/usecase.dart';
import 'package:demy_teachers/features/auth/domain/entities/user.dart';
import 'package:demy_teachers/features/auth/domain/repositories/auth_repository.dart';

class ResetPasswordParams {
  final String emailAddress;
  final String password;
  final String confirmPassword;

  const ResetPasswordParams({
    required this.emailAddress,
    required this.password,
    required this.confirmPassword,
  });
}

class ResetPasswordUseCase implements UseCase<Either<Failure, User>, ResetPasswordParams> {
  final AuthRepository repository;

  ResetPasswordUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(ResetPasswordParams params) async {
    return await repository.resetPassword(
      params.emailAddress,
      params.password,
      params.confirmPassword,
    );
  }
}
