import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../helpers/postroutes.dart';

class AlertForZeForm extends StatefulWidget {
  @override
  State<AlertForZeForm> createState() => _AlertForZeFormState();
}

class _AlertForZeFormState extends State<AlertForZeForm> {
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  final _form = GlobalKey<FormState>();
  final caption = TextEditingController();
  final location = TextEditingController();

  Widget _createwidget(String text, TextEditingController name) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(
              5.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please provide a value.';
          }
          return null;
        },
        controller: name,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: const TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: const Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
                Navigator.of(context).pop();
              },
              label: const Text("Camera"),
            ),
            FlatButton.icon(
              icon: const Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
                Navigator.of(context).pop();
              },
              label: const Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        content: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create Your Post',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.15,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green,
                            ),
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: ((
                                    builder,
                                  ) =>
                                      bottomSheet(context)),
                                );
                              },
                              child: _imageFile == null
                                  ? const Center(
                                      child: Text(
                                        'Select an Image',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: FileImage(
                                            File(_imageFile!.path),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          _createwidget('Ze Caption', caption),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          _createwidget('Location', location),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await PostRoutes().uploadFile(
                                  _imageFile, caption.text, location.text);
                              Navigator.of(context).pop();
                            },
                            child: const Text('Submit'),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )),
                              elevation: MaterialStateProperty.all(10.0),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.black),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(horizontal: 20)),
                              minimumSize:
                                  MaterialStateProperty.all(const Size(150, 40)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
