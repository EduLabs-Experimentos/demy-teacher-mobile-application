import 'package:dartz/dartz.dart';
import 'package:demy_teachers/core/errors/failure.dart';
import 'package:demy_teachers/core/usecases/usecase.dart';
import 'package:demy_teachers/features/profile/domain/entities/teacher.dart';
import 'package:demy_teachers/features/profile/domain/repositories/profile_repository.dart';

class GetCurrentTeacherUseCase
    implements UseCase<Either<Failure, Teacher>, NoParams> {

  final ProfileRepository repository;

  GetCurrentTeacherUseCase(this.repository);

  @override
  Future<Either<Failure, Teacher>> call(NoParams params) {
    return repository.getCurrentTeacher();
  }
}