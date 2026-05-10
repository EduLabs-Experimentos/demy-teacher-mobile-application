import 'package:demy_teachers/features/attendance/presentation/navigation/attendance_routes.dart';
import 'package:demy_teachers/features/auth/presentation/navigation/auth_routes.dart';
import 'package:demy_teachers/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:demy_teachers/features/auth/presentation/pages/reset_password_page.dart';
import 'package:demy_teachers/features/auth/presentation/pages/reset_password_success_page.dart';
import 'package:demy_teachers/features/auth/presentation/pages/verify_reset_code_page.dart';
import 'package:demy_teachers/features/home/presentation/pages/home_page.dart';
import 'package:demy_teachers/features/notifications/presentation/navigation/notifications_routes.dart';
import 'package:demy_teachers/features/profile/presentation/pages/profile_page.dart';
import 'package:demy_teachers/features/settings/presentation/pages/settings_page.dart';
import 'package:demy_teachers/features/splash/presentation/navigation/splash_routes.dart';
import 'package:demy_teachers/shared/widgets/bottom_navigation_bar_widget.dart';
import 'package:demy_teachers/features/schedule/presentation/navigation/schedule_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    ...splashRoutes,
    ...authRoutes,
    ...scheduleRoutes,
    ...attendanceRoutes,
    ...notificationsRoutes,


    GoRoute(
      path: '/forgot-password',
      name: 'forgot-password',
      builder: (context, state) => const ForgotPasswordPage(),
    ),

    GoRoute(
      path: '/verify-reset-code',
      name: 'verify-reset-code',
      builder: (context, state) {
        final Map<String, dynamic> args = state.extra as Map<String, dynamic>;
        return VerifyResetCodePage(
          emailAddress: args['emailAddress'] as String,
        );
      },
    ),

    GoRoute(
      path: '/reset-password',
      name: 'reset-password',
      builder: (context, state) {
        final Map<String, dynamic> args = state.extra as Map<String, dynamic>;
        return ResetPasswordPage(
          emailAddress: args['emailAddress'] as String,
        );
      },
    ),

    GoRoute(
      path: '/reset-password-success',
      name: 'reset-password-success',
      builder: (context, state) => const ResetPasswordSuccessPage(),
    ),

    // --- Aquí empieza el Menú con BottomNavigationBar ---
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
          return Scaffold(
            body: navigationShell,
            bottomNavigationBar: BottomNavigationBarWidget(
              currentIndex: navigationShell.currentIndex,
              onTap: (index) => navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              ),
            ),
          );
      },

      branches: [
        // Rama Perfil
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
        // Rama Home
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              name: 'home',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        // Rama Settings
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              name: 'settings',
              builder: (context, state) => const SettingsPage(),

              routes: [], 
            ),
          ],
        ),
      ],
    ),
  ],
);