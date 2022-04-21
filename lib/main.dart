import 'package:clubz/homepage.dart';
import 'package:clubz/screens/announcements_screen.dart';
import 'package:clubz/screens/posts_screen.dart';
import 'package:clubz/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'club_profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> screens = [
    Homepage(),
    PostsScreen(),
    AnnouncementScreen(),
    //Club_profile(),
    //
  ];

  int index = 0;

  void changescreen(value) {
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: screens[index],
        bottomNavigationBar: BottomNavBar(changescreen),
      ),
      routes: {
        Homepage.routename: (context) => Homepage(),
        PostsScreen.routename: (context) => PostsScreen(),
        AnnouncementScreen.routename: (context) => AnnouncementScreen()
      },
    );
  }
}
