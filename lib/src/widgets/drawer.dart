import 'package:flutter/material.dart';
import 'package:hr_app/src/views/announcement.dart';
import 'package:hr_app/src/views/holidays.dart';
import 'package:hr_app/src/views/members.dart';
import 'package:hr_app/src/views/teams.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      width: screenWidth * 0.8,
      color: Colors.white,
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
            onTap: () {
              setState(() {
                _currentIndex = 0;
              });
              Navigator.pop(context);
            },
            leading: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('My calendar'),
           
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TeamsScreen()));
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
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Manage application'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HolidayScreen()));
            },
            leading: const Icon(Icons.flight),
            title: const Text('Holiday management'),
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
    );
  }
}
