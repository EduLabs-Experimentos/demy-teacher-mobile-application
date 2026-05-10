import 'package:demy_teachers/core/localization/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

// 1. Imports de tus BLOCs y Estados
import 'package:demy_teachers/features/attendance/presentation/blocs/attendance_report_bloc.dart';
import 'package:demy_teachers/features/attendance/presentation/blocs/attendance_report_event.dart';
import 'package:demy_teachers/features/attendance/presentation/blocs/attendance_report_state.dart';

// 2. Imports de tus Widgets separadados (Asegúrate que la ruta sea correcta)
import 'package:demy_teachers/features/attendance/presentation/widgets/report_filter_card.dart';
import 'package:demy_teachers/features/attendance/presentation/widgets/student_report_row.dart';

class AttendanceReportPage extends StatefulWidget {
  const AttendanceReportPage({super.key});

  @override
  State<AttendanceReportPage> createState() => _AttendanceReportPageState();
}

class _AttendanceReportPageState extends State<AttendanceReportPage> {
  // Estado local para alternar entre Porcentaje (%) y Cantidad (#)
  bool showPercentage = true; 

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.attendanceReportTitle, 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      // Inyección del Bloc
      body: BlocProvider(
        create: (_) => GetIt.I<AttendanceReportBloc>()..add(LoadReportEvent()),
        child: BlocBuilder<AttendanceReportBloc, AttendanceReportState>(
          builder: (context, state) {
            // Estado de Carga
            if (state is ReportLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            // Estado de Error
            if (state is ReportFailure) {
              return Center(child: Text("Error: ${state.message}"));
            }
            
            // Estado Cargado (Aquí armamos la UI)
            if (state is ReportLoaded) {
              return Column(
                children: [
                  // ------------------------------------------------
                  // 1. TARJETA DE FILTROS (Widget separado que importamos)
                  // ------------------------------------------------
                  ReportFilterCard(state: state), 

                  // ------------------------------------------------
                  // 2. TOGGLE SWITCH (% / #) (Método local, ver abajo)
                  // ------------------------------------------------
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _buildToggleSwitch(),
                      ],
                    ),
                  ),

                  // ------------------------------------------------
                  // 3. CABECERA DE TABLA (Método local, ver abajo)
                  // ------------------------------------------------
                  _buildTableHeader(t),

                  // ------------------------------------------------
                  // 4. LISTA DE ESTUDIANTES (Widget separado que importamos)
                  // ------------------------------------------------
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.only(bottom: 20),
                      itemCount: state.stats.length,
                      separatorBuilder: (_,__) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final stat = state.stats[index];
                        
                        // Usamos el widget separado
                        return StudentReportRow(
                          stat: stat,
                          showPercentage: showPercentage,
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  // ====================================================================
  //  MÉTODOS PRIVADOS LOCALES (Estos son los "pequeños" que faltaban)
  // ====================================================================

  /// Construye el interruptor para cambiar entre % y #
  Widget _buildToggleSwitch() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          _toggleBtn("%", showPercentage, () => setState(() => showPercentage = true)),
          Container(width: 1, color: Colors.grey.shade300),
          _toggleBtn("#", !showPercentage, () => setState(() => showPercentage = false)),
        ],
      ),
    );
  }

  /// Botón individual dentro del Toggle
  Widget _toggleBtn(String text, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.horizontal(
        left: text == "%" ? const Radius.circular(19) : Radius.zero,
        right: text == "#" ? const Radius.circular(19) : Radius.zero,
      ),
      child: Container(
        width: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.horizontal(
            left: text == "%" ? const Radius.circular(19) : Radius.zero,
            right: text == "#" ? const Radius.circular(19) : Radius.zero,
          ),
        ),
        child: Text(
          text, 
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 16, 
            color: isSelected ? Colors.deepOrange : Colors.grey
          )
        ),
      ),
    );
  }

  /// Construye la cabecera de la tabla (Students | A | T | J)
  Widget _buildTableHeader(t) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        children: [
           Expanded(
            flex: 3, 
            child: Text(t.studentsLabel, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ),
          _headerCircle(t.statusPresentAbbr, Colors.blue),   // Asistencia (Present)
          const SizedBox(width: 8),
          _headerCircle(t.statusExcusedAbbr, Colors.orange), // Tardanza (Late/Excused)
          const SizedBox(width: 8),
          _headerCircle(t.statusAbsentAbbr, Colors.purple), // Justificado/Falta (Absent)
        ],
      ),
    );
  }

  /// Círculo de color para la cabecera
  Widget _headerCircle(String text, Color color) {
    return Container(
      width: 32, height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}