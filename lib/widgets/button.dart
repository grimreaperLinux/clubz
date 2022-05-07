import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Future<void> onpress;
  final String text;

  Button({required this.onpress, required this.text});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        onpress;
      },
      child: Text(text),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          )),
          elevation: MaterialStateProperty.all(10.0),
          shadowColor: MaterialStateProperty.all(Colors.black),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 20)),
          minimumSize: MaterialStateProperty.all(const Size(300, 40)),
          backgroundColor: MaterialStateProperty.all(Colors.green)),
    );
  }
}
