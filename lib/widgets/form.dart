import 'package:clubz/widgets/alertdialogforzeform.dart';
import 'package:flutter/material.dart';

class Sampleform extends StatefulWidget {
  @override
  _SampleformState createState() => _SampleformState();
}

class _SampleformState extends State<Sampleform> {
  String? returnedimage;
  void getimage(String image) {
    setState(() {
      returnedimage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: RaisedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertForZeForm();
                  },
                );
              },
              child: const Text("Open Popup"),
            ),
          ),
          returnedimage == null
              ? const Center(
                  child: Text(
                    'Select an Image',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(returnedimage as String),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
