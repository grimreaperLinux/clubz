import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:path/path.dart';

class PostRoutes {
  final storage = FirebaseStorage.instance.ref();

  Future<void> uploadFile(
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
          body: json.encode(
              {'caption': caption, 'location': location, 'postpic': value}),
          headers: {"Content-Type": "application/json"},
        ).then((response) {
          var decodedResponse = jsonDecode(response.body) as Map;
          print(decodedResponse);
        });
      });
    } catch (e) {
      throw Exception('Image upload failed');
    }
  }
}
