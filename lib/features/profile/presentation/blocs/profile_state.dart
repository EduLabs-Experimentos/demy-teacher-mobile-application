import 'package:demy_teachers/features/profile/domain/entities/teacher.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Teacher teacher;

  const ProfileLoaded(this.teacher);

  @override
  List<Object?> get props => [teacher];
}

class ProfileFailure extends ProfileState {
  final String errorMessage;

  const ProfileFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}