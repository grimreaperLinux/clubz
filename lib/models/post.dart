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
  final String imageLocOnCloud;
  int likes;
  int dislikes;

  Post({
    required this.postpic,
    required this.location,
    required this.caption,
    required this.id,
    required this.imageLocOnCloud,
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
            'imageLocOnCloud': destination
          }),
          headers: {"Content-Type": "application/json"},
        ).then((response) {
          var decodedResponse = json.decode(response.body) as Map;
          final newpost = Post(
              postpic: decodedResponse['postpic'],
              location: decodedResponse['location'],
              caption: decodedResponse['caption'],
              id: decodedResponse['_id'],
              imageLocOnCloud: decodedResponse['imageLocOnCloud']);
          _items.add(newpost);
          notifyListeners();
        });
      });
    } catch (e) {
      throw Exception('Post upload failed');
    }
  }

  Future<void> getposts() async {
    var url = Uri.parse("http://10.0.1.60:3000/getposts");
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
              imageLocOnCloud: element['imageLocOnCloud']);
          _items.add(post);
          notifyListeners();
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> updatePost(String id, Map<String, dynamic> newpost) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      if (newpost['editimage']) {
        final desttobedeleted = _items[prodIndex].imageLocOnCloud;
        final ref = storage.child(desttobedeleted);
        await ref.delete();
        final newimage = newpost['image'];
        final fileName = basename(File(newimage.path).path);
        final destination = 'images/$fileName';
        final imageref = storage.child(destination);
        await imageref.putFile(File(newimage.path));
        final downloadurl = await imageref.getDownloadURL();
        Map<String, dynamic> editedpost = {
          'caption': newpost['caption'],
          'location': newpost['location'],
          'postpic': downloadurl,
          'imageLocOnCloud': destination,
        };
        final url = Uri.parse("http://10.0.1.60:3000/updatepost/$id");
        http.patch(
          url,
          body: json.encode(editedpost),
          headers: {"Content-Type": "application/json"},
        );
        _items[prodIndex] = Post(
          caption: editedpost['caption'],
          location: editedpost['location'],
          postpic: editedpost['postpic'],
          imageLocOnCloud: editedpost['imageLocOnCloud'],
          id: id,
        );
        notifyListeners();
        print(downloadurl);
        return;
      }

      Map<String, dynamic> editedpost = {
        'caption': newpost['caption'],
        'location': newpost['location'],
      };

      final url = Uri.parse("http://10.0.1.60:3000/updatepost/$id");
      http.patch(
        url,
        body: json.encode(editedpost),
        headers: {"Content-Type": "application/json"},
      );

      _items[prodIndex] = Post(
        postpic: _items[prodIndex].postpic,
        location: editedpost['location'],
        caption: editedpost['caption'],
        id: id,
        imageLocOnCloud: _items[prodIndex].imageLocOnCloud,
      );
      notifyListeners();
      return;
    } else {
      print('Item not found');
    }
  }

  Future<void> deleteProduct(String id) async {
    final url = Uri.parse('http://10.0.1.60:3000/deletepost/$id');
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
    final desttobedeleted = existingProduct.imageLocOnCloud;
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final ref = storage.child(desttobedeleted);
    await ref.delete();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
    }
  }
}
