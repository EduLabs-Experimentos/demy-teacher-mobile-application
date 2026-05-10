import 'package:demy_teachers/features/splash/presentation/blocs/splash_bloc.dart';
import 'package:demy_teachers/features/splash/presentation/blocs/splash_event.dart';
import 'package:demy_teachers/features/splash/presentation/blocs/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primaryContainer,
      body: SafeArea(
        child: BlocProvider(
          create: (_) => GetIt.I<SplashBloc>()..add(SplashStarted()),
          child: BlocListener<SplashBloc, SplashState>(
            listener: (context, state) {
              if (state is SplashNavigateToLogin) {
                context.go('/sign-in');
              } else if (state is SplashNavigateToHome) {
                context.go('/home');
              }
            },
            child: const _SplashView(),
          ),
        ),
      ),
    );
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/demy_brand_mark_white.png',
            width: 120,
            height: 120,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 32),
          const CircularProgressIndicator(color: Colors.white),
        ],
      ),
    );
  }
}