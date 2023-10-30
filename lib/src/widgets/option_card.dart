import 'package:flutter/material.dart';

// class OptionCard extends StatelessWidget {
//   final String imageUrl;
//   final String text;
//   final Widget route;
//   const OptionCard({
//     Key? key,
//     required this.imageUrl,
//     required this.text,
//     required this.route,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => route,
//             ));
//       },
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(
//                 imageUrl,
//                 height: 30,
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 text,
//                 textAlign: TextAlign.center,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }