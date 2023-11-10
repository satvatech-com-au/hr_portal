import 'package:flutter/material.dart';
import 'package:hr_app/src/models/member.dart';
import 'package:hr_app/src/widgets/data_tile.dart';

class BenefitsTab extends StatefulWidget {
  final Member member;
  const BenefitsTab({
    Key? key,
    required this.member,
  }) : super(key: key);

  @override
  State<BenefitsTab> createState() => _BenefitsTabState();
}

class _BenefitsTabState extends State<BenefitsTab> {
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
              'Benefits',
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
                    parameter: 'Salary or pay rate',
                    data: widget.member.salaryOrPayRate),
                const SizedBox(height: 10),
                DataTile(
                    parameter: 'Compensation structure',
                    data: widget.member.compensationStructure),
                const SizedBox(height: 10),
                DataTile(
                    parameter: 'Benefits enrollment',
                    data: widget.member.benefitsEnrollment),
              ],
            )
        ],
      ),
    );
  }
}
