import 'package:demy_teachers/config/app_config.dart';
import 'package:demy_teachers/config/logger/logger_config.dart';
import 'package:demy_teachers/core/di/injection.dart';
import 'package:demy_teachers/demy_teachers_app.dart';
import 'package:demy_teachers/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:demy_teachers/features/profile/presentation/blocs/profile_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  final config = getIt<AppConfig>();

  LoggerConfig.init(enableLogging: config.enableLogging);
  LoggerConfig.log('Running Demy Teachers on environment: ${config.label}');
  LoggerConfig.log('Base URL: ${config.baseUrl}');

  runApp(
    MultiBlocProvider(
      providers: [
        // Add global Blocroviders here if needed
        BlocProvider<ProfileBloc>(
          // Usamos getIt para crear el Bloc (él ya sabe resolver las dependencias/UseCases)
          // Y lanzamos el evento INMEDIATAMENTE con '..add'
          create: (_) => getIt<ProfileBloc>() ..add(LoadProfileRequested())
        )
      ],
      child: DemyTeachersApp(config: config),
    ),
  ); 
}