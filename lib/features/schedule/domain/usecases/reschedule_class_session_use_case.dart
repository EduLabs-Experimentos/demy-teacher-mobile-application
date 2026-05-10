import 'package:dartz/dartz.dart';
import 'package:demy_teachers/core/errors/failure.dart';
import 'package:demy_teachers/core/usecases/usecase.dart';
import 'package:demy_teachers/features/schedule/domain/repositories/schedule_repository.dart';

// Nota que en vez de 'NoParams', pasamos 'RescheduleParams'
class RescheduleClassSession implements UseCase<Either<Failure, void>, RescheduleParams> {
  
  final ScheduleRepository repository;

  RescheduleClassSession(this.repository);

  @override
  Future<Either<Failure, void>> call(RescheduleParams params) {
    return repository.rescheduleClassSession(
      params.sessionId,
      params.classroomId,
      params.startTime,
      params.endTime,
      params.dayOfWeek,
    );
  }
}

class RescheduleParams {
  final int sessionId;
  final int classroomId;
  final String startTime;
  final String endTime;
  final String dayOfWeek;

  const RescheduleParams({
    required this.sessionId,
    required this.classroomId,
    required this.startTime,
    required this.endTime,
    required this.dayOfWeek,
  });
}