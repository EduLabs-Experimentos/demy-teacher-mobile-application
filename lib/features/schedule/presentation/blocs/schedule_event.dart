import 'package:equatable/equatable.dart';

abstract class ScheduleEvent extends Equatable {
  const ScheduleEvent();

  @override
  List<Object> get props => [];
}

class ScheduleWeeklyScheduleRequested extends ScheduleEvent {}

class ScheduleDayChanged extends ScheduleEvent {
  final String day; 

  const ScheduleDayChanged(this.day);

  @override
  List<Object> get props => [day];
}