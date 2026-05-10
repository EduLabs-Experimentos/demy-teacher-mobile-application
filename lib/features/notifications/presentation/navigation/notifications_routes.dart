import 'package:demy_teachers/features/notifications/presentation/pages/notifications_page.dart';
import 'package:go_router/go_router.dart';

final List<GoRoute> notificationsRoutes = [
  GoRoute(
    path: '/notifications',
    name: 'notifications',
    builder: (context, state) => const NotificationsPage(),
  ),
];
