import 'package:flutter/material.dart';
import 'package:demy_teachers/features/attendance/domain/entities/student_statistics.dart';

class StudentReportRow extends StatelessWidget {
  final StudentStatistics stat;
  final bool showPercentage;

  const StudentReportRow({
    super.key, 
    required this.stat, 
    required this.showPercentage
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                CircleAvatar(
                   radius: 20,
                  backgroundImage: stat.student.photoUrl.isNotEmpty ? NetworkImage(stat.student.photoUrl) : null,
                  child: stat.student.photoUrl.isEmpty ? Text(stat.student.fullName[0]) : null,
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(stat.student.fullName, style: const TextStyle(fontWeight: FontWeight.w600))),
              ],
            ),
          ),
          
          _DataCell(text: showPercentage ? "${stat.presentPercentage}%" : "${stat.presentCount}"),
          const SizedBox(width: 8),
          _DataCell(text: showPercentage ? "${stat.excusedPercentage}%" : "${stat.excusedCount}"),
          const SizedBox(width: 8),
          _DataCell(text: showPercentage ? "${stat.absentPercentage}%" : "${stat.absentCount}"),
        ],
      ),
    );
  }
}

// Widget privado pequeño para la celda
class _DataCell extends StatelessWidget {
  final String text;
  const _DataCell({required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32, 
      child: Text(text, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
    );
  }
}