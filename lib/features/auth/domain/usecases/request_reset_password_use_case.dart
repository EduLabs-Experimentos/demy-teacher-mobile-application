import 'package:dartz/dartz.dart';
import 'package:demy_teachers/core/errors/failure.dart';
import 'package:demy_teachers/core/usecases/usecase.dart';
import 'package:demy_teachers/features/auth/domain/repositories/auth_repository.dart';

class RequestResetPasswordParams {
  final String emailAddress;

  const RequestResetPasswordParams({required this.emailAddress});
}

class RequestResetPasswordUseCase implements UseCase<void, RequestResetPasswordParams> {
  final AuthRepository repository;

  RequestResetPasswordUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RequestResetPasswordParams params) async {
    return await repository.requestResetPassword(params.emailAddress);
  }
}
