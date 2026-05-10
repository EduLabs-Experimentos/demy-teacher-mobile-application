class AttendanceHistoryDto {
  final int id;
  final int classSessionId;
  final String date;
  final List<AttendanceRecordDto> attendance;

  AttendanceHistoryDto({required this.id, required this.classSessionId, required this.date, required this.attendance});

  factory AttendanceHistoryDto.fromJson(Map<String, dynamic> json) {
    return AttendanceHistoryDto(
      id: json['id'],
      classSessionId: json['classSessionId'],
      date: json['date'],
      attendance: (json['attendance'] as List).map((e) => AttendanceRecordDto.fromJson(e)).toList(),
    );
  }
}

class AttendanceRecordDto {
  final String dni;
  final String status; // "PRESENT", "ABSENT", "EXCUSED"

  AttendanceRecordDto({required this.dni, required this.status});

  factory AttendanceRecordDto.fromJson(Map<String, dynamic> json) {
    return AttendanceRecordDto(
      dni: json['dni'],
      status: json['status'],
    );
  }
}