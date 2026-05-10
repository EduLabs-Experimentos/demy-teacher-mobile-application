import 'package:demy_teachers/core/localization/l10n/app_localizations.dart';
import 'package:demy_teachers/features/schedule/domain/entities/class_session.dart';
import 'package:demy_teachers/features/schedule/presentation/blocs/reschedule_bloc.dart';
import 'package:demy_teachers/features/schedule/presentation/blocs/reschedule_event.dart';
import 'package:demy_teachers/features/schedule/presentation/blocs/reschedule_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class TeachingReschedulePage extends StatefulWidget {
  final ClassSession session;

  const TeachingReschedulePage({super.key, required this.session});
  
  @override
  State<TeachingReschedulePage> createState() => _TeachingReschedulePageState();
}

class _TeachingReschedulePageState extends State<TeachingReschedulePage> {
  
  late TimeOfDay startTime;
  late TimeOfDay endTime;
  late String selectedDay;
  
  // NUEVOS: Almacenar los valores originales de TimeOfDay (calculados una sola vez)
  late final TimeOfDay originalStartTime;
  late final TimeOfDay originalEndTime;
  
  // Lista de días en inglés para la API
  final List<String> daysOfWeekApi = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  @override
  void initState() {
    super.initState();
    
    // 1. Calcular y almacenar los objetos TimeOfDay originales
    originalStartTime = _parseTimeString(widget.session.startTime);
    startTime = originalStartTime;

    originalEndTime = _parseTimeString(widget.session.endTime);
    endTime = originalEndTime;
    
    selectedDay = widget.session.dayOfWeek;
  }

  // Helper para convertir "18:00:00" -> TimeOfDay(18, 0)
  TimeOfDay _parseTimeString(String timeString) {
    try {
      final parts = timeString.split(':');
      return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
    } catch (e) {
      return const TimeOfDay(hour: 0, minute: 0); // Fallback por seguridad
    }
  }

  // Lógica para saber si el usuario modificó algo
  bool get _hasChanges {
    // CORRECCIÓN: Compara el estado actual con las instancias originales almacenadas.
    return startTime != originalStartTime ||
           endTime != originalEndTime ||
           selectedDay != widget.session.dayOfWeek;
  }

  // --- LÓGICA DEL TIME PICKER (Dial) ---
  Future<void> _pickTime({required bool isStartTime}) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? startTime : endTime,
      builder: (context, child) {
        // Utilizamos el tema por defecto del TimePicker (flotante)
        return Theme(
          data: Theme.of(context).copyWith(
            timePickerTheme: TimePickerThemeData(
              dialHandColor: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isStartTime) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  // --- LÓGICA DEL DAY PICKER (SimpleDialog) ---
  Future<void> _pickDay(BuildContext context) async {
    final t = AppLocalizations.of(context);
    final daysTranslated = [
      t.monday,
      t.tuesday,
      t.wednesday,
      t.thursday,
      t.friday,
      t.saturday,
      t.sunday,
    ];

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(t.selectDay),
          children: List.generate(daysOfWeekApi.length, (index) {
            final dayApi = daysOfWeekApi[index];
            final dayDisplay = daysTranslated[index];
            
            return SimpleDialogOption(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              onPressed: () {
                setState(() {
                  selectedDay = dayApi;
                });
                Navigator.pop(context); // Cerrar el diálogo
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(dayDisplay, style: const TextStyle(fontSize: 16)),
                  if (selectedDay == dayApi)
                    Icon(Icons.check, color: Theme.of(context).colorScheme.primary, size: 20),
                ],
              ),
            );
          }),
        );
      },
    );
  }
  
  // --- LÓGICA: Diálogo de Confirmación ---
  Future<bool> _showConfirmationDialog(BuildContext context) async {
    final t = AppLocalizations.of(context);
    
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(t.confirmReschedule),
          content: Text(t.confirmRescheduleMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(t.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(t.yesSaveChanges),
            ),
          ],
        );
      },
    ) ?? false;
  }

  // Helper para traducir día de la semana de API a texto local
  String _translateDay(String dayApi, AppLocalizations t) {
    switch (dayApi) {
      case 'Monday': return t.monday;
      case 'Tuesday': return t.tuesday;
      case 'Wednesday': return t.wednesday;
      case 'Thursday': return t.thursday;
      case 'Friday': return t.friday;
      case 'Saturday': return t.saturday;
      case 'Sunday': return t.sunday;
      default: return dayApi;
    }
  }

  // Helper para formatear TimeOfDay a String 24h para la API (ej: "18:30:00")
  String _formatTimeForApi(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute:00';
  }

  @override
  Widget build(BuildContext context) {
    final bool canSave = _hasChanges;
    final colorScheme = Theme.of(context).colorScheme;
    final t = AppLocalizations.of(context);

    return BlocProvider(
      create: (_) => GetIt.I<RescheduleBloc>(),
      child: BlocConsumer<RescheduleBloc, RescheduleState>(
        listener: (context, state) {
          if (state is RescheduleSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.rescheduledSuccessfully)));
            // 🎯 CAMBIO CLAVE 1: CERRAR LA PÁGINA DEVOLVIENDO 'true'
            context.pop(true); // Indica que la operación fue exitosa
          }
          if (state is RescheduleFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message), backgroundColor: Colors.red));
          }
        },
        builder: (context, state) {
          final bool isSaving = state is RescheduleLoading;

          return Scaffold(
            appBar: AppBar(
              title: Text(t.teachingRescheduleTitle, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              backgroundColor: colorScheme.primaryContainer,
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      // Grupo de campos blancos redondeados
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            _buildSelectionTile(
                              context: context,
                              icon: Icons.calendar_today,
                              title: t.dayOfWeek,
                              value: _translateDay(selectedDay, t),
                              onTap: () => _pickDay(context),
                            ),
                            const Divider(height: 1, indent: 50),
                            _buildSelectionTile(
                              context: context,
                              icon: Icons.access_time,
                              title: t.startTime,
                              value: startTime.format(context),
                              onTap: () => _pickTime(isStartTime: true),
                            ),
                            const Divider(height: 1, indent: 50),
                            _buildSelectionTile(
                              context: context,
                              icon: Icons.access_time_filled,
                              title: t.endTime,
                              value: endTime.format(context),
                              onTap: () => _pickTime(isStartTime: false), 
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Campos grises (solo lectura o secundarios)
                      _buildReadOnlyField(context, "${t.course}: ${widget.session.course.name} - ${widget.session.course.code}"),
                      const SizedBox(height: 12),
                      _buildReadOnlyField(context, "${t.campus}: ${widget.session.classroom.campus} - ${t.classroom}: ${widget.session.classroom.code}"),
                    ],
                  ),
                ),

                // Botones inferiores
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => context.pop(),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text(t.cancel),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: FilledButton(
                          // Habilitado solo si hay cambios Y no está cargando
                          onPressed: (canSave && !isSaving)
                            ? () async {
                                // 1. Mostrar diálogo de confirmación
                                final confirmed = await _showConfirmationDialog(context);

                                // 2. Si se confirma, enviar el evento BLoC
                                if (confirmed) {
                                  context.read<RescheduleBloc>().add(SubmitReschedule(
                                    sessionId: widget.session.id,
                                    classroomId: widget.session.classroom.id,
                                    startTime: _formatTimeForApi(startTime), 
                                    endTime: _formatTimeForApi(endTime),
                                    dayOfWeek: selectedDay.toUpperCase(),
                                  ));
                                }
                              }
                              : null, // Deshabilita el botón si no se puede guardar
                          // 🎯 CAMBIO CLAVE 2: Estilo dinámico del botón
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: canSave 
                                ? colorScheme.primaryContainer // Color primario si hay cambios
                                : Colors.grey[300], // Gris si no hay cambios
                            foregroundColor: canSave
                                ? colorScheme.onPrimaryContainer
                                : Colors.black54,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: isSaving
                            ? const CircularProgressIndicator.adaptive(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ) 
                            : Text(t.save),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

Widget _buildSelectionTile({required BuildContext context, required IconData icon, required String title, required String value, required VoidCallback onTap}) {
    return Material( 
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12), 
        child: Padding( 
          padding: const EdgeInsets.symmetric(vertical: 4.0), 
          child: ListTile(
            leading: Icon(icon, color: Colors.grey[700]),
            title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(value, style: TextStyle(color: Colors.grey[600], fontSize: 16)),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReadOnlyField(BuildContext context, String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8E9F0), 
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(text.contains(AppLocalizations.of(context).course) ? Icons.book : Icons.location_on, color: Colors.grey[700]),
          const SizedBox(width: 16),
          Expanded(child: Text(text, style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }
}