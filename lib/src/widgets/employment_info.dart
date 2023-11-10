import 'package:flutter/material.dart';
import 'package:hr_app/src/models/member.dart';
import 'package:hr_app/src/widgets/data_tile.dart';

class EmploymentInfoTab extends StatefulWidget {
  final Member member;
  const EmploymentInfoTab({
    Key? key,
    required this.member,
  }) : super(key: key);

  @override
  State<EmploymentInfoTab> createState() => _EmploymentInfoTabState();
}

class _EmploymentInfoTabState extends State<EmploymentInfoTab> {
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
              'Employment details',
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
                DataTile(
                    parameter: 'Employee ID', data: widget.member.employeeId),
                const SizedBox(height: 10),
                DataTile(parameter: 'Team', data: widget.member.department),
                const SizedBox(height: 10),
                DataTile(parameter: 'Role', data: widget.member.role),
                const SizedBox(
                  height: 10,
                ),
                DataTile(
                    parameter: 'Reporting Manager',
                    data: widget.member.reportingManager),
                const SizedBox(height: 10),
                DataTile(
                    parameter: 'Date of hire', data: widget.member.dateOfHire),
                const SizedBox(height: 10),
                DataTile(
                    parameter: 'Employment type',
                    data: widget.member.employmentType),
                const SizedBox(height: 10),
              ],
            )
        ],
      ),
    );
  }
}
