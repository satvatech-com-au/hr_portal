import 'package:flutter/material.dart';
import 'package:hr_app/src/models/member.dart';
import 'package:hr_app/src/widgets/contact_info.dart';
import 'package:hr_app/src/widgets/employment_info.dart';
import 'package:hr_app/src/widgets/personal_info.dart';

class EmployeeInfoScreen extends StatelessWidget {
  final Member member;
  const EmployeeInfoScreen({
    Key? key,
    required this.member,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Information'),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                const Icon(
                  Icons.person,
                  size: 120,
                ),
                Text(
                  member.name,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          PersonalInfoTab(member: member),
          EmploymentInfoTab(member: member),
          ContactInfoTab(member: member),
        ],
      ),
    );
  }
}
