import 'package:flutter/material.dart';

class Announcement {
  final String title;
  final String description;
  final DateTime date;

  Announcement({
    required this.title,
    required this.description,
    required this.date,
  });
}

List<Announcement> announcements = [
  Announcement(
    title: 'Important Meeting',
    description: 'There will be an important meeting next week.',
    date: DateTime(2023, 10, 18),
  ),
  Announcement(
    title: 'New Project Launch',
    description: 'We are excited to announce the launch of our new project.',
    date: DateTime(2023, 10, 19),
  ),
  Announcement(
    title: 'Company Picnic',
    description: 'Join us for a fun company picnic on Saturday!',
    date: DateTime(2023, 10, 20),
  ),
  Announcement(
    title: 'Training Session',
    description:
        'A training session on the latest software updates will be held.',
    date: DateTime(2023, 10, 22),
  ),
  Announcement(
    title: 'Employee of the Month',
    description:
        'We are proud to announce our Employee of the Month for September.',
    date: DateTime(2023, 10, 24),
  ),
];

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcements'),
      ),
      body: ListView.builder(
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          final announcement = announcements[index];
          return AnnouncementItem(
            announcement: announcement,
          );
        },
      ),
    );
  }
}

class AnnouncementItem extends StatelessWidget {
  final Announcement announcement;

  const AnnouncementItem({
    Key? key,
    required this.announcement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        "${announcement.date.year}-${announcement.date.month}-${announcement.date.day}";

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              announcement.title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              announcement.description,
            ),
            const SizedBox(height: 8.0),
            Text(
              formattedDate,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
