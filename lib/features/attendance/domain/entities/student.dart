class Student {
  final String dni;
  final String fullName;
  final String photoUrl; // Para el UI

  const Student({
    required this.dni, 
    required this.fullName,
    this.photoUrl = '', 
  });
}

// Una entidad auxiliar para manejar el estado en la UI antes de enviar
enum AttendanceStatus { present, absent, excused, none }

class StudentAttendance {
  final Student student;
  AttendanceStatus status;

  StudentAttendance({required this.student, this.status = AttendanceStatus.none});
}