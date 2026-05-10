import 'package:demy_teachers/features/attendance/domain/entities/student.dart';

abstract class AttendanceEvent {}

class LoadStudentsEvent extends AttendanceEvent {
  final int classSessionId; // Lo necesitarás para guardar
  LoadStudentsEvent(this.classSessionId);
}

class ToggleStudentStatusEvent extends AttendanceEvent {
  final String studentDni;
  final AttendanceStatus newStatus;
  ToggleStudentStatusEvent(this.studentDni, this.newStatus);
}

class SubmitAttendanceEvent extends AttendanceEvent {
  final DateTime date;
  SubmitAttendanceEvent(this.date);
}