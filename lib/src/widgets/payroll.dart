import 'package:flutter/material.dart';
import 'package:hr_app/src/models/member.dart';

class PayrollTab extends StatefulWidget {
  final Member member;
  const PayrollTab({
    Key? key,
    required this.member,
  }) : super(key: key);

  @override
  State<PayrollTab> createState() => _PayrollTabState();
}

class _PayrollTabState extends State<PayrollTab> {
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
              'Payroll',
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
                //  to be completed later
              ],
            )
        ],
      ),
    );
  }
}
