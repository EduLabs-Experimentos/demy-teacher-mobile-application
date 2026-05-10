import 'package:demy_teachers/features/schedule/domain/entities/class_session.dart';
import 'package:equatable/equatable.dart';

abstract class ScheduleState extends Equatable {
  const ScheduleState();

  @override
  List<Object> get props => [];
}

class ScheduleInitial extends ScheduleState {}

class ScheduleLoading extends ScheduleState {}

class ScheduleLoaded extends ScheduleState {
  final List<ClassSession> allSessions; 
  final List<ClassSession> dailySessions; 
  final String selectedDay;

  const ScheduleLoaded({
    required this.allSessions,
    required this.dailySessions,
    required this.selectedDay,
  });

  @override
  List<Object> get props => [allSessions, dailySessions, selectedDay];

  ScheduleLoaded copyWith({
    List<ClassSession>? allSessions, 
    List<ClassSession>? dailySessions, 
    String? selectedDay,
  }) {
    return ScheduleLoaded(
      allSessions: allSessions ?? this.allSessions,
      dailySessions: dailySessions ?? this.dailySessions,
      selectedDay: selectedDay ?? this.selectedDay,
    );
  }
}


class ScheduleFailure extends ScheduleState {
  final String message;

  const ScheduleFailure(this.message);

  @override
  List<Object> get props => [message];
}