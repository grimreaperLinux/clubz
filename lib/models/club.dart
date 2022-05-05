import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class Club with ChangeNotifier {
  final String clubpic;
  final String name;
  final String description;
  final String type;
  final String owner;
  final String id;

  Club(
      {required this.clubpic,
      required this.name,
      required this.description,
      required this.type,
      required this.owner,
      required this.id});
}

class ClubList with ChangeNotifier {
  List<Club> _items = [];

  List<Club> get items {
    return [..._items];
  }

  final storage = FirebaseStorage.instance.ref();

  Future<void> addclub(PickedFile? _imageFile, String name, String description,
      String type, String token) async {
    if (_imageFile == null) return;
    final fileName = basename(File(_imageFile.path).path);
    final destination = 'images/$fileName';
    final imageref = storage.child(destination);
    try {
      await imageref.putFile(File(_imageFile.path));
      await imageref.getDownloadURL().then((value) {
        var url = Uri.parse("http://10.0.1.60:3000/newClub");
        http.post(
          url,
          body: json.encode({
            'name': name,
            'description': description,
            'type': type,
            'imageLocOnCloud': destination,
            'profilepic': value
          }),
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $token',
          },
        ).then((response) {
          var decodedResponse = json.decode(response.body) as Map;
          print(decodedResponse);
          final newclub = Club(
            clubpic: decodedResponse['profilepic'],
            name: decodedResponse['name'],
            type: decodedResponse['type'],
            description: decodedResponse['description'],
            owner: decodedResponse['owner'],
            id: decodedResponse['_id'],
          );
          _items.add(newclub);
          notifyListeners();
        });
      });
    } catch (e) {
      throw Exception('Post upload failed');
    }
  }

  Future<void> getclubs() async {
    try {
      var url = Uri.parse("http://10.0.1.60:3000/getclubs");
      var response = await http.get(url);
      var decodedresponse = json.decode(response.body) as List;
      print(decodedresponse);
      decodedresponse.forEach((element) {
        final club = Club(
            clubpic: element['profilepic'],
            name: element['name'],
            description: element['description'],
            type: element['type'],
            owner: element['owner'],
            id: element['_id']);
        _items.add(club);
        notifyListeners();
      });
    } catch (e) {
      print(e);
    }
  }
}
