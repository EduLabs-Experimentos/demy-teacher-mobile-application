import 'package:demy_teachers/features/auth/domain/usecases/request_reset_password_use_case.dart';
import 'package:demy_teachers/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:demy_teachers/features/auth/domain/usecases/verify_reset_code_use_case.dart';
import 'package:demy_teachers/features/auth/presentation/blocs/reset_password_event.dart';
import 'package:demy_teachers/features/auth/presentation/blocs/reset_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final RequestResetPasswordUseCase requestResetPasswordUseCase;
  final VerifyResetCodeUseCase verifyResetCodeUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordBloc({
    required this.requestResetPasswordUseCase,
    required this.verifyResetCodeUseCase,
    required this.resetPasswordUseCase,
  }) : super(ResetPasswordInitial()) {
    on<RequestResetPasswordEvent>(_onRequestResetPassword);
    on<VerifyResetCodeEvent>(_onVerifyResetCode);
    on<ResetPasswordSubmitEvent>(_onResetPasswordSubmit);
  }

  Future<void> _onRequestResetPassword(
    RequestResetPasswordEvent event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(ResetPasswordLoading());

    final result = await requestResetPasswordUseCase(
      RequestResetPasswordParams(emailAddress: event.emailAddress),
    );

    result.fold(
      (failure) => emit(ResetPasswordFailure(failure.message)),
      (_) => emit(ResetPasswordCodeSent()),
    );
  }

  Future<void> _onVerifyResetCode(
    VerifyResetCodeEvent event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(ResetPasswordLoading());

    final result = await verifyResetCodeUseCase(
      VerifyResetCodeParams(emailAddress: event.emailAddress, code: event.code),
    );

    result.fold(
      (failure) => emit(ResetPasswordFailure(failure.message)),
      (_) => emit(ResetPasswordCodeVerified()),
    );
  }

  Future<void> _onResetPasswordSubmit(
    ResetPasswordSubmitEvent event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(ResetPasswordLoading());

    final result = await resetPasswordUseCase(
      ResetPasswordParams(
        emailAddress: event.emailAddress,
        password: event.password,
        confirmPassword: event.confirmPassword,
      ),
    );

    result.fold(
      (failure) => emit(ResetPasswordFailure(failure.message)),
      (user) => emit(ResetPasswordSuccess()),
    );
  }
}
