import 'package:flutter/material.dart';

class DataTile extends StatelessWidget {
  final String parameter;
  final String data;
  const DataTile({super.key, required this.parameter, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          parameter,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
          ),
          child: Text(
            data,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
