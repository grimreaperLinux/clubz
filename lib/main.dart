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
  void changescreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ImageUpload()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Press me Daddy'),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: Text('No no, Press me Daddy'),
                  onPressed: () {
                    changescreen(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
