import 'package:clubz/google_signin.dart';
import 'package:clubz/homepage.dart';
import 'package:clubz/sendimg.dart';
import 'package:flutter/material.dart';
import './sendimg.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: Homepage()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSignedin = false;

  void signedin(bool value) async {
    isSignedin = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isloggedIn', true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: GoogleAuth(signedin),
              ),
            ),
          ),
        ),
        routes: {ImageUpload.routename: (ctx) => ImageUpload()});
  }
}
