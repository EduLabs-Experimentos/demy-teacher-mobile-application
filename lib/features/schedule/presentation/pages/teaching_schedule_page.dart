import 'package:demy_teachers/core/localization/l10n/app_localizations.dart';
import 'package:demy_teachers/features/schedule/presentation/blocs/schedule_bloc.dart';
import 'package:demy_teachers/features/schedule/presentation/blocs/schedule_event.dart';
import 'package:demy_teachers/features/schedule/presentation/widgets/day_selection_bar.dart';
import 'package:demy_teachers/features/schedule/presentation/widgets/schedule_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';


class TeachingSchedulePage extends StatelessWidget {
  const TeachingSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primaryContainer;
    final t = AppLocalizations.of(context);

    return BlocProvider(
      create: (_) => GetIt.I<ScheduleBloc>()..add(ScheduleWeeklyScheduleRequested()),
      child: Scaffold(
        appBar: AppBar(
          
          backgroundColor: primaryColor,
          elevation: 4, // Añadir sombra ligera
          centerTitle: true,
          
          // Título blanco
          title: Text(
            t.teachingScheduleTitle,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          
          // Botón de retroceso al Home
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              context.go('/home');
            },
          ),
        ),
        
        body: const Column(
          children: [
            DaySelectionBar(),
            Expanded(
              child: ScheduleBody(),
            ),
          ],
        ),
      ),
    );
  }
}