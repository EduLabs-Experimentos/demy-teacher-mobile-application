import 'package:demy_teachers/features/attendance/domain/entities/student.dart';
import 'package:demy_teachers/features/attendance/domain/usecases/get_students_use_case.dart';
import 'package:demy_teachers/features/attendance/presentation/blocs/attendance_event.dart';
import 'package:demy_teachers/features/attendance/presentation/blocs/attendance_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final GetStudentsUseCase getStudentsUseCase;
  final RegisterAttendanceUseCase registerAttendanceUseCase;

  AttendanceBloc(this.getStudentsUseCase, this.registerAttendanceUseCase) : super(AttendanceInitial()) {
    on<LoadStudentsEvent>(_onLoadStudents);
    on<ToggleStudentStatusEvent>(_onToggleStatus);
    on<SubmitAttendanceEvent>(_onSubmit);
  }

  Future<void> _onLoadStudents(LoadStudentsEvent event, Emitter<AttendanceState> emit) async {
    emit(AttendanceLoading());
    final result = await getStudentsUseCase(event.classSessionId);
    
    result.fold(
      (failure) => emit(AttendanceFailure(failure.message)),
      (students) {
        // Inicializamos a todos con 'Present' por defecto o 'None'
        final attendanceList = students.map((s) => StudentAttendance(
          student: s, 
          status: AttendanceStatus.present // Default
        )).toList();
        
        emit(AttendanceLoaded(classSessionId: event.classSessionId, students: attendanceList));
      }
    );
  }

  void _onToggleStatus(ToggleStudentStatusEvent event, Emitter<AttendanceState> emit) {
    if (state is AttendanceLoaded) {
      final currentState = state as AttendanceLoaded;
      
      // Creamos una nueva lista actualizando el item específico
      final updatedList = currentState.students.map((item) {
        if (item.student.dni == event.studentDni) {
          return StudentAttendance(student: item.student, status: event.newStatus);
        }
        return item;
      }).toList();

      emit(currentState.copyWith(students: updatedList));
    }
  }

  Future<void> _onSubmit(SubmitAttendanceEvent event, Emitter<AttendanceState> emit) async {
    if (state is AttendanceLoaded) {
      final currentState = state as AttendanceLoaded;
      emit(AttendanceLoading());

      final dateStr = "${event.date.year}-${event.date.month.toString().padLeft(2,'0')}-${event.date.day.toString().padLeft(2,'0')}";

      final result = await registerAttendanceUseCase(
        RegisterAttendanceParams(currentState.classSessionId, dateStr, currentState.students)
      );

      result.fold(
        (failure) {
          emit(currentState.copyWith(
            errorMessage: failure.message
          ));
        },
        (_) => emit(AttendanceSuccess()),
      );
    }
  }
}