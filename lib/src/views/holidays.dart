import 'package:flutter/material.dart';
import 'package:hr_app/src/models/holidays.dart';
import 'package:hr_app/src/views/create_holiday.dart';

class HolidayScreen extends StatefulWidget {
  const HolidayScreen({Key? key}) : super(key: key);

  @override
  _HolidayScreenState createState() => _HolidayScreenState();
}

class _HolidayScreenState extends State<HolidayScreen> {
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreateHolidayScreen()));
        },
        child: const Icon(Icons.add),
      ),
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
