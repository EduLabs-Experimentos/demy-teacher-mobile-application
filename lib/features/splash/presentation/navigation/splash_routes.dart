import 'package:demy_teachers/features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

final splashRoutes = [
  GoRoute(
    path: '/splash',
    name: 'splash',
    builder: (context, state) => const SplashPage(),
  ),
];