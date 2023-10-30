import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    const MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: LeaveApplicationScreen(),
      ),
    ),
  );
}

class LeaveApplicationScreen extends StatelessWidget {
  const LeaveApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Leave Applications'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Pending'),
                Tab(text: 'Approved'),
                Tab(text: 'Rejected'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              LeaveApplicationList(status: LeaveStatus.pending),
              LeaveApplicationList(status: LeaveStatus.approved),
              LeaveApplicationList(status: LeaveStatus.rejected),
            ],
          ),
        ));
  }
}

class LeaveApplicationList extends StatelessWidget {
  final LeaveStatus status;

  const LeaveApplicationList({Key? key, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<LeaveApplication> leaveApplications = getLeaveApplications(status);

    return ListView.builder(
      itemCount: leaveApplications.length,
      itemBuilder: (context, index) {
        final leaveApp = leaveApplications[index];
        return ListTile(
          title: Text(leaveApp.workerName),
          subtitle: Text(
              'From: ${DateFormat('yyyy-MM-dd').format(leaveApp.startDate)} - To: ${DateFormat('yyyy-MM-dd').format(leaveApp.endDate)}'),
          trailing: ElevatedButton(
            onPressed: () {
              _handleLeaveApplication(leaveApp, status);
            },
            child: const Text('Review'),
          ),
        );
      },
    );
  }

  List<LeaveApplication> getLeaveApplications(LeaveStatus status) {
    List<LeaveApplication> applications = [];

    if (status == LeaveStatus.pending) {
      applications = [
        LeaveApplication(
          workerName: 'John Doe',
          startDate: DateTime(2023, 11, 15),
          endDate: DateTime(2023, 11, 19),
          status: LeaveStatus.pending,
        ),
        LeaveApplication(
          workerName: 'Jane Smith',
          startDate: DateTime(2023, 11, 25),
          endDate: DateTime(2023, 11, 28),
          status: LeaveStatus.pending,
        ),
      ];
    } else if (status == LeaveStatus.approved) {
      applications = [
        LeaveApplication(
          workerName: 'Alice Johnson',
          startDate: DateTime(2023, 12, 1),
          endDate: DateTime(2023, 12, 5),
          status: LeaveStatus.approved,
        ),
      ];
    } else if (status == LeaveStatus.rejected) {
      applications = [
        LeaveApplication(
          workerName: 'Bob Wilson',
          startDate: DateTime(2023, 11, 10),
          endDate: DateTime(2023, 11, 13),
          status: LeaveStatus.rejected,
        ),
      ];
    }

    return applications;
  }

  void _handleLeaveApplication(LeaveApplication leaveApp, LeaveStatus status) {}
}

class LeaveApplication {
  final String workerName;
  final DateTime startDate;
  final DateTime endDate;
  final LeaveStatus status;

  LeaveApplication({
    required this.workerName,
    required this.startDate,
    required this.endDate,
    required this.status,
  });
}

enum LeaveStatus { pending, approved, rejected }
