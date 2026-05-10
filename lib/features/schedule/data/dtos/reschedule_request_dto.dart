class RescheduleRequestDto {
  final int classroomId;
  final String startTime; // Formato HH:mm:ss
  final String endTime;   // Formato HH:mm:ss
  final String dayOfWeek; // "MONDAY", etc.

  RescheduleRequestDto({
    required this.classroomId,
    required this.startTime,
    required this.endTime,
    required this.dayOfWeek,
  });

  Map<String, dynamic> toJson() => {
    "classroomId": classroomId,
    "startTime": startTime,
    "endTime": endTime,
    "dayOfWeek": dayOfWeek,
  };
}