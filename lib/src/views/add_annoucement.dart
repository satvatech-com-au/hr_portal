import 'package:flutter/material.dart';

class AddAnnouncementScreen extends StatefulWidget {
  const AddAnnouncementScreen({Key? key}) : super(key: key);

  @override
  _AddAnnouncementScreenState createState() => _AddAnnouncementScreenState();
}

class _AddAnnouncementScreenState extends State<AddAnnouncementScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;

    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  final dateController = TextEditingController();

  void _addAnnouncement(String title, String description, DateTime date) {
    setState(() {
      announcements.add(
          Announcement(title: title, description: description, date: date));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Announcement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: dateController,
              decoration: const InputDecoration(
                labelText: 'Date (YYYY-MM-DD)',
                border: OutlineInputBorder(),
              ),
              onTap: () => _selectDate(context),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                hintText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 10,
            ),
            const Spacer(
              flex: 5,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(280, 60)),
              onPressed: () {
                _addAnnouncement(
                  titleController.text,
                  descriptionController.text,
                  selectedDate ?? DateTime.now(),
                );
                Navigator.of(context).pop();
              },
              child: const Text('Add Announcement'),
            ),
            const Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}

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
