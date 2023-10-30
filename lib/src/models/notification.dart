class Notification {
  final String title;
  final String date;
  final String time;

  Notification({
    required this.title,
    required this.date,
    required this.time,
  });
}

final List<Notification> notifications = [
  Notification(
    title: 'New Product Launch Meeting',
    date: 'Wed, 12th June',
    time: '9:00am',
  ),
  Notification(
    title: 'Team Building Workshop',
    date: 'Thu, 20th June',
    time: '2:30pm',
  ),
  Notification(
    title: 'Client Presentation',
    date: 'Tue, 25th June',
    time: '10:30am',
  ),
  Notification(
    title: 'Project Kickoff Meeting',
    date: 'Mon, 1st July',
    time: '11:00am',
  ),
  Notification(
    title: 'Quarterly Review',
    date: 'Fri, 5th July',
    time: '3:00pm',
  ),
  Notification(
    title: 'Marketing Strategy Meeting',
    date: 'Wed, 10th July',
    time: '2:15pm',
  ),
  Notification(
    title: 'Company Town Hall',
    date: 'Thu, 18th July',
    time: '4:30pm',
  ),
  Notification(
    title: 'Design Review Session',
    date: 'Tue, 23rd July',
    time: '2:45pm',
  ),
  Notification(
    title: 'Product Development Workshop',
    date: 'Mon, 29th July',
    time: '9:30am',
  ),
  Notification(
    title: 'Customer Feedback Session',
    date: 'Fri, 2nd August',
    time: '10:00am',
  ),
];
