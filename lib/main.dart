import 'package:clubz/models/aanouncement.dart';
import 'package:clubz/models/club.dart';
import 'package:clubz/models/user.dart';
import 'package:clubz/screens/details_screen/details_screen.dart';
import 'package:clubz/screens/login_page.dart';
import 'package:clubz/screens/settings.dart';
import 'package:clubz/screens/signup.dart';
import 'package:clubz/widgets/switchscreens.dart';
import './screens/homepage.dart';
import './models/post.dart';
import './screens/announcements_screen.dart';
import './screens/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PostList(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserList(),
        ),
        ChangeNotifierProvider(
          create: (_) => ClubList(),
        ),
        ChangeNotifierProvider(
          create: (_) => AnnouncementList(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_) => MaterialApp(
          theme: ThemeData(fontFamily: 'Lato'),
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                return SwitchScreens();
              } else {
                return LoginPage();
              }
            },
          ),
          // home: LoginPage(),
          routes: {
            Homepage.routename: (context) => Homepage(),
            PostsScreen.routename: (context) => PostsScreen(),
            AnnouncementScreen.routename: (context) => AnnouncementScreen(),
            DetailsScreen.routename: (context) => DetailsScreen(),
            Settings.routeName: (context) => Settings(),
            SignUp.routename: (context) => SignUp(),
            LoginPage.routename: (context) => LoginPage(),
            SwitchScreens.routename: (context) => SwitchScreens(),
          },
        ),
      ),
    );
  }
}
