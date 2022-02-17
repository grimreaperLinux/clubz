import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
  static const routename = '/userReg';
}

class _ImageUploadState extends State<ImageUpload> {
  late XFile _image;
  final picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = pickedFile;
      } else {
        print('No image selected.');
      }
    });
  }

  ImageProvider? picture;
  bool isrecieved = false;
  ImageProvider picture = isrecieved ? picture : Image.network('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg')

  upload(XFile imageFile, String username, String name, String email) async {
    var uri = "http://192.168.0.121:3000/newuser";
    String fileName = imageFile.path.split('/').last;

    FormData data = FormData.fromMap({
      'name': name,
      'email': email,
      'username': username,
      "myFile": await MultipartFile.fromFile(
        imageFile.path,
        filename: fileName,
      ),
    });

    Dio dio = new Dio();

    dio.post(uri, data: data).then((response) {
      var jsonResponse = jsonDecode(response.toString());
      setState(() {
        isrecieved = true;
        picture = jsonResponse['user'].profilepic;
      });
    }).catchError((error) => print(error));
  }

  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    final name = routeArgs['name'];
    final email = routeArgs['email'];
    return Scaffold(
      appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Column(
            children: [
              const Text("Select an image"),
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () async => await getImage(),
                icon: const Icon(Icons.upload_file),
                label: const Text("Browse"),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: const InputDecoration(labelText: 'username'),
                  // onChanged: (value) {
                  //   titleInput = value;
                  // },
                  controller: usernameController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () => upload(_image, usernameController.text,
                    name as String, email as String),
                icon: const Icon(Icons.upload_rounded),
                label: const Text("Save to ze database"),
              ),
              SizedBox(
                height: 200,
              ),
              Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: null /* add child content here */,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
