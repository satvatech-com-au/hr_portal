import 'package:flutter/material.dart';
import 'package:hr_app/src/models/member.dart';
import 'package:hr_app/src/views/member_detail.dart';

class MembersScreen extends StatelessWidget {
  const MembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Company Members'),
        ),
        body: ListView.builder(
            itemCount: members.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MemberDetailScreen(
                              member: members[index],
                            ))),
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
            }));
  }
}
