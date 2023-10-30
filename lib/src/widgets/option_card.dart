import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String imageUrl;
  final String text;
  final Widget route;
  const OptionCard({
    Key? key,
    required this.imageUrl,
    required this.text,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => route,
            ));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imageUrl,
                height: 30,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OptionCard2 extends StatelessWidget {
  final int figure;
  final String parameter;
  const OptionCard2({
    Key? key,
    required this.figure,
    required this.parameter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              figure.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(parameter, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
