class AttendanceRecordLog {
  final String dni;
  final String status;
  AttendanceRecordLog({required this.dni, required this.status});
}

class AttendanceHistory {
  final int id;
  final int classSessionId;
  final String date;
  final List<AttendanceRecordLog> attendance;

  AttendanceHistory({
    required this.id, 
    required this.classSessionId, 
    required this.date, 
    required this.attendance
  });
}