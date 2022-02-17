import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:clubz/sendimg.dart';

class GoogleAuth extends StatelessWidget {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? data;
  late bool isSignedin;

  void login(BuildContext context) async {
    data = await _googleSignIn.signIn();
    Navigator.of(context).pushNamed(ImageUpload.routename,
        arguments: {'name': data!.displayName, 'email': data!.email});
  }

  void signout() {
    _googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          child: Text('Press me Daddy'),
          onPressed: () {
            login(context);
          },
        ),
        ElevatedButton(
          child: Text('Bye Bye Daddy'),
          onPressed: () {
            signout();
          },
        ),
      ],
    );
  }
}
