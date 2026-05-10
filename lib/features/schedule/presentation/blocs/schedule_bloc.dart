import 'package:demy_teachers/core/usecases/usecase.dart';
import 'package:demy_teachers/features/schedule/domain/entities/class_session.dart';
import 'package:demy_teachers/features/schedule/domain/usecases/get_schedule_for_teacher_use_case.dart';
import 'package:demy_teachers/features/schedule/presentation/blocs/schedule_event.dart';
import 'package:demy_teachers/features/schedule/presentation/blocs/schedule_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final GetScheduleForTeacher getScheduleForTeacher;

  ScheduleBloc(this.getScheduleForTeacher) : super(ScheduleInitial()) {
    on<ScheduleWeeklyScheduleRequested>(_onScheduleRequested);
    on<ScheduleDayChanged>(_onDayChanged);
  }

  String _getCurrentDayShortName() {
    final now = DateTime.now();
    final dayOfWeek = now.weekday; 

    const shortNames = [
        'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'
    ];
    
    return shortNames[dayOfWeek - 1]; 
  }

  List<ClassSession> _filterSessionsByDay(List<ClassSession> sessions, String day) {
    final dayNames = {
        'Sun': 'Sunday', 'Mon': 'Monday', 'Tue': 'Tuesday', 
        'Wed': 'Wednesday', 'Thu': 'Thursday', 'Fri': 'Friday', 'Sat': 'Saturday'
    };
    final apiDay = dayNames[day] ?? day; 

    return sessions.where((item) => item.dayOfWeek.toLowerCase() == apiDay.toLowerCase()).toList();
  }

  Future<void> _onScheduleRequested(
    ScheduleWeeklyScheduleRequested event,
    Emitter<ScheduleState> emit,
  ) async {
    emit(ScheduleLoading());
    
    final result = await getScheduleForTeacher(NoParams());

    result.fold(
      (failure) => emit(ScheduleFailure(failure.message)),
      (allSessions) {
        final initialDay = _getCurrentDayShortName();
        final dailySessions = _filterSessionsByDay(allSessions, initialDay);
        
        emit(ScheduleLoaded(
          allSessions: allSessions,
          dailySessions: dailySessions,
          selectedDay: initialDay,
        ));
      },
    );
  }

  void _onDayChanged(
    ScheduleDayChanged event,
    Emitter<ScheduleState> emit,
  ) {
    final currentState = state;
    if (currentState is ScheduleLoaded) {
      final newDailySessions = _filterSessionsByDay(currentState.allSessions, event.day);
      
      emit(currentState.copyWith(
        dailySessions: newDailySessions,
        selectedDay: event.day,
      ));
    }
  }
}