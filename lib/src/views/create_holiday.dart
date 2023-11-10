import 'package:flutter/material.dart';
import 'package:hr_app/src/models/holidays.dart';

class CreateHolidayScreen extends StatefulWidget {
  const CreateHolidayScreen({Key? key}) : super(key: key);

  @override
  _CreateHolidayScreenState createState() => _CreateHolidayScreenState();
}

class _CreateHolidayScreenState extends State<CreateHolidayScreen> {
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
