import 'package:clubz/google_signin.dart';
import 'package:clubz/homepage.dart';
import 'package:clubz/sendimg.dart';
import 'package:flutter/material.dart';
import './sendimg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: GoogleAuth(),
              ),
            ),
          ),
        ),
        routes: {ImageUpload.routename: (ctx) => ImageUpload()});
  }
}
