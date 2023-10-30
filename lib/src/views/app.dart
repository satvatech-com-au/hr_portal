import 'package:flutter/material.dart';
import 'package:hr_app/src/views/announcement.dart';
import 'package:hr_app/src/views/calender.dart';
import 'package:hr_app/src/views/holidays.dart';
import 'package:hr_app/src/views/home.dart';
import 'package:hr_app/src/views/leave_applications.dart';
import 'package:hr_app/src/views/members.dart';
import 'package:hr_app/src/views/more.dart';
import 'package:hr_app/src/views/notification.dart';
import 'package:hr_app/src/views/teams.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _views = [
    const Home(),
    const Calender(),
    const NotificationScreen(),
    const More()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_currentIndex == 0
              ? 'Home'
              : _currentIndex == 1
                  ? 'Calender'
                  : _currentIndex == 2
                      ? 'Notification'
                      : 'More'),
        ),
        body: _views[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: "Calender",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notification",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: "More",
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('Ashley Cole'),
                accountEmail: Text('cole08@email.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 48,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                selected: _currentIndex == 0,
                onTap: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('My calendar'),
                selected: _currentIndex == 1,
                onTap: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.announcement),
                title: const Text('Announcements'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnnouncementScreen()));
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Teams management'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TeamsScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Members management'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MembersScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Manage applications'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const LeaveApplicationScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.flight),
                title: const Text('Holiday management'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HolidayScreen()));
                },
              ),
              const ListTile(
                leading: Icon(Icons.bar_chart),
                title: Text('Reporting'),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
              ),
              const ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
            ],
          ),
        ));
  }
}
