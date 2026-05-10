import 'package:demy_teachers/core/di/injection.dart';
import 'package:demy_teachers/core/localization/l10n/app_localizations.dart';
import 'package:demy_teachers/features/auth/presentation/blocs/reset_password_bloc.dart';
import 'package:demy_teachers/features/auth/presentation/blocs/reset_password_event.dart';
import 'package:demy_teachers/features/auth/presentation/blocs/reset_password_state.dart';
import 'package:demy_teachers/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:demy_teachers/features/profile/presentation/blocs/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header azul fijo (similar a Home)
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              color: colorScheme.primaryContainer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    loc.profilePageTitle,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),

          // Contenido: tarjeta con datos del perfil
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: colorScheme.outlineVariant.withOpacity(0.2),
                    width: 1.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.shadow.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is ProfileLoading || state is ProfileInitial) {
                        return SizedBox(
                          height: 120,
                          child: Center(child: CircularProgressIndicator(color: colorScheme.primary)),
                        );
                      }

                      if (state is ProfileFailure) {
                        return SizedBox(
                          height: 120,
                          child: Center(
                            child: Text(state.errorMessage, style: Theme.of(context).textTheme.bodyMedium),
                          ),
                        );
                      }

                      // ProfileLoaded
                      final teacher = (state as ProfileLoaded).teacher;

                      return Row(
                        children: [
                          // Datos a la izquierda
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${loc.welcome}',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withOpacity(0.6)),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  teacher.fullName,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 12),

                                // Email
                                Text(
                                  '${loc.email}:',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withOpacity(0.6)),
                                ),
                                Text(
                                  teacher.emailAddress,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(height: 8),

                                // Phone
                                Text(
                                  '${loc.phoneNumberLabel}:',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withOpacity(0.6)),
                                ),
                                Text(
                                  teacher.phoneNumber,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),

                          // Foto circular a la derecha
                          const SizedBox(width: 12),
                          const CircleAvatar(
                            radius: 44,
                            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=1'),
                            backgroundColor: Colors.white,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

          // Botón de restablecer contraseña
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (context) => getIt<ResetPasswordBloc>(),
              child: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
                listener: (context, state) {
                  if (state is ResetPasswordCodeSent) {
                    final profileState = context.read<ProfileBloc>().state;
                    if (profileState is ProfileLoaded) {
                      context.pushNamed(
                        'verify-reset-code',
                        extra: {'emailAddress': profileState.teacher.emailAddress},
                      );
                    }
                  } else if (state is ResetPasswordFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)),
                    );
                  }
                },
                builder: (context, state) {
                  final isLoading = state is ResetPasswordLoading;
                  
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: OutlinedButton.icon(
                      onPressed: isLoading
                          ? null
                          : () {
                              final profileState = context.read<ProfileBloc>().state;
                              if (profileState is ProfileLoaded) {
                                context.read<ResetPasswordBloc>().add(
                                      RequestResetPasswordEvent(
                                        profileState.teacher.emailAddress,
                                      ),
                                    );
                              }
                            },
                      icon: isLoading
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: colorScheme.primary,
                              ),
                            )
                          : Icon(Icons.lock_reset, color: colorScheme.primary),
                      label: Text(
                        loc.resetPasswordButton,
                        style: TextStyle(color: colorScheme.primary),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(color: colorScheme.primary),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
