// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hr_app/src/views/create_annoucement.dart';
import 'package:hr_app/src/views/create_employee.dart';
import 'package:hr_app/src/views/employees.dart';
import 'package:hr_app/src/views/leave_applications.dart';
import 'package:hr_app/src/views/teams.dart';
import 'package:hr_app/src/widgets/option_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hour = now.hour;
    final day = now.weekday;

    final time = "${now.hour}:${now.minute.toString().padLeft(2, '0')}";
    final List<String> weekdays = [
      '',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    String getGreeting() {
      if (hour < 12) {
        return "Good morning";
      } else if (hour < 17) {
        return "Good afternoon";
      } else {
        return "Good evening";
      }
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    getGreeting(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${weekdays[day]}, ${now.day}-${now.month}-${now.year}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      // Text(time, style: const TextStyle(fontSize: 22)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Expanded(
                  child: OptionCard(
                    imageUrl: 'assets/team.png',
                    text: 'Team Management',
                    route: TeamsScreen(),
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: OptionCard(
                    imageUrl: 'assets/management.png',
                    text: 'Member Management',
                    route: EmployeesScreen(),
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: OptionCard(
                    imageUrl: 'assets/docs.png',
                    text: 'Leave Applications',
                    route: LeaveApplicationScreen(),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Today\'s update',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Expanded(
                  child: OptionCard2(
                    figure: 23,
                    parameter: 'Employees present',
                  ),
                ),
                Expanded(
                  child: OptionCard2(
                    figure: 4,
                    parameter: 'Employees absent',
                  ),
                ),
                Expanded(
                  child: OptionCard2(
                    figure: 6,
                    parameter: 'Late arrivals',
                  ),
                ),
                Expanded(
                  child: OptionCard2(
                    figure: 12,
                    parameter: 'Remote work',
                  ),
                )
              ],
            ),
            const Spacer(
              flex: 3,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(300, 50)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              const CreateEmployeeScreen())));
                },
                child: const Text('Create employee')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(300, 50)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const CreateAnnouncementScreen()));
                },
                child: const Text('Create announcement')),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
