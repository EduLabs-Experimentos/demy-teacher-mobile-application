import 'package:demy_teachers/core/localization/l10n/app_localizations.dart';
import 'package:demy_teachers/features/attendance/presentation/blocs/attendance_bloc.dart';
import 'package:demy_teachers/features/attendance/presentation/blocs/attendance_event.dart';
import 'package:demy_teachers/features/attendance/presentation/blocs/attendance_state.dart';
import 'package:demy_teachers/features/attendance/presentation/widgets/student_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class TakeAttendancePage extends StatelessWidget {
  final int classSessionId;
  final String courseName; // Pásalo desde la navegación

  const TakeAttendancePage({super.key, required this.classSessionId, required this.courseName});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primaryContainer;
    final t = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => GetIt.I<AttendanceBloc>()..add(LoadStudentsEvent(classSessionId)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(t.attendanceReportTitle,
          style: TextStyle(
              color: Colors.white, 
              fontWeight: FontWeight.bold
            ),),
          // 1. AQUÍ VA EL LEADING (El botón de atrás)
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white), // Flecha blanca
            onPressed: () {
              if (context.canPop()) {
                context.pop(); // Regresa a la pantalla anterior
              } else {
                context.go('/home'); // Si no puede volver, va al home
              }
            },
          ),
          
           // Título de la imagen
          // ... estilos
        ),
        body: BlocConsumer<AttendanceBloc, AttendanceState>(
          listener: (context, state) {
            if (state is AttendanceSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.attendanceSavedSuccess)));
              context.pop(); // Regresar
            }

            if (state is AttendanceLoaded && state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                  backgroundColor: Colors.red, // Rojo para errores
                )
              );
            }
            if (state is AttendanceFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message), backgroundColor: Colors.red)
                );
                }
          },
          builder: (context, state) {
            if (state is AttendanceLoading) return const Center(child: CircularProgressIndicator());
            
            if (state is AttendanceLoaded) {
              return Column(
                children: [
                  // Info Cards (Fecha, Curso) como en la imagen
                  _buildHeaderInfo(courseName, t),
                  
                  // Cabecera de la tabla (Students, A, T, J/P)
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(t.studentsLabel, // CAMBIO
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        // Los labels de las bolitas
                        Row(
                           children: [
                             _StatusHeaderCircle(text: t.statusPresentAbbr, color: Colors.blue), // Absent/Asistió? Ajusta colores
                             SizedBox(width: 8),
                             _StatusHeaderCircle(text: t.statusExcusedAbbr, color: Colors.orange),
                             SizedBox(width: 8),
                             _StatusHeaderCircle(text: t.statusAbsentAbbr, color: Colors.purple), // O 'P'
                           ],
                        )
                      ],
                    ),
                  ),

                  // Lista de estudiantes
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.students.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        final item = state.students[index];
                        return StudentAttendanceTile(
                          item: item,
                          onStatusChanged: (newStatus) {
                            context.read<AttendanceBloc>().add(
                              ToggleStudentStatusEvent(item.student.dni, newStatus)
                            );
                          },
                        );
                      },
                    ),
                  ),

                  // Botón de guardar
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                         context.read<AttendanceBloc>().add(SubmitAttendanceEvent(DateTime.now()));
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("Save Attendance"),
                    ),
                  )
                ],
              );
            }
            if (state is AttendanceFailure) {
               return Center(child: Text("Error al cargar lista: ${state.message}"));
               }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildHeaderInfo(String course, AppLocalizations t) {
    // Aquí implementas los cards blancos de arriba (Start Date, Course, etc)
    // Usa un Column con Card widgets.
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Ejemplo simplificado
          ListTile(
            leading: const Icon(Icons.book),
            title:Text(t.courseLabel),
            trailing: Text(course),
            tileColor: Colors.white,
          )
        ],
      ),
    );
  }
}

class _StatusHeaderCircle extends StatelessWidget {
  final String text;
  final Color color;
  const _StatusHeaderCircle({required this.text, required this.color});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30, height: 30,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}