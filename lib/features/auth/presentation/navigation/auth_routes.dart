import 'package:demy_teachers/features/auth/presentation/pages/sign_in_page.dart';
import 'package:go_router/go_router.dart';

final authRoutes = [
  GoRoute(
    path: '/sign-in',
    name: 'sign-in',
    builder: (context, state) => const SignInPage(),
  )
];