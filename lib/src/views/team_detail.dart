// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hr_app/src/models/member.dart';
import 'package:hr_app/src/views/employee_info_screen.dart';

class TeamInfoScreen extends StatelessWidget {
  const TeamInfoScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Team members'),
        ),
        body: ListView.builder(
          itemCount: members.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EmployeeInfoScreen(member: members[index])));
              },
              child: ListTile(
                leading: const Icon(
                  Icons.person,
                ),
                title: Text(
                  members[index].name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  members[index].role,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
