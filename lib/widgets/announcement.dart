import 'package:flutter/material.dart';

class AnnouncementCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        elevation: 8.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'A club name',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'The announcement about some dumb shit and very annoying shit and dajhfuigfuihfuha fuqugd uqguigfuagaafugaudgasudfdgauifgaufuiahfuigfudfud',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
