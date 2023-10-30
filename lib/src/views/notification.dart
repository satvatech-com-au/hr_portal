import 'package:flutter/material.dart';
import 'package:hr_app/src/models/notification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return ListTile(
          leading: const Icon(
            Icons.notifications,
          ),
          title: Text(
            notification.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '${notification.date} - ${notification.time}',
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }
}
