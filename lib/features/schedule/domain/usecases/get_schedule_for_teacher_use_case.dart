import 'package:dartz/dartz.dart';
import 'package:demy_teachers/core/errors/failure.dart';
import 'package:demy_teachers/core/usecases/usecase.dart'; //
import 'package:demy_teachers/features/schedule/domain/entities/class_session.dart'; 
import 'package:demy_teachers/features/schedule/domain/repositories/schedule_repository.dart';



class GetScheduleForTeacher implements UseCase<Either<Failure, List<ClassSession>>, NoParams> { 
  final ScheduleRepository repository;

  GetScheduleForTeacher(this.repository);

  @override
  Future<Either<Failure, List<ClassSession>>> call(NoParams params) {
    return repository.getScheduleForTeacher(); 
  }
}