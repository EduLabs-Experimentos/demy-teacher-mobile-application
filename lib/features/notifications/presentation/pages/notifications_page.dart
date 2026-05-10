import 'package:demy_teachers/core/localization/l10n/app_localizations.dart';
import 'package:demy_teachers/features/notifications/presentation/widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primaryContainer;
    final t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 4,
        centerTitle: true,
        title: Text(
          t.notificationsPageTitle,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
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
      body: ListView(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
        children: [
          NotificationCard(
            title: t.welcomeNotificationTitle,
            description: t.welcomeNotificationDescription,
            icon: Icons.notifications_active,
          ),
        ],
      ),
    );
  }
}
