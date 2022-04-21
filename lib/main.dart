import 'package:clubz/homepage.dart';
import 'package:clubz/models/post.dart';
import 'package:clubz/screens/announcements_screen.dart';
import 'package:clubz/screens/posts_screen.dart';
import 'package:clubz/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
  ];

  int index = 0;

  void changescreen(value) {
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PostList(),
        )
      ],
      child: MaterialApp(
        home: Scaffold(
          body: screens[index],
          bottomNavigationBar: BottomNavBar(changescreen),
        ),
        routes: {
          Homepage.routename: (context) => Homepage(),
          PostsScreen.routename: (context) => PostsScreen(),
          AnnouncementScreen.routename: (context) => AnnouncementScreen()
        },
      ),
    );
  }
}
