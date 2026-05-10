abstract class RescheduleEvent {}
class SubmitReschedule extends RescheduleEvent {
  final int sessionId;
  final int classroomId;
  final String startTime;
  final String endTime;
  final String dayOfWeek;
  
  SubmitReschedule({required this.sessionId, required this.classroomId, required this.startTime, required this.endTime, required this.dayOfWeek});
}