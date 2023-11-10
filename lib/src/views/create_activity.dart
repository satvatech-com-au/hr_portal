import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hr_app/src/models/activity.dart';

class CreateActivityScreen extends StatefulWidget {
  const CreateActivityScreen({Key? key}) : super(key: key);

  @override
  _CreateActivityScreenState createState() => _CreateActivityScreenState();
}

class _CreateActivityScreenState extends State<CreateActivityScreen> {
  final titleController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final dateController = TextEditingController();
  final timeController = TextEditingController();
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

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        timeController.text = picked.format(context);
      });
    }
  }

  void _addActivity(String title, String date, String time) {
    setState(() {
      activities.add(Activity(title: title, date: date, time: time));
    });
    Navigator.of(context).pop();
  }

  String? _selectedTeam;

  final List _teamsList = [
    'Engineering',
    'UI/UX Design',
    'Finance',
    'Marketing',
    'Sales',
    'Human Resource'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Activity'),
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
              controller: timeController,
              decoration: const InputDecoration(
                labelText: 'Time',
                border: OutlineInputBorder(),
              ),
              onTap: () => _selectTime(context),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: FormBuilderDropdown(
                onChanged: (value) {
                  setState(() {
                    _selectedTeam = value.toString();
                  });
                },
                name: 'team',
                decoration: const InputDecoration(
                  labelText: 'Team',
                  border: OutlineInputBorder(),
                ),
                items: _teamsList
                    .map((team) => DropdownMenuItem(
                          value: team,
                          child: Text(team),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
              style: ElevatedButton.styleFrom(fixedSize: const Size(300, 60)),
              onPressed: () {
                _addActivity(
                  titleController.text,
                  dateController.text,
                  timeController.text,
                );
              },
              child: const Text('Add Activity'),
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
