import 'package:demy_teachers/features/schedule/data/dtos/class_session_response_dto.dart';
import 'package:demy_teachers/features/schedule/data/dtos/reschedule_request_dto.dart';

abstract class ScheduleRemoteDataSource {
  Future<List<ClassSessionResponseDto>> getClassSessions(int userId); 

  Future<void> rescheduleClassSession(int classSessionId, RescheduleRequestDto request); 
}