import 'package:flutter/material.dart';

class AddHolidayScreen extends StatefulWidget {
  const AddHolidayScreen({Key? key}) : super(key: key);

  @override
  _AddHolidayScreenState createState() => _AddHolidayScreenState();
}

class _AddHolidayScreenState extends State<AddHolidayScreen> {
  final titleController = TextEditingController();
  DateTime? selectedDate;
  final descriptionController = TextEditingController();

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

  void _addHoliday(String title, String date, String description) {
    setState(() {
      holidays.add(Holiday(title: title, date: date));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Holiday'),
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
              flex: 4,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(280, 60)),
              onPressed: () {
                _addHoliday(
                  titleController.text,
                  dateController.text,
                  descriptionController.text,
                );
                Navigator.of(context).pop();
              },
              child: const Text('Add Holiday'),
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
