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
