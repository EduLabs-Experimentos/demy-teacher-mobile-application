import 'package:demy_teachers/features/attendance/presentation/pages/attendance_report_page.dart';
import 'package:demy_teachers/features/home/presentation/pages/home_page.dart';
import 'package:demy_teachers/shared/widgets/main_scaffold.dart';
import 'package:go_router/go_router.dart';

final homeRoutes = [
  GoRoute(
    path: '/home',
    name: 'home',
    builder: (context, state) => const MainScaffold(
      currentIndex: 1,
      child: HomePage(),
    ),
  ),
  // En tu router

];