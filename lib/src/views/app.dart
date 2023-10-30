import 'package:flutter/material.dart';
import 'package:hr_app/src/views/calender.dart';
import 'package:hr_app/src/views/home.dart';
import 'package:hr_app/src/views/more.dart';
import 'package:hr_app/src/views/notification.dart';
import 'package:hr_app/src/widgets/drawer.dart';

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
        drawer: const CustomDrawer());
  }
}
