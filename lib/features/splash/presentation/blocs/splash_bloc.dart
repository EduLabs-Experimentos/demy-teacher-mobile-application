import 'package:demy_teachers/features/auth/domain/repositories/auth_repository.dart';
import 'package:demy_teachers/features/splash/presentation/blocs/splash_event.dart';
import 'package:demy_teachers/features/splash/presentation/blocs/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthRepository repository;

  SplashBloc(this.repository) : super(SplashInitial()) {
    on<SplashStarted>(_onStarted);
  }

  Future<void> _onStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    emit(SplashLoading());
    await Future.delayed(const Duration(seconds: 2));
    final cachedUser = await repository.getCachedUserEntity();
    if (cachedUser != null) {
      emit(SplashNavigateToHome());
    } else {
      emit(SplashNavigateToLogin());
    }
  }
}