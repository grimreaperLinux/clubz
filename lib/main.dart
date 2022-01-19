import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? data;

  void login() async {
    data = await _googleSignIn.signIn();
    print(data);
  }

  void signout() {
    _googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: Text('Press me Daddy'),
                onPressed: login,
              ),
              ElevatedButton(
                child: Text('No no, Press me Daddy'),
                onPressed: signout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
