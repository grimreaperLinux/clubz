import 'package:clubz/screens/details_screen/details_screen.dart';
import 'package:clubz/screens/settings.dart';

import './screens/homepage.dart';
import './models/post.dart';
import './screens/announcements_screen.dart';
import './screens/posts_screen.dart';
import './widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PostList(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: screens[index],
            bottomNavigationBar: BottomNavBar(changescreen),
          ),
          routes: {
            Homepage.routename: (context) => Homepage(),
            PostsScreen.routename: (context) => PostsScreen(),
            AnnouncementScreen.routename: (context) => AnnouncementScreen(),
            DetailsScreen.routename: (context) => DetailsScreen(),
            Settings.routeName: (context) => Settings(),
          },
        ),
      ),
    );
  }
}
