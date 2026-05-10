import 'package:demy_teachers/features/attendance/domain/entities/student.dart';

class StudentStatistics {
  final Student student; // Para foto y nombre
  final int totalSessions;
  final int presentCount;
  final int absentCount;
  final int excusedCount;

  StudentStatistics({
    required this.student,
    required this.totalSessions,
    required this.presentCount,
    required this.absentCount,
    required this.excusedCount,
  });

  // Getters para porcentajes
  // A (Asistencias)
  int get presentPercentage => totalSessions == 0 ? 0 : ((presentCount / totalSessions) * 100).round();
  
  // T (Tardanzas - Asumiremos que EXCUSED o LATE va aqui, ajusta según tu lógica)
  int get excusedPercentage => totalSessions == 0 ? 0 : ((excusedCount / totalSessions) * 100).round();

  // J (Faltas/Absent)
  int get absentPercentage => totalSessions == 0 ? 0 : ((absentCount / totalSessions) * 100).round();
}