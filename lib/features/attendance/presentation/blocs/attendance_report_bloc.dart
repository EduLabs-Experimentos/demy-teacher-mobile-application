import 'package:demy_teachers/core/usecases/usecase.dart';
import 'package:demy_teachers/features/attendance/domain/entities/attendance_history.dart';
import 'package:demy_teachers/features/attendance/domain/entities/student.dart';
import 'package:demy_teachers/features/attendance/domain/entities/student_statistics.dart';
import 'package:demy_teachers/features/attendance/domain/usecases/get_attendance_history_use_case.dart';
import 'package:demy_teachers/features/attendance/domain/usecases/get_students_use_case.dart';
import 'package:demy_teachers/features/attendance/presentation/blocs/attendance_report_event.dart';
import 'package:demy_teachers/features/attendance/presentation/blocs/attendance_report_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceReportBloc extends Bloc<AttendanceReportEvent, AttendanceReportState> {
  // Inyectamos los DOS casos de uso
  final GetStudentsUseCase getStudentsUseCase;
  final GetAttendanceHistoryUseCase getAttendanceHistoryUseCase; // <--- NUEVO

  List<AttendanceHistory> _allHistory = []; // Ahora usa la Entidad, no el DTO
  List<Student> _allStudents = [];

  AttendanceReportBloc({
    required this.getStudentsUseCase,
    required this.getAttendanceHistoryUseCase,
  }) : super(ReportInitial()) {
    on<LoadReportEvent>(_onLoadReport);
    on<FilterReportEvent>(_onFilterReport);
  }

  Future<void> _onLoadReport(LoadReportEvent event, Emitter<AttendanceReportState> emit) async {
    emit(ReportLoading());

    // 1. Llamamos a los UseCases
    final studentsResult = await getStudentsUseCase(0); 
    final historyResult = await getAttendanceHistoryUseCase(NoParams()); // <--- USANDO USECASE

    if (studentsResult.isLeft() || historyResult.isLeft()) {
      emit(ReportFailure("Error al cargar reporte"));
      return;
    }

    _allStudents = studentsResult.getOrElse(() => []);
    _allHistory = historyResult.getOrElse(() => []);

    // ... (El resto de la lógica de fechas y cálculo sigue igual que antes) ...
    final now = DateTime.now();
    final startDate = now.subtract(const Duration(days: 30));
    final endDate = now;
    final stats = _calculateStats(startDate, endDate);

    emit(ReportLoaded(stats: stats, startDate: startDate, endDate: endDate));
  }
  
  // ... _onFilterReport y _calculateStats (igual que antes) ...
  void _onFilterReport(FilterReportEvent event, Emitter<AttendanceReportState> emit) {
    // Si ya estamos cargados, solo recalculamos usando la memoria (_allHistory)
    if (state is ReportLoaded) {
      final stats = _calculateStats(event.startDate, event.endDate);
      
      emit(ReportLoaded(
        stats: stats,
        startDate: event.startDate,
        endDate: event.endDate,
      ));
    }
  }

  List<StudentStatistics> _calculateStats(DateTime start, DateTime end) {
    // Mapa auxiliar: DNI -> Contadores {total, present, absent, excused}
    final Map<String, Map<String, int>> counters = {};

    // 1. Inicializar mapa para todos los estudiantes (para que salgan aunque tengan 0 faltas)
    for (var s in _allStudents) {
      counters[s.dni] = {'total': 0, 'present': 0, 'absent': 0, 'excused': 0};
    }

    // 2. Recorrer historial y contar
    for (var record in _allHistory) {
      final recordDate = DateTime.parse(record.date);

      // Verificar si la fecha está dentro del rango seleccionado
      // (Usamos isAfter/isBefore ajustados o comparamos pure dates)
      if (recordDate.isAfter(start.subtract(const Duration(days: 1))) &&
          recordDate.isBefore(end.add(const Duration(days: 1)))) {
        
        for (var item in record.attendance) {
          if (counters.containsKey(item.dni)) {
            // Sumar al total de sesiones evaluadas
            counters[item.dni]!['total'] = (counters[item.dni]!['total'] ?? 0) + 1;

            // Sumar según estado
            if (item.status == 'PRESENT') {
              counters[item.dni]!['present'] = (counters[item.dni]!['present'] ?? 0) + 1;
            } else if (item.status == 'ABSENT') {
              counters[item.dni]!['absent'] = (counters[item.dni]!['absent'] ?? 0) + 1;
            } else if (item.status == 'EXCUSED' || item.status == 'LATE') {
              counters[item.dni]!['excused'] = (counters[item.dni]!['excused'] ?? 0) + 1;
            }
          }
        }
      }
    }

    // 3. Convertir el mapa a la lista de Entidades de Dominio
    return _allStudents.map((student) {
      final c = counters[student.dni]!;
      return StudentStatistics(
        student: student,
        totalSessions: c['total']!,
        presentCount: c['present']!,
        absentCount: c['absent']!,
        excusedCount: c['excused']!,
      );
    }).toList();
  }
}