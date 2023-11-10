import 'package:flutter/material.dart';
import 'package:hr_app/src/models/member.dart';
import 'package:hr_app/src/widgets/data_tile.dart';

class ContactInfoTab extends StatefulWidget {
  final Member member;
  const ContactInfoTab({
    Key? key,
    required this.member,
  }) : super(key: key);

  @override
  State<ContactInfoTab> createState() => _ContactInfoTabState();
}

class _ContactInfoTabState extends State<ContactInfoTab> {
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
              'Contact information',
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
                DataTile(parameter: 'Phone', data: widget.member.phone),
                const SizedBox(height: 10),
                DataTile(parameter: 'Email', data: widget.member.email),
                const SizedBox(height: 10),
                DataTile(
                    parameter: 'Residential address',
                    data: widget.member.address),
                const SizedBox(height: 10),
                DataTile(
                    parameter: 'Emergency contact name',
                    data: widget.member.emergencyContactName),
                const SizedBox(height: 10),
                DataTile(
                    parameter: 'Emergency contact relationship',
                    data: widget.member.emergencyContactRelationship),
                const SizedBox(height: 10),
                DataTile(
                    parameter: 'Emergency contact number',
                    data: widget.member.emergencyContactNumber),
                const SizedBox(height: 10),
                DataTile(
                    parameter: 'Alternate contact',
                    data: widget.member.alternateNumber),
              ],
            )
        ],
      ),
    );
  }
}
