import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:clubz/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clubz',
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen.withScreenFunction(
            splash: Center(
              child: Text(
                "clubz",
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            screenFunction: () async{
              return MyApp();},
            splashIconSize: 7000.0,
            splashTransition: SplashTransition.slideTransition,
            pageTransitionType: PageTransitionType.topToBottom,
            curve: Curves.decelerate ,
            backgroundColor: Colors.black45
        ));
  }
}

