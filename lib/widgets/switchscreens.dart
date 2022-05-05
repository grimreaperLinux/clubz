import 'package:clubz/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../screens/announcements_screen.dart';
import '../screens/posts_screen.dart';
import '../screens/homepage.dart';

class SwitchScreens extends StatefulWidget {
  static const routename = '/switchscreens';
  @override
  State<SwitchScreens> createState() => _SwitchScreensState();
}

class _SwitchScreensState extends State<SwitchScreens> {
  List<Widget> screens = [
    Homepage(),
    PostsScreen(),
    AnnouncementScreen(),
  ];

  int index = 0;

  void changescreen(value) {
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavBar(changescreen),
    );
  }
}
