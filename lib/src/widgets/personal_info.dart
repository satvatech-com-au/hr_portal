import 'package:flutter/material.dart';
import 'package:hr_app/src/models/member.dart';
import 'package:hr_app/src/widgets/data_tile.dart';

class PersonalInfoTab extends StatefulWidget {
  final Member member;
  const PersonalInfoTab({
    Key? key,
    required this.member,
  }) : super(key: key);

  @override
  State<PersonalInfoTab> createState() => _PersonalInfoTabState();
}

class _PersonalInfoTabState extends State<PersonalInfoTab> {
  bool isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: const Text(
              'Personal information',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    isCollapsed = !isCollapsed;
                  });
                },
                icon:
                    Icon(isCollapsed ? Icons.expand_more : Icons.expand_less)),
          ),
          if (!isCollapsed)
            Column(
              children: [
                DataTile(parameter: 'Team', data: widget.member.team),
                const SizedBox(height: 10),
                DataTile(parameter: 'Role', data: widget.member.role),
                const SizedBox(height: 10),
                DataTile(
                    parameter: 'Years of experience',
                    data: widget.member.years.toString()),
                const SizedBox(height: 10),
                DataTile(parameter: 'Phone', data: widget.member.phone),
                const SizedBox(height: 10),
                DataTile(parameter: 'Email', data: widget.member.email),
              ],
            )
        ],
      ),
    );
  }
}
