import 'package:demy_teachers/features/attendance/presentation/pages/take_attendance_page.dart';
import 'package:go_router/go_router.dart';
import 'package:demy_teachers/features/attendance/presentation/pages/attendance_report_page.dart';
// Importa también tu TakeAttendancePage si la tienes

final attendanceRoutes = [
  GoRoute(
    path: '/attendance-report', 
    name: 'attendance_report',
    builder: (context, state) => const AttendanceReportPage(),
  ),

  GoRoute(
    path: '/take-attendance',
    name: 'take_attendance',
    builder: (context, state) {
      final Map<String, dynamic> args = state.extra as Map<String, dynamic>;
      return TakeAttendancePage(
        classSessionId: args['sessionId'] as int,
        courseName: args['courseName'] as String,
      );
    },
  )
];