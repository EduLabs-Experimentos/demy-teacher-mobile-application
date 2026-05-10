import 'package:dartz/dartz.dart';
import 'package:demy_teachers/core/errors/failure.dart';
import 'package:demy_teachers/features/attendance/domain/entities/attendance_history.dart';
import 'package:demy_teachers/features/attendance/domain/entities/student.dart';
// ... imports entities

abstract class AttendanceRepository {
  Future<Either<Failure, List<Student>>> getStudents(int classSessionId);
  Future<Either<Failure, void>> registerAttendance(int sessionId, String date, List<StudentAttendance> attendanceList);
  Future<Either<Failure, List<AttendanceHistory>>> getAttendanceHistory();
}
