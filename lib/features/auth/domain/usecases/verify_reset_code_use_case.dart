import 'package:dartz/dartz.dart';
import 'package:demy_teachers/core/errors/failure.dart';
import 'package:demy_teachers/core/usecases/usecase.dart';
import 'package:demy_teachers/features/auth/domain/repositories/auth_repository.dart';

class VerifyResetCodeParams {
  final String emailAddress;
  final String code;

  const VerifyResetCodeParams({
    required this.emailAddress,
    required this.code,
  });
}

class VerifyResetCodeUseCase implements UseCase<void, VerifyResetCodeParams> {
  final AuthRepository repository;

  VerifyResetCodeUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(VerifyResetCodeParams params) async {
    return await repository.verifyResetCode(
      params.emailAddress,
      params.code,
    );
  }
}
