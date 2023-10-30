import 'package:flutter/material.dart';
import 'package:hr_app/src/views/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

// class MembersList extends StatelessWidget {
//   const MembersList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: members.length,
//       itemBuilder: (context, index) {
//         final member = members[index];
//         return ListTile(
//           title: Text(member.name),
//           subtitle: Text(member.role),
//         );
//       },
//     );
//   }
// }

// class MembersManagementApp extends StatelessWidget {
//   const MembersManagementApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Members Management'),
//         ),
//         body: const MembersList(),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
         
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const AddMemberScreen()),
//             );
//           },
//           child: const Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }
