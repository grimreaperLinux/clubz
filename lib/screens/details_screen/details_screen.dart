import 'package:clubz/widgets/createannouncement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../models/club.dart';

class DetailsScreen extends StatelessWidget {
  static const routename = '/details';
  @override
  Widget build(BuildContext context) {
    final club = ModalRoute.of(context)!.settings.arguments as Club;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0).r,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 40.h,
                    width: 40.h,
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new),
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(Icons.people_alt_rounded),
                      onPressed: () {},
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                width: 320.w,
                height: 200.h,
                child: ClipRRect(
                  child: Image.network(
                    club.clubpic,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  club.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  club.type,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  club.description,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (
                      BuildContext context,
                    ) {
                      return ChangeNotifierProvider.value(
                        value: club,
                        child: AnnouncementForm(),
                      );
                    },
                  );
                },
                child: Text('Create a New Announcement'),
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
              ),
              SizedBox(
                height: 15.h,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Join The Club'),
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
              ),
              SizedBox(
                height: 15.h,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('View All Announcements'),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
