import 'package:demy_teachers/config/app_config.dart';
import 'package:demy_teachers/config/router/app_router.dart';
import 'package:demy_teachers/core/localization/i18n.dart';
import 'package:demy_teachers/core/theme/material_theme.dart';
import 'package:demy_teachers/core/theme/material_util.dart';
import 'package:flutter/material.dart';

class DemyTeachersApp extends StatelessWidget {
  final AppConfig config;

  const DemyTeachersApp({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final textTheme = createTextTheme(context, "Poppins", "Montserrat");
    final theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      title: 'Demy Teachers',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: ThemeMode.system,
      localizationsDelegates: I18n.localizationsDelegates,
      supportedLocales: I18n.supportedLocales,
    );
  }
}