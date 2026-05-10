class CreateAttendanceRequestDto {
  final int classSessionId;
  final String date; // Format YYYY-MM-DD
  final List<AttendanceItemDto> attendance;

  CreateAttendanceRequestDto({
    required this.classSessionId,
    required this.date,
    required this.attendance,
  });

  Map<String, dynamic> toJson() => {
    "classSessionId": classSessionId,
    "date": date,
    "attendance": attendance.map((e) => e.toJson()).toList(),
  };
}

class AttendanceItemDto {
  final String dni;
  final String status;

  AttendanceItemDto({required this.dni, required this.status});

  Map<String, dynamic> toJson() => {
    "dni": dni,
    "status": status,
  };
}