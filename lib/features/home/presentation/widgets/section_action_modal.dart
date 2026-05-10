import 'package:demy_teachers/core/localization/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:demy_teachers/features/schedule/domain/entities/class_session.dart';

class SessionActionModal extends StatelessWidget {
  final ClassSession session;

  const SessionActionModal({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, 
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),

          Text(
            session.course.name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          // 3. Botón "Take Attendance"
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.pop(context); 
                
                context.pushNamed(
                  'take_attendance',
                  extra: {
                    'sessionId': session.id, 
                    'courseName': session.course.name,
                  },
                );
              },
              icon: const Icon(Icons.calendar_today_outlined),
              label:  Text(t.registerAttendanceButtonLabel),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}