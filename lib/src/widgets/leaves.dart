import 'package:flutter/material.dart';
import 'package:hr_app/src/models/member.dart';

class LeavesTab extends StatefulWidget {
  final Member member;
  const LeavesTab({
    Key? key,
    required this.member,
  }) : super(key: key);

  @override
  State<LeavesTab> createState() => _LeavestabState();
}

class _LeavestabState extends State<LeavesTab> {
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
              'Leaves',
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
            const Column(
              children: [
                // section to be completed later
              ],
            )
        ],
      ),
    );
  }
}
