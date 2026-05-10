import 'package:demy_teachers/core/localization/l10n/app_localizations.dart';
import 'package:demy_teachers/features/attendance/domain/entities/student.dart';
import 'package:flutter/material.dart';

class StudentAttendanceTile extends StatelessWidget {
  final StudentAttendance item;
  final Function(AttendanceStatus) onStatusChanged;
  

  const StudentAttendanceTile({
    super.key, 
    required this.item, 
    required this.onStatusChanged
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        children: [
          // Foto (Avatar)
          CircleAvatar(
            backgroundImage: item.student.photoUrl.isNotEmpty 
              ? NetworkImage(item.student.photoUrl) 
              : null,
            child: item.student.photoUrl.isEmpty ? Text(item.student.fullName[0]) : null,
          ),
          const SizedBox(width: 12),
          
          // Nombre
          Expanded(
            child: Text(
              item.student.fullName,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),

          // Botones de estado (Similares a la imagen A, T, J)
          // A = Asistió (Presente), T = Tardanza, J/F = Falta/Absent
          
          // Asistió (Azul en imagen)
          _StatusButton(
             text: t.statusPresentAbbr, // O 'P'
             color: Colors.blue,
             isSelected: item.status == AttendanceStatus.present,
             onTap: () => onStatusChanged(AttendanceStatus.present),
          ),
          const SizedBox(width: 8),

          // Tardanza (Naranja en imagen)
          _StatusButton(
             text: t.statusExcusedAbbr,
             color: Colors.orange,
             isSelected: item.status == AttendanceStatus.excused,
             onTap: () => onStatusChanged(AttendanceStatus.excused),
          ),
          const SizedBox(width: 8),

          // Falta (Morado en imagen)
          _StatusButton(
             text: t.statusAbsentAbbr, // O 'A' de Absent
             color: Colors.purple,
             isSelected: item.status == AttendanceStatus.absent,
             onTap: () => onStatusChanged(AttendanceStatus.absent),
          ),
        ],
      ),
    );
  }
}

class _StatusButton extends StatelessWidget {
  final String text;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _StatusButton({
    required this.text, 
    required this.color, 
    required this.isSelected, 
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.transparent, // Relleno si seleccionado
          shape: BoxShape.circle,
          border: Border.all(color: color.withOpacity(0.5), width: 1), // Borde siempre
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}