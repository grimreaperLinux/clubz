import 'package:clubz/widgets/announcement.dart';
import 'package:flutter/material.dart';

class AnnouncementScreen extends StatelessWidget {
  static const routename = '/announcements';
  @override
  Widget build(BuildContext context) {
    double widthofscreen = MediaQuery.of(context).size.width;
    double heightofscreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: widthofscreen * 0.04),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, heightofscreen * 0.15,
                    widthofscreen * 0.4, heightofscreen * 0.04),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Notifications',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              AnnouncementCard(),
              AnnouncementCard(),
              AnnouncementCard(),
              AnnouncementCard(),
              AnnouncementCard(),
              AnnouncementCard(),
              AnnouncementCard(),
              AnnouncementCard(),
            ],
          ),
        ),
      ),
    );
  }
}
