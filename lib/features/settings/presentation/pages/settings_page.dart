import 'package:demy_teachers/core/di/injection.dart';
import 'package:demy_teachers/core/localization/l10n/app_localizations.dart';
import 'package:demy_teachers/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:demy_teachers/features/auth/presentation/blocs/auth_event.dart';
import 'package:demy_teachers/features/auth/presentation/blocs/auth_state.dart';
import 'package:demy_teachers/features/settings/presentation/pages/privacy_policy_page.dart';
import 'package:demy_teachers/features/settings/presentation/pages/terms_and_conditions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSignedOut) {
            context.go('/sign-in');
          }
        },
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              // Header azul fijo (similar a Profile y Home)
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  color: colorScheme.primaryContainer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      Text(
                        loc.settingsPageTitle,
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

              // Contenido: botones de configuración
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
                  child: Column(
                    children: [
                      // Botón: Términos y Condiciones
                      _SettingsButton(
                        icon: Icons.description_outlined,
                        title: loc.termsAndConditions,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const TermsAndConditionsPage(),
                            ),
                          );
                        },
                        showTrailingArrow: true,
                      ),
                      const SizedBox(height: 12),

                      // Botón: Política de Privacidad
                      _SettingsButton(
                        icon: Icons.privacy_tip_outlined,
                        title: loc.privacyPolicy,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const PrivacyPolicyPage(),
                            ),
                          );
                        },
                        showTrailingArrow: true,
                      ),
                      const SizedBox(height: 12),

                      // Botón: Cerrar Sesión (rojo)
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          final isLoading = state is AuthLoading;

                          return _SettingsButton(
                            icon: Icons.logout,
                            title: loc.signOut,
                            onTap: isLoading
                                ? null
                                : () {
                                    _showSignOutDialog(context, loc);
                                  },
                            showTrailingArrow: false,
                            isDestructive: true,
                            isLoading: isLoading,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSignOutDialog(BuildContext context, AppLocalizations loc) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(loc.signOut),
        content: Text('¿Estás seguro de que deseas cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<AuthBloc>().add(const AuthSignOutRequested());
            },
            child: Text(
              loc.signOut,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final bool showTrailingArrow;
  final bool isDestructive;
  final bool isLoading;

  const _SettingsButton({
    required this.icon,
    required this.title,
    this.onTap,
    this.showTrailingArrow = false,
    this.isDestructive = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = isDestructive ? Colors.red : colorScheme.onSurface;
    final iconColor = isDestructive ? Colors.red : colorScheme.primary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDestructive
                  ? Colors.red.withValues(alpha: 0.3)
                  : colorScheme.outlineVariant.withValues(alpha: 0.2),
              width: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              if (isLoading)
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: iconColor,
                  ),
                )
              else if (showTrailingArrow)
                Icon(
                  Icons.chevron_right,
                  color: colorScheme.onSurface.withValues(alpha: 0.4),
                  size: 24,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
