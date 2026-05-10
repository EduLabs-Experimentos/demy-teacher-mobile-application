import 'package:demy_teachers/core/di/injection.dart';
import 'package:demy_teachers/core/localization/l10n/app_localizations.dart';
import 'package:demy_teachers/features/auth/presentation/blocs/reset_password_bloc.dart';
import 'package:demy_teachers/features/auth/presentation/blocs/reset_password_event.dart';
import 'package:demy_teachers/features/auth/presentation/blocs/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerifyResetCodePage extends StatefulWidget {
  final String emailAddress;

  const VerifyResetCodePage({
    super.key,
    required this.emailAddress,
  });

  @override
  State<VerifyResetCodePage> createState() => _VerifyResetCodePageState();
}

class _VerifyResetCodePageState extends State<VerifyResetCodePage> {
  final _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (context) => getIt<ResetPasswordBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(loc.verifyResetCodeTitle),
          centerTitle: true,
        ),
        body: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordCodeVerified) {
              context.pushReplacementNamed(
                'reset-password',
                extra: {'emailAddress': widget.emailAddress},
              );
            } else if (state is ResetPasswordFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          builder: (context, state) {
            final isLoading = state is ResetPasswordLoading;

            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 24),
                    Icon(
                      Icons.email_outlined,
                      size: 80,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      loc.verifyResetCodeTitle,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      loc.verifyResetCodeDescription,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface.withOpacity(0.7),
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      controller: _codeController,
                      decoration: InputDecoration(
                        labelText: loc.verificationCodeLabel,
                        hintText: loc.verificationCodeHint,
                        prefixIcon: const Icon(Icons.lock_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return loc.verificationCodeRequired;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              if (_formKey.currentState?.validate() ?? false) {
                                context.read<ResetPasswordBloc>().add(
                                      VerifyResetCodeEvent(
                                        emailAddress: widget.emailAddress,
                                        code: _codeController.text,
                                      ),
                                    );
                              }
                            },
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(loc.verifyCodeButton),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
