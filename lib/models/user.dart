import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class User with ChangeNotifier {
  final String name;
  final String email;
  final String username;
  String profilepic = '';
  String token = '';
  int age = 0;
  String college = '';
  String gender = '';
  final String id;
  final List clubs;

  User({
    required this.name,
    required this.email,
    required this.username,
    required this.id,
    required this.clubs,
  });
}

class UserList with ChangeNotifier {
  List<User> _items = [];

  List<User> get items {
    return [..._items];
  }

  User? user;

  Future<void> addUser(String name, String email, String username) async {
    var url = Uri.parse("http://10.0.1.60:3000/adduser");
    http.post(
      url,
      body: json.encode({
        'name': name,
        'email': email,
        'username': username,
      }),
      headers: {"Content-Type": "application/json"},
    ).then((response) {
      var decodedResponse = json.decode(response.body) as Map;
      final user = User(
          name: name,
          email: email,
          username: username,
          id: decodedResponse['user']['_id'],
          clubs: decodedResponse['clubs']);
      user.token = decodedResponse['token'];
      _items.add(user);
      notifyListeners();
    });
  }

  Future<Map<String, String>> getzepresentuser() async {
    final user = FirebaseAuth.instance.currentUser;
    final email = user!.email;
    var url = Uri.parse("http://10.0.1.60:3000/getLoggedInUser/$email");
    final res = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    final decodedresposnse = json.decode(res.body) as Map;
    return {
      "token": decodedresposnse['tokens'][0]['token'],
      "id": decodedresposnse['_id'],
      "name": decodedresposnse['name'],
      "email": decodedresposnse['email']
    };
  }

  Future<void> getallusers() async {
    var url = Uri.parse("http://10.0.1.60:3000/getusers");
    var response = await http.get(url);
    var decodedresponse = json.decode(response.body) as List;
    decodedresponse.forEach((element) {
      final user = User(
          name: element['name'],
          email: element['email'],
          username: element['username'],
          id: element['_id'],
          clubs: element['clubs']);
      _items.add(user);
      notifyListeners();
    });
  }

  Future<User> getuserbyid(String userid) async {
    var url = Uri.parse("http://10.0.1.60:3000/getUser/$userid");
    final res = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    final decodedresponse = json.decode(res.body) as Map;
    return User(
        name: decodedresponse['name'],
        email: decodedresponse['email'],
        username: decodedresponse['username'],
        id: decodedresponse['_id'],
        clubs: decodedresponse['clubs']);
  }
}
