abstract class RescheduleState {}
class RescheduleInitial extends RescheduleState {}
class RescheduleLoading extends RescheduleState {}
class RescheduleSuccess extends RescheduleState {}
class RescheduleFailure extends RescheduleState {
  final String message;
  RescheduleFailure(this.message);
}