import 'package:demy_teachers/features/profile/presentation/pages/profile_page.dart';
import 'package:demy_teachers/shared/widgets/main_scaffold.dart';
import 'package:go_router/go_router.dart';

final profileRoutes = [
  GoRoute(
    path: '/profile',
    name: 'profile',
    builder: (context, state) => const MainScaffold(
      currentIndex: 0,
      child: ProfilePage(),
    ),
  ),
];
