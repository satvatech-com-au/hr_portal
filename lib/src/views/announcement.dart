import 'package:flutter/material.dart';
import 'package:hr_app/src/models/annoucement.dart';
import 'package:hr_app/src/views/create_annoucement.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({
    super.key,
  });

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
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreateAnnouncementScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
