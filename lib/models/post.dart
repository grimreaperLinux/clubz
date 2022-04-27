import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:path/path.dart';

class Post with ChangeNotifier {
  final String postpic;
  final String location;
  final String caption;
  final String id;
  int likes;
  int dislikes;

  Post({
    required this.postpic,
    required this.location,
    required this.caption,
    required this.id,
    this.likes = 0,
    this.dislikes = 0,
  });
}

class PostList with ChangeNotifier {
  List<Post> _items = [];

  List<Post> get items {
    return [..._items];
  }

  final storage = FirebaseStorage.instance.ref();

  Future<void> addpost(
      PickedFile? _imageFile, String caption, String location) async {
    if (_imageFile == null) return;
    final fileName = basename(File(_imageFile.path).path);
    final destination = 'images/$fileName';
    final imageref = storage.child(destination);
    try {
      await imageref.putFile(File(_imageFile.path));
      await imageref.getDownloadURL().then((value) {
        var url = Uri.parse("http://10.0.1.60:3000/createpost");
        http.post(
          url,
          body: json.encode({
            'caption': caption,
            'location': location,
            'postpic': value,
          }),
          headers: {"Content-Type": "application/json"},
        ).then((response) {
          var decodedResponse = json.decode(response.body) as Map;
          final newpost = Post(
            postpic: decodedResponse['postpic'],
            location: decodedResponse['location'],
            caption: decodedResponse['caption'],
            id: decodedResponse['_id'],
          );
          _items.add(newpost);
          notifyListeners();
        });
      });
    } catch (e) {
      throw Exception('Post upload failed');
    }
  }

  Future<void> getposts() async {
    var url = Uri.parse("http://10.0.17.2:3000/getposts");
    try {
      var response = await http.get(url);
      var decodedresponse = json.decode(response.body) as List;
      print(decodedresponse);
      decodedresponse.forEach(
        (element) {
          final post = Post(
            postpic: element['postpic'],
            location: element['location'],
            caption: element['caption'],
            id: element['_id'],
          );
          _items.add(post);
          notifyListeners();
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
