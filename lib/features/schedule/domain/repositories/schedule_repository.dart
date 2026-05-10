
import 'package:dartz/dartz.dart';
import 'package:demy_teachers/core/errors/failure.dart';
import 'package:demy_teachers/features/schedule/domain/entities/class_session.dart';

abstract class ScheduleRepository {
  Future<Either<Failure,List<ClassSession>>> getScheduleForTeacher();

  Future<Either<Failure, void>> rescheduleClassSession(
    int sessionId,
    int classroomId,
    String startTime,
    String endTime,
    String dayOfWeek
  );
}