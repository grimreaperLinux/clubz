import 'package:clubz/models/anouncement.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnnouncementCard extends StatelessWidget {
  final String owner;
  AnnouncementCard({required this.owner});

  @override
  Widget build(BuildContext context) {
    final announcement = Provider.of<Announcement>(context);
    final users = Provider.of<UserList>(context, listen: false);
    final user = users.items.firstWhere(((element) => element.id == owner));
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
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1331&q=80'),
                    radius: 15.r,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      user.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  Text(
                    DateFormat.yMMMd()
                        .format(DateTime.parse(announcement.timestamp)),
                    style: TextStyle(fontWeight: FontWeight.w800),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(announcement.description,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
