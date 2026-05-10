import 'package:demy_teachers/features/attendance/domain/entities/student_statistics.dart';

abstract class AttendanceReportState {}

class ReportInitial extends AttendanceReportState {}

class ReportLoading extends AttendanceReportState {}

class ReportLoaded extends AttendanceReportState {
  final List<StudentStatistics> stats;
  final DateTime startDate;
  final DateTime endDate;

  ReportLoaded({
    required this.stats,
    required this.startDate,
    required this.endDate,
  });
}

class ReportFailure extends AttendanceReportState {
  final String message;

  ReportFailure(this.message);
}