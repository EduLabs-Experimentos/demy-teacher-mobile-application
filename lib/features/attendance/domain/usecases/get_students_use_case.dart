import 'package:dartz/dartz.dart';
import 'package:demy_teachers/core/errors/failure.dart';
import 'package:demy_teachers/core/usecases/usecase.dart';
import 'package:demy_teachers/features/attendance/domain/entities/student.dart';
import 'package:demy_teachers/features/attendance/domain/repositories/attendance_repository.dart';

class GetStudentsUseCase implements UseCase<Either<Failure, List<Student>>,int> {
  final AttendanceRepository repository;
  GetStudentsUseCase(this.repository);
  
  @override
  Future<Either<Failure, List<Student>>> call(int classSessionId) => repository.getStudents(classSessionId);
}

// features/attendance/domain/usecases/register_attendance_use_case.dart
class RegisterAttendanceParams {
  final int sessionId;
  final String date;
  final List<StudentAttendance> list;
  RegisterAttendanceParams(this.sessionId, this.date, this.list);
}

class RegisterAttendanceUseCase implements UseCase<Either<Failure, void>, RegisterAttendanceParams> {
  final AttendanceRepository repository;
  RegisterAttendanceUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterAttendanceParams params) => 
      repository.registerAttendance(params.sessionId, params.date, params.list);
}