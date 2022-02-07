import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignIn extends StatelessWidget {
  GoogleSignIn _googleSignIn = GoogleSignIn();
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
    return Container();
  }
}
