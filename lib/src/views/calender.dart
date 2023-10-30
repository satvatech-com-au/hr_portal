// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hr_app/src/models/activity.dart';

class Calender extends StatelessWidget {
  const Calender({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final activity = activities[index];
        return ListTile(
          leading: const Icon(
            Icons.notifications,
          ),
          title: Text(
            activity.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '${activity.date} - ${activity.time}',
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }
}
