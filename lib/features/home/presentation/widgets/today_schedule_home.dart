  import 'package:demy_teachers/core/localization/l10n/app_localizations.dart';
  import 'package:demy_teachers/features/home/presentation/widgets/section_action_modal.dart';
  import 'package:demy_teachers/features/schedule/presentation/blocs/schedule_bloc.dart';
  import 'package:demy_teachers/features/schedule/presentation/blocs/schedule_event.dart';
  import 'package:demy_teachers/features/schedule/presentation/blocs/schedule_state.dart';
  import 'package:demy_teachers/features/schedule/domain/entities/class_session.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:get_it/get_it.dart';
  import 'package:intl/intl.dart';

  // Helper Widget para la tarjeta de horario
  class _SimpleHomeScheduleCard extends StatelessWidget {
    final ClassSession session;
    final Color cardColor;

    const _SimpleHomeScheduleCard({
      required this.session,
      required this.cardColor,
    });

    @override
    Widget build(BuildContext context) {
      final colorScheme = Theme.of(context).colorScheme;
      final t = AppLocalizations.of(context)!;

  
      final now = DateTime.now();
      final date = now.day.toString();
      final month = DateFormat('MMM', Localizations.localeOf(context).languageCode).format(now);

      return Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Material(
            color: Colors.transparent, 
            child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Lógica para abrir el modal
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent, 
              builder: (context) => SessionActionModal(session: session),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(8.0), 
            decoration: BoxDecoration(
              color: colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(16),
            ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60, 
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(date, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                    // Mes actual (Ej: Nov)
                    Text(month, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white)),],
                ),
              ),
              const SizedBox(width: 12),
              // Detalles de la Clase
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título del Curso (más grande, color primario)
                    Text(
                      session.course.name,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold, 
                        color: colorScheme.primary
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 16, color: colorScheme.onSurfaceVariant),
                        const SizedBox(width: 4),
                        Text('${session.startTime} – ${session.endTime}', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: colorScheme.onSurface)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 16, color: colorScheme.onSurfaceVariant),
                        const SizedBox(width: 4),
                        Text(session.classroom.campus, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: colorScheme.onSurface)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
          ),
        ),
        ),
      );
    }
  }

  class TodayScheduleHome extends StatelessWidget {
    const TodayScheduleHome({super.key});

    @override
    Widget build(BuildContext context) {

      return BlocProvider(
        create: (_) => GetIt.I<ScheduleBloc>()..add(ScheduleWeeklyScheduleRequested()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<ScheduleBloc, ScheduleState>(
            builder: (context, state) {
              if (state is ScheduleLoading || state is ScheduleInitial) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ScheduleFailure) {
                return Center(child: Text('Error al cargar el horario: ${state.message}'));
              }
              if (state is ScheduleLoaded) {
                
                final sessionsToShow = state.dailySessions; 

                if (sessionsToShow.isEmpty) {
                  return Center(child: Text('No hay clases programadas para hoy.'));
                }
                
                
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: sessionsToShow.map((session) {
                    
                    final index = sessionsToShow.indexOf(session);
                    final color = index.isEven 
                        ? Theme.of(context).colorScheme.primary 
                        : Theme.of(context).colorScheme.secondaryContainer; 
                    
                    return _SimpleHomeScheduleCard(
                      session: session,
                      cardColor: color, 
                    );
                  }).toList(),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    }
  }