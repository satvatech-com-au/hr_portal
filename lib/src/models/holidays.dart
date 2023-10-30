
class Holiday {
  final String title;
  final String date;

  Holiday({
    required this.title,
    required this.date,
  });
}

List<Holiday> holidays = [
  Holiday(title: 'Christmas', date: '2023-12-25'),
  Holiday(title: "New Year's Day", date: '2024-01-01'),
  Holiday(title: 'Thanksgiving', date: '2023-11-23'),
  Holiday(title: 'Independence Day', date: '2023-07-04'),
  Holiday(title: 'Labor Day', date: '2023-09-04'),
];
