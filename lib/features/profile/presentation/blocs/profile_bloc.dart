import 'package:demy_teachers/features/profile/domain/usecases/get_current_teacher.dart';
import 'package:demy_teachers/features/profile/presentation/blocs/profile_event.dart';
import 'package:demy_teachers/features/profile/presentation/blocs/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demy_teachers/core/usecases/usecase.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetCurrentTeacherUseCase getCurrentTeacher;

  ProfileBloc({
    required this.getCurrentTeacher,
  }) : super(ProfileInitial()) {
    on<LoadProfileRequested>(_onLoadProfileRequested);
  }

  Future<void> _onLoadProfileRequested(
    LoadProfileRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());

    final result = await getCurrentTeacher(NoParams());

    result.fold(
      (failure) => emit(ProfileFailure(failure.message)),
      (teacher) => emit(ProfileLoaded(teacher)),
    );
  }
}