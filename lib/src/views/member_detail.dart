import 'package:flutter/material.dart';
import 'package:hr_app/src/models/member.dart';

class MemberDetailScreen extends StatelessWidget {
  final Member member;
  const MemberDetailScreen({
    Key? key,
    required this.member,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Information')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 16.0),
              const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/team.png'),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                member.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Team: ${member.team}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Role: ${member.role}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Years of Experience: ${member.years}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Phone: ${member.phone}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Email: ${member.email}',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
