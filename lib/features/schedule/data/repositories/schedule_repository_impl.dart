
import 'package:dartz/dartz.dart';
import 'package:demy_teachers/core/errors/failure.dart';
import 'package:demy_teachers/core/utils/safe_call.dart';
import 'package:demy_teachers/features/auth/data/services/active_user_provider.dart';
import 'package:demy_teachers/features/schedule/data/datasources/schedule_remote_data_source.dart';
import 'package:demy_teachers/features/schedule/data/dtos/reschedule_request_dto.dart';
import 'package:demy_teachers/features/schedule/data/mappers/schedule_mapper.dart';
import 'package:demy_teachers/features/schedule/domain/entities/class_session.dart';
import 'package:demy_teachers/features/schedule/domain/repositories/schedule_repository.dart';



class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleRemoteDataSource remoteDataSource;
  final ActiveUserProvider userProvider;

  ScheduleRepositoryImpl(this.remoteDataSource, this.userProvider);

  @override
  Future<Either<Failure, List<ClassSession>>> getScheduleForTeacher() async {
    return safeCall(() async {

      final int teacherId = await userProvider.getActiveTeacherId();
      
      final classSessionsDto = await remoteDataSource.getClassSessions(teacherId); 
      
      final classSessions = classSessionsDto
          .map(ScheduleMapper.fromDto)
          .toList();

      return classSessions;
    });
  }

  @override
  Future<Either<Failure, void>> rescheduleClassSession(
    int sessionId,
    int classroomId,
    String startTime,
    String endTime,
    String dayOfWeek) async {
    return safeCall(() async {

      final request = RescheduleRequestDto(
        classroomId: classroomId,
        startTime: startTime,
        endTime: endTime,
        dayOfWeek: dayOfWeek,
      );
      
      await remoteDataSource.rescheduleClassSession(sessionId, request);
    });
  }
}