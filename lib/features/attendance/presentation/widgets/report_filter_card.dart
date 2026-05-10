import 'package:demy_teachers/core/localization/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:demy_teachers/features/attendance/presentation/blocs/attendance_report_bloc.dart';
import 'package:demy_teachers/features/attendance/presentation/blocs/attendance_report_event.dart';
import 'package:demy_teachers/features/attendance/presentation/blocs/attendance_report_state.dart';

class ReportFilterCard extends StatelessWidget {
  final ReportLoaded state;

  const ReportFilterCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        children: [
          _buildDateRow(context, t.startDateLabel, state.startDate, (date) {
            context.read<AttendanceReportBloc>().add(FilterReportEvent(startDate: date, endDate: state.endDate));
          }),
          const Divider(),
          _buildDateRow(context, t.endDateLabel, state.endDate, (date) {
            context.read<AttendanceReportBloc>().add(FilterReportEvent(startDate: state.startDate, endDate: date));
          }),
          const Divider(),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.book, color: Colors.grey),
            title: Text(t.courseLabel, style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text("Chemistry - I239 >", style: TextStyle(color: Colors.grey)),
          )
        ],
      ),
    );
  }

  Widget _buildDateRow(BuildContext context, String label, DateTime date, Function(DateTime) onSelect) {
     return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime(2020),
          lastDate: DateTime(2030),
        );
        if (picked != null) onSelect(picked);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            const Icon(Icons.calendar_today, color: Colors.grey),
            const SizedBox(width: 12),
            Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold))),
            Text(DateFormat('dd MMMM, yyyy').format(date), style: const TextStyle(color: Colors.grey)),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}