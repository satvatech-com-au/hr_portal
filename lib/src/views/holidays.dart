import 'package:flutter/material.dart';

class HolidayScreen extends StatefulWidget {
  const HolidayScreen({Key? key}) : super(key: key);

  @override
  _HolidayScreenState createState() => _HolidayScreenState();
}

class _HolidayScreenState extends State<HolidayScreen> {
  void _addHoliday(String title, String date) {
    setState(() {
      holidays.add(Holiday(title: title, date: date));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Holidays'),
      ),
      body: ListView.builder(
        itemCount: holidays.length,
        itemBuilder: (context, index) {
          final holiday = holidays[index];
          return HolidayItem(
            title: holiday.title,
            date: holiday.date,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddHolidayDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddHolidayDialog(BuildContext context) async {
    final titleController = TextEditingController();
    final dateController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Holiday'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: dateController,
                decoration:
                    const InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                _addHoliday(titleController.text, dateController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class HolidayItem extends StatelessWidget {
  final String title;
  final String date;

  const HolidayItem({
    Key? key,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              date,
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
