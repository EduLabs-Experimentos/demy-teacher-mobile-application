import 'package:dartz/dartz.dart';
import 'package:demy_teachers/core/errors/failure.dart';
import 'package:demy_teachers/features/profile/domain/entities/teacher.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Teacher>> getCurrentTeacher();
}