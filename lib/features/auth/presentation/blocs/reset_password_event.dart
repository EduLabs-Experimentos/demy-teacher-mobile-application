import 'package:equatable/equatable.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();

  @override
  List<Object?> get props => [];
}

class RequestResetPasswordEvent extends ResetPasswordEvent {
  final String emailAddress;

  const RequestResetPasswordEvent(this.emailAddress);

  @override
  List<Object?> get props => [emailAddress];
}

class VerifyResetCodeEvent extends ResetPasswordEvent {
  final String emailAddress;
  final String code;

  const VerifyResetCodeEvent({
    required this.emailAddress,
    required this.code,
  });

  @override
  List<Object?> get props => [emailAddress, code];
}

class ResetPasswordSubmitEvent extends ResetPasswordEvent {
  final String emailAddress;
  final String password;
  final String confirmPassword;

  const ResetPasswordSubmitEvent({
    required this.emailAddress,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [emailAddress, password, confirmPassword];
}
