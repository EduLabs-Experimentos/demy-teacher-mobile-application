import 'package:demy_teachers/features/schedule/domain/entities/class_session.dart';
import 'package:demy_teachers/features/schedule/presentation/pages/teaching_reschedule_page.dart';
import 'package:demy_teachers/features/schedule/presentation/pages/teaching_schedule_page.dart';
import 'package:go_router/go_router.dart';

final List<GoRoute> scheduleRoutes = [
  GoRoute(
    path: '/teaching-schedule',
    name: 'teaching_schedule', 
    builder: (context, state) => const TeachingSchedulePage(),
  ),
  GoRoute(
    path: '/reschedule/:sessionId', // Definimos el parámetro dinámico
    name: 'reschedule',             // Le damos un nombre para usarlo fácil
    builder: (context, state) {
      // 1. Extraemos el ID que viene en la URL 
      final session = state.extra as ClassSession; 
      return TeachingReschedulePage(session: session);
      },
  ),
];