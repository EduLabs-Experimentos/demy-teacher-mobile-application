import 'package:demy_teachers/features/schedule/domain/usecases/reschedule_class_session_use_case.dart';
import 'package:demy_teachers/features/schedule/presentation/blocs/reschedule_event.dart';
import 'package:demy_teachers/features/schedule/presentation/blocs/reschedule_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RescheduleBloc extends Bloc<RescheduleEvent, RescheduleState> {
  final RescheduleClassSession rescheduleUseCase;

  RescheduleBloc(this.rescheduleUseCase) : super(RescheduleInitial()) {
    on<SubmitReschedule>((event, emit) async {
      emit(RescheduleLoading());
      final result = await rescheduleUseCase(RescheduleParams(
        sessionId: event.sessionId,
        classroomId: event.classroomId,
        startTime: event.startTime,
        endTime: event.endTime,
        dayOfWeek: event.dayOfWeek,
      ));

      result.fold(
        (failure) => emit(RescheduleFailure(failure.message)),
        (_) => emit(RescheduleSuccess()),
      );
    });
  }
}