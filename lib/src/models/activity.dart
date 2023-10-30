class Activity {
  final String title;
  final String date;
  final String time;
  Activity({
    required this.title,
    required this.date,
    required this.time,
  });
}

final List<Activity> activities = [
  Activity(
    title: 'Meeting with Flutter team',
    date: 'Wed, 12th June',
    time: '9:15am',
  ),
  Activity(
    title: 'Team Building Workshop',
    date: 'Tue, 18th June',
    time: '2:30pm',
  ),
  Activity(
    title: 'Client Presentation',
    date: 'Fri, 21st June',
    time: '10:00am',
  ),
  Activity(
    title: 'Training Session',
    date: 'Mon, 24th June',
    time: '3:45pm',
  ),
  Activity(
    title: 'Project Kickoff Meeting',
    date: 'Thu, 27th June',
    time: '11:30am',
  ),
  Activity(
    title: 'Team Lunch',
    date: 'Wed, 3rd July',
    time: '12:00pm',
  ),
  Activity(
    title: 'Design Review',
    date: 'Tue, 9th July',
    time: '2:00pm',
  ),
  Activity(
    title: 'Client Feedback Session',
    date: 'Fri, 12th July',
    time: '4:15pm',
  ),
  Activity(
    title: 'Product Demo',
    date: 'Mon, 15th July',
    time: '10:30am',
  ),
  Activity(
    title: 'Training Workshop',
    date: 'Thu, 18th July',
    time: '2:45pm',
  ),
];
