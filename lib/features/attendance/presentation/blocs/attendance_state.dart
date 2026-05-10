import 'package:demy_teachers/features/attendance/domain/entities/student.dart';

abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}
class AttendanceLoading extends AttendanceState {}

class AttendanceLoaded extends AttendanceState {
  final int classSessionId;
  final List<StudentAttendance> students;
  final String? errorMessage; // Lista mutable en memoria

  AttendanceLoaded({required this.classSessionId, required this.students,this.errorMessage,});
  
  // Método copyWith para actualizar la lista inmutablemente
  AttendanceLoaded copyWith({
    int? classSessionId,
    List<StudentAttendance>? students,
    String? errorMessage,
  }) {
    return AttendanceLoaded(
      classSessionId: classSessionId ?? this.classSessionId,
      students: students ?? this.students,
      errorMessage: errorMessage,
    );
  }
}

class AttendanceSuccess extends AttendanceState {} // Guardado exitoso
class AttendanceFailure extends AttendanceState {
  final String message;
  AttendanceFailure(this.message);
}